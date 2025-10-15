class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final int age;
  final String sex;
  final bool isApproved;
  final bool isAdmin;
  final DateTime registrationDate;
  final double? latitude;
  final double? longitude;
  final bool isOnline;
  final DateTime lastSeen;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.sex,
    this.isApproved = false,
    this.isAdmin = false,
    required this.registrationDate,
    this.latitude,
    this.longitude,
    this.isOnline = false,
    required this.lastSeen,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'age': age,
      'sex': sex,
      'isApproved': isApproved,
      'isAdmin': isAdmin,
      'registrationDate': registrationDate.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'isOnline': isOnline,
      'lastSeen': lastSeen.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      age: map['age']?.toInt() ?? 0,
      sex: map['sex'] ?? '',
      isApproved: map['isApproved'] ?? false,
      isAdmin: map['isAdmin'] ?? false,
      registrationDate: DateTime.parse(map['registrationDate']),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      isOnline: map['isOnline'] ?? false,
      lastSeen: DateTime.parse(map['lastSeen']),
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    int? age,
    String? sex,
    bool? isApproved,
    bool? isAdmin,
    DateTime? registrationDate,
    double? latitude,
    double? longitude,
    bool? isOnline,
    DateTime? lastSeen,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      isApproved: isApproved ?? this.isApproved,
      isAdmin: isAdmin ?? this.isAdmin,
      registrationDate: registrationDate ?? this.registrationDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }
}