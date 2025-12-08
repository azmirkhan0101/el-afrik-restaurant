import 'dart:io';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {

  final Function(File?) onClick;

  const ProfileAvatar({super.key, required this.onClick});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.w,
          width: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 2),
            color: _selectedImage == null ? const Color(0xFFFAFAFA) : null,
            image: _selectedImage != null
                ? DecorationImage(
                    image: FileImage(_selectedImage!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _selectedImage == null
              ? Center(
                  child: Icon(Icons.person, color: AppColors.grey72, size: 75.r,)
                )
              : null,
        ),

        /// small "+" button at bottom right
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 32.w,
              width: 32.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.orange,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      widget.onClick(File(image.path));
    }
  }
}
