import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:assignment_four/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    PermissionStatus permission = await Permission.contacts.request();
    if (permission.isGranted) {
      List<Contact> contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        this.contacts = contacts;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeScreenTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(AppLocalizations.of(context)!.welcomeMessage),
          ),
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            child: Text(AppLocalizations.of(context)!.selectFromGallery),
          ),
          ElevatedButton(
            onPressed: _takePicture,
            child: Text(AppLocalizations.of(context)!.takePicture),
          ),
          _image == null
              ? Text(AppLocalizations.of(context)!.noImageSelected)
              : Image.file(_image!),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                Contact contact = contacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(
                    contact.phones?.isNotEmpty == true
                        ? contact.phones!.first.value ?? ''
                        : '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
