class ContactModel {
  final String name;
  final String phoneNumber;

  ContactModel({required this.name, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
