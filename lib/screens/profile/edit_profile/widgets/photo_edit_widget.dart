import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/assets_gen/assets.gen.dart';

class PhotoEditWidget extends StatelessWidget {
  final String? imageUrl;
  final Rxn<File> profileImage = Rxn<File>();
  final Function(File file)? onImagePicked;

  PhotoEditWidget({
    super.key,
    this.imageUrl,
    this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // The Circular Profile Image
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.r,
                color: AppColors.greenPrimary,
              ),
            ),
            child: ClipOval(
              child: Obx(() => _buildProfileImage()),
            ),
          ),

          // The Edit Icon Button
          _EditIcon(
            size: 34.r,
            iconSize: 18.r,
            onTap: _pickImage,
          ),
        ],
      ),
    );
  }

  // Logic to decide whether to show File, Network URL, or Placeholder
  Widget _buildProfileImage() {
    if (profileImage.value != null) {
      return Image.file(profileImage.value!, fit: BoxFit.cover);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(color: Colors.white),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(
            Icons.person,
            size: 70.r,
            color: Colors.white,
          ),
        ),
      );
    }
    //return Icon(Icons.person, size: 50.r, color: Colors.grey);
    return Icon(
      Icons.person,
      size: 70.r,
      color: Colors.white,
    );
  }

  // Image Picker Logic
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final file = File(picked.path);
      profileImage.value = file;

      if (onImagePicked != null) {
        onImagePicked!(file);
      }
    }
  }
}

// Reusable Edit Icon Widget
class _EditIcon extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final double iconSize;

  const _EditIcon({
    required this.onTap,
    required this.size,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.camera_alt_rounded,
          size: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}