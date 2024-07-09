import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_app/services/image_service.dart';

void showProfilePictureOptions(BuildContext context) {
  final ImageService imageService = ImageService();

  showModalBottomSheet(
    context: context,
    builder: (context) => Wrap(
      children: [
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text('Select from Gallery'),
          onTap: () async {
            final image = await imageService.pickImage(ImageSource.gallery);
            if (image != null) {
              // Handle selected image
            }
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('Take a Picture'),
          onTap: () async {
            final image = await imageService.pickImage(ImageSource.camera);
            if (image != null) {
              // Handle captured image
            }
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
