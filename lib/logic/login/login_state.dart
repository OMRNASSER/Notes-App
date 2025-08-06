abstract class LoginState{}
class LoginIntialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginErrorState extends LoginState{
  final  String message ;
  LoginErrorState(this.message);

}

