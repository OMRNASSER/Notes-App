

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_firebase/logic/login/login_event.dart';
import 'package:notes_app_firebase/logic/login/login_state.dart';

class LoginBloc extends Bloc<LoginButtonPressed, LoginState>{
  final FirebaseAuth auth;
  LoginBloc( this.auth,super.initialState){
    on<LoginButtonPressed>((event , emit) async{
      emit(LoginLoadingState());

      try {
        await auth.signInWithEmailAndPassword(email: event.email, password: event.password);
        emit(LoginSuccess());

      }on FirebaseAuthException catch(e){
        
        emit(LoginErrorState(e.message ?? "an error ocurred!")); 

      }catch(e){
        
        emit(LoginErrorState("Something Went Wrong"));

      }
    });

  }

}