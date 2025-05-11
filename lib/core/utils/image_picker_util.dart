import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

/// A simpler utility class for image picking
class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  /// Pick an image directly from gallery without showing a selection dialog
  static Future<File?> pickImageFromGallery(BuildContext context) async {
    // Check if running on desktop Windows - not fully supported by image_picker
    if (!kIsWeb && Platform.isWindows) {
      // For Windows, provide a more specific message about the platform limitation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Image picking is not supported on Windows. Please test on a mobile device or emulator.',
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );

      // Return a test image for Windows development
      return _getTestImage();
    }

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        // Validate file exists
        if (await file.exists()) {
          return file;
        }
      }
      return null;
    } catch (e) {
      print('Error picking image from gallery: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not access gallery: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return null;
    }
  }

  /// Shows a dialog for choosing between camera or gallery then picks an image
  static Future<File?> pickImage(BuildContext context) async {
    // Check if running on desktop Windows - not fully supported by image_picker
    if (!kIsWeb && Platform.isWindows) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Image picking is not fully supported on Windows. Try using a mobile device or emulator.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return _getTestImage();
    }

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
        final file = File(pickedFile.path);
        // Validate file exists before returning
        if (await file.exists()) {
          return file;
        } else {
          print('Image file exists check failed: ${pickedFile.path}');
        }
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

  /// Creates a placeholder test image for Windows development
  static Future<File?> _getTestImage() async {
    try {
      // On Windows, we can't use the image picker, so we'll provide feedback
      print('Platform not supported for image picking. Using placeholder.');

      // Since this is Windows, we can't really pick an image naturally
      // You might consider adding a test image to your assets and using that instead
      // during Windows development, for example:

      // For development/testing purposes only
      try {
        // Try to create a simple text file as a placeholder for testing
        final Directory tempDir = Directory.systemTemp;
        final File tempFile = File('${tempDir.path}/placeholder_image.txt');
        await tempFile.writeAsString(
          'This is a placeholder for testing on Windows',
        );

        print('Created placeholder file at: ${tempFile.path}');
        if (await tempFile.exists()) {
          return tempFile;
        }
      } catch (e) {
        print('Error creating placeholder file: $e');
      }

      return null;
    } catch (e) {
      print('Error creating test image: $e');
      return null;
    }
  }
}
