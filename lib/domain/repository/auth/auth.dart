import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<void> signin();

  Future<Either> signup(CreateUserReq createUserReq);
}
