class Profile {
  final int id;
  final String photo;
  final String name;
  final String email;
  final String phone;
  final int totalPoint;
  final String birthDate;
  final String gender;
  final String address;
  final bool isEmailVerified;
  final bool isPhoneVerified;

  Profile({
    required this.id,
    required this.photo,
    required this.name,
    required this.email,
    required this.phone,
    required this.totalPoint,
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.isEmailVerified,
    required this.isPhoneVerified,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      totalPoint: json['total_point'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      address: json['address'],
      isEmailVerified: json['is_email_verified'] == 1,
      isPhoneVerified: json['is_phone_verified'] == 1,
    );
  }
}
