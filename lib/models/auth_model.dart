import 'package:hive/hive.dart';
part 'auth_model.g.dart';

@HiveType(typeId: 3)
class AuthModel {
  @HiveField(0)
  final String? token;
  AuthModel({
    this.token,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['access_token'],
    );
  }
}
