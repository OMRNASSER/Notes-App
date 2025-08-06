

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_firebase/logic/signup/signup_events.dart';
import 'package:notes_app_firebase/logic/signup/signup_state.dart';

class SignUpBloc extends Bloc<SignUpButtonPressed, SignUpState>{
  final FirebaseAuth auth ;

  SignUpBloc(this.auth): super(SignUpIntialState()){
    on<SignUpButtonPressed>((event , emit) async {
      emit(SignUpLoadingState());

      try {
        await auth.createUserWithEmailAndPassword(email: event.email, password: event.password);
        emit(SignUpSuccessState());
      }on FirebaseAuthException catch(e){

        emit(SignUpErrorState(e.message ?? "an Error occured"));


      }catch(e){

        emit(SignUpErrorState("Something went wrong"));

      }

    });
  }
}