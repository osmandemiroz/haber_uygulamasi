// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60.w,
                backgroundImage:
                    _imagePath != null ? FileImage(File(_imagePath!)) : null,
                child:
                    _imagePath == null ? Icon(Icons.person, size: 60.w) : null,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Profil Fotoğrafı Seç'),
            ),
          ],
        ),
      ),
    );
  }
}
