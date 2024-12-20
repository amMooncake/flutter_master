import 'models/user.dart';

abstract class UserRepository {
  Stream<MyUser> get user;

  Future<MyUser> SignUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser myUser);

  Future<void> SignIn(String email, String password);

  Future<void> LogOut();
}
