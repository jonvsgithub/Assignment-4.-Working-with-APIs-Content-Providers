import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:your_app/services/contact_service.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final ContactService contactService = ContactService();
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    await contactService.requestContactsPermission();
    final fetchedContacts = await contactService.getContacts();
    setState(() {
      contacts = fetchedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: contacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName ?? 'No name'),
            subtitle: Text(contact.phones?.first.value ?? 'No phone'),
          );
        },
      ),
    );
  }
}
