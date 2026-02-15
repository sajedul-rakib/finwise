import 'dart:developer';
import 'dart:io';

import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/form_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/app_switch_btn.dart';
import '../../../../core/widgets/image_viewer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _notificationsIsActive = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit My Profile"), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 80),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 20,
                                  children: [
                                    Text(
                                      "Account Settings",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textGreenColor,
                                      ),
                                    ),
                                    FormInput(
                                      hintText: "John Smith",
                                      labelText: "Username",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    FormInput(
                                      hintText: "+880 1234-567890",
                                      labelText: "Phone",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    FormInput(
                                      hintText: "example@gmail.com",
                                      labelText: "Email Address",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    AppSwitchBtn(
                                      title: "Push Notifications",
                                      value: _notificationsIsActive,
                                      onChanged: (val) {
                                        if (_notificationsIsActive == val) {
                                          return;
                                        }
                                        setState(() {
                                          _notificationsIsActive = val;
                                        });
                                      },
                                    ),
                                    AppSwitchBtn(
                                      title: "Turn Dark Theme",
                                      value: _isDarkMode,
                                      onChanged: (val) {
                                        if (_isDarkMode == val) return;
                                        setState(() {
                                          _isDarkMode = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SafeArea(
                              child: AppButton(
                                title: "Update Profile",
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -60,
                  child: Column(
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
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://plus.unsplash.com/premium_photo-1689977807477-a579eda91fa2?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            child: GestureDetector(
                              onTap: _showImageSourceDialog,
                              child: Container(
                                height: 25,
                                width: 25,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.caribbeanGreen,
                                ),
                                child: ImageViewer(
                                  imagePath: "assets/images/icons/camera.png",
                                  color: AppColors.textGreenColor,
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "John Smith",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "ID: ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGreenColor,
                          ),
                          children: [
                            TextSpan(
                              text: "123456",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: AppColors.textGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        imageQuality: 70, // Optimize for mobile storage
      );

      if (image != null) {
        _showPreviewDialog(File(image.path));
      }
    } on PlatformException catch (e) {
      log(
        "Get platform exception while file uploading. The error is ${e.code}",
      );
    } catch (e) {
      log("Get Error while try to upload file. The error is $e");
    }
  }

  void _showPreviewDialog(File imageFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: 24,
          //   vertical: 40,
          // ),
          backgroundColor: AppColors.honeydewGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 30,
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(imageFile)),
                    ),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      AppButton(
                        onPressed: () => Navigator.pop(context),
                        title: "Upload",
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: AppColors.fenceGreen,
                        ),
                      ),
                      AppButton(
                        onPressed: () => Navigator.pop(context),
                        title: "Cancel",
                        bgColor: Colors.red.shade400,
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
