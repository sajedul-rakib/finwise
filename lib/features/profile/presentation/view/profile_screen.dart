import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/features/profile/data/datasource/screen_items_data.dart';
import 'package:finwise/features/profile/data/models/screen_item_model.dart';
import 'package:finwise/features/profile/presentation/riverpod/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../signup/domain/entities/user_entity.dart';
import '../widgets/item_card.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    ref.read(profileControllerProvider.notifier).loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
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
                    children: [
                      const SizedBox(height: 60),
                      Expanded(
                        child: ListView.builder(
                          itemCount: ScreenItemsData.screenItemsData.length,
                          itemBuilder: (context, index) {
                            final item = ScreenItemsData.screenItemsData[index];
                            ScreenItemModel screenItemModel =
                                ScreenItemModel.fromJson(item);
                            return ItemCard(screenItemModel: screenItemModel);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -60,
                  child: Consumer(
                    builder: (context, ref, _) {
                      // 1. Watch the state from your controller
                      final profileState = ref.watch(profileControllerProvider);

                      // 2. Use .when to handle Loading, Error, and Data states
                      return profileState.when(
                        loading: () => const Loader(),
                        error: (error, stack) => Text('Error: $error'),
                        data: (user) {
                          // If data is null, show a fallback
                          if (user == null) return const Text("No User Data");

                          //check has image
                          final bool hasAvatar =
                              user.avatar != null && user.avatar!.isNotEmpty;

                          return Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.honeydewGreen,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
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
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          // 2. The Fallback to Initials if the URL is broken
                                          errorWidget: (context, url, error) =>
                                              _buildInitialsView(user),
                                        )
                                      : _buildInitialsView(user),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // 4. Access the dynamic Full Name
                              Text(
                                user.fullName ?? "Guest User",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGreenColor,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Email: ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textGreenColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      // 5. Access the dynamic User ID
                                      text: user.email,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
