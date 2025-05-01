class Notif {
  final int id;
  final String title;
  final String message;
  final String type;
  final bool isBroadcast;
  final bool isRead;
  final DateTime createdAt;

  Notif({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isBroadcast,
    required this.isRead,
    required this.createdAt,
  });

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      type: json['type'],
      isBroadcast: json['is_broadcast'],
      isRead: (json['is_read'] == true ||
          json['is_read'] == 1), // handle boolean atau int 0/1
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'is_broadcast': isBroadcast,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
