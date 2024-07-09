import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactService {
  Future<void> requestContactsPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Permission granted
    } else {
      // Handle the case where permission is not granted
    }
  }

  Future<List<Contact>> getContacts() async {
    return (await ContactsService.getContacts()).toList();
  }
}
