import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A simpler utility class for image picking
class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  /// Shows a dialog for choosing between camera or gallery then picks an image
  static Future<File?> pickImage(BuildContext context) async {
    try {
      // Show bottom sheet instead of dialog for better UX
      final source = await _showImageSourceBottomSheet(context);

      if (source == null) {
        return null;
      }

      // Pick image directly without showing loading indicator
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }

      return null;
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  /// Shows a bottom sheet for choosing image source
  static Future<ImageSource?> _showImageSourceBottomSheet(
    BuildContext context,
  ) async {
    return await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
