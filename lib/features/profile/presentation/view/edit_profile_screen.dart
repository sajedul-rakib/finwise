import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/core/widgets/app_switch_btn.dart';
import 'package:finwise/core/widgets/image_viewer.dart';

import '../../../signup/domain/entities/user_entity.dart';
import '../riverpod/profile_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  // State for switches
  bool _notificationsIsActive = true;
  bool _isDarkMode = false;

  // Controllers for form fields
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();

    // Solution for the "Tried to modify a provider while the widget tree was building" error
    Future.microtask(() {
      ref.read(profileControllerProvider.notifier).loadProfile();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watching the profile state (AsyncValue<UserModel>)
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit My Profile"), centerTitle: true),
      body: profileState.when(
        data: (user) {
          // Sync controllers with data if they are empty
          if (_nameController.text.isEmpty) {
            _nameController.text = user?.fullName ?? "Guest";
          }
          if (_phoneController.text.isEmpty) {
            _phoneController.text = user?.mobileNumber ?? '01500000000';
          }
          if (_emailController.text.isEmpty) {
            _emailController.text = user?.email ?? 'example@gmail.com';
          }

          return _buildBody(user);
        },
        error: (error, stack) => Center(child: Text("Error: $error")),
        loading: () => _buildShimmerEffect(),
      ),
    );
  }

  Widget _buildBody(dynamic user) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Main Form Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: AppColors.honeydewGreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              "Account Settings",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGreenColor,
                              ),
                            ),
                            FormInput(
                              controller: _nameController,
                              labelText: "Username",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            FormInput(
                              controller: _phoneController,
                              labelText: "Phone",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            FormInput(
                              controller: _emailController,
                              labelText: "Email Address",
                              readOnly: true, // Email usually read-only
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            AppSwitchBtn(
                              title: "Push Notifications",
                              value: _notificationsIsActive,
                              onChanged: (val) =>
                                  setState(() => _notificationsIsActive = val),
                            ),
                            AppSwitchBtn(
                              title: "Turn Dark Theme",
                              value: _isDarkMode,
                              onChanged: (val) =>
                                  setState(() => _isDarkMode = val),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AppButton(
                          title: "Update Profile",
                          onPressed: () {
                            // Logic to call repository update
                            log("Updating: ${_nameController.text}");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Profile Header
              Positioned(top: -60, child: _buildProfileImageHeader(user)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImageHeader(dynamic user) {
    final bool hasAvatar = user.avatar != null && user.avatar!.isNotEmpty;

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.honeydewGreen,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: hasAvatar
                    ? CachedNetworkImage(
                        imageUrl: user.avatar!,
                        fit: BoxFit.cover,
                        // 1. The Shimmer effect while loading
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(color: Colors.white),
                        ),
                        // 2. The Fallback to Initials if the URL is broken
                        errorWidget: (context, url, error) =>
                            _buildInitialsView(user),
                      )
                    : _buildInitialsView(user),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: GestureDetector(
                onTap: _showImageSourceDialog,
                child: Container(
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.caribbeanGreen,
                  ),
                  child: ImageViewer(
                    imagePath: "assets/images/icons/camera.png",
                    color: AppColors.textGreenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          user.fullName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textGreenColor,
          ),
        ),
        Text(
          "ID: ${user.userId}",
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textGreenColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 60, backgroundColor: Colors.white),
          const SizedBox(height: 12),
          Container(height: 20, width: 150, color: Colors.white),
          const SizedBox(height: 8),
          Container(height: 15, width: 100, color: Colors.white),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... [Keep your _showImageSourceDialog, _pickImage, and _showPreviewDialog as they were] ...
  Future<void> _showImageSourceDialog() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (image != null) {
        _showPreviewDialog(File(image.path));
      }
    } on PlatformException catch (e) {
      log("Platform exception: ${e.code}");
    } catch (e) {
      log("Error picking image: $e");
    }
  }

  void _showPreviewDialog(File imageFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.honeydewGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(imageFile, height: 250, fit: BoxFit.cover),
              ),
              AppButton(
                onPressed: () {
                  ref
                      .read(profileControllerProvider.notifier)
                      .changeAvatar(imageFile);
                },
                title: "Upload",
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }

  String getInitials(String? name) {
    if (name == null || name.trim().isEmpty) return "U";

    // Split by space and remove empty strings
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.length >= 2) {
      // Take first letter of first and last name
      return (parts.first[0] + parts.last[0]).toUpperCase();
    }
    // If only one name, take the first letter
    return parts.first[0].toUpperCase();
  }

  Widget _buildInitialsView(UserEntity user) {
    return Center(
      child: Text(
        getInitials(user.fullName),
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.textGreenColor,
        ),
      ),
    );
  }
}
