import '../../../domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? id;
  String? profilePic;

  UserModel({
    this.fullName,
    this.email,
    this.id,
    this.profilePic,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    email = json['email'];
    id = json['id'];
    profilePic = json['profilePic'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: id,
      fullName: fullName,
      email: email,
      profilePic: profilePic,
    );
  }
}
