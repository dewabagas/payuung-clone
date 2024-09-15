import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/shared/others/initials_avatar.dart';

class ProfileHeaderSection extends StatefulWidget {
  const ProfileHeaderSection({super.key});

  @override
  State<ProfileHeaderSection> createState() => _ProfileHeaderSectionState();
}

class _ProfileHeaderSectionState extends State<ProfileHeaderSection> {
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  Future<void> _showImageSourceSelection(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil dari Kamera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    if (pickedFile != null) {
                      _profileImage = pickedFile;
                    }
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Pilih dari Galeri'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    if (pickedFile != null) {
                      _profileImage = pickedFile;
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            _profileImage != null
                ? CircleAvatar(
                    radius: 40.w,
                    backgroundImage: FileImage(
                      File(_profileImage!.path),
                    ),
                  )
                : const InitialsAvatar(name: 'Bagas Dewangono'),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => _showImageSourceSelection(context),
                child: CircleAvatar(
                  radius: 10.w,
                  backgroundColor: AppColors.lightGrey2,
                  child: Icon(
                    Icons.camera_alt,
                    size: 10.w,
                    color: AppColors.grey3,
                  ),
                ),
              ),
            ),
          ],
        ),
        10.0.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bagas Dewanggono', style: TextStyles.semibold14),
            2.0.height,
            Text('Masuk reguler dengan email', style: TextStyles.regular12)
          ],
        ),
      ],
    );
  }
}
