import 'package:flutter/material.dart';
import 'package:your_app/widgets/profile_picture_options.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showProfilePictureOptions(context),
          child: Text('Change Profile Picture'),
        ),
      ),
    );
  }
}
