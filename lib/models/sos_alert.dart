class SOSAlert {
  final String id;
  final String userId;
  final String userName;
  final String userPhone;
  final double latitude;
  final double longitude;
  final String address;
  final DateTime timestamp;
  final SOSType type;
  final String? message;
  final String? audioUrl;
  final SOSStatus status;
  final List<String> respondersIds;

  SOSAlert({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.timestamp,
    required this.type,
    this.message,
    this.audioUrl,
    this.status = SOSStatus.active,
    this.respondersIds = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'timestamp': timestamp.toIso8601String(),
      'type': type.toString().split('.').last,
      'message': message,
      'audioUrl': audioUrl,
      'status': status.toString().split('.').last,
      'respondersIds': respondersIds,
    };
  }

  factory SOSAlert.fromMap(Map<String, dynamic> map) {
    return SOSAlert(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPhone: map['userPhone'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      type: SOSType.values.firstWhere(
        (e) => e.toString().split('.').last == map['type'],
        orElse: () => SOSType.text,
      ),
      message: map['message'],
      audioUrl: map['audioUrl'],
      status: SOSStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => SOSStatus.active,
      ),
      respondersIds: List<String>.from(map['respondersIds'] ?? []),
    );
  }
}

enum SOSType { text, voice }

enum SOSStatus { active, resolved, cancelled }