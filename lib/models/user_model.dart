class StoreUserModel {
  final bool success;
  final String message;
  final String token;
  final String tokenType;
  final int expiresIn;
  final UserData data;

  const StoreUserModel({
    required this.success,
    required this.message,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
    required this.data,
  });

  factory StoreUserModel.fromJson(Map<String, dynamic> json) {
    return StoreUserModel(
      success: json['success'],
      message: json['message'],
      token: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  const UserData({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
