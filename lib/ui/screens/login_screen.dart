import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_firebase/core/color_manager.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_bloc.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_event.dart';
import 'package:notes_app_firebase/logic/login/login_event.dart';
import 'package:notes_app_firebase/logic/login/login_state.dart';
import 'package:notes_app_firebase/logic/signup/signup_bloc.dart';
import 'package:notes_app_firebase/ui/screens/notes_screen.dart';
import 'package:notes_app_firebase/ui/screens/signup_screen.dart';
import 'package:bloc/bloc.dart';

import '../../logic/login/login_bloc.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context , state){
        if(state is LoginLoadingState){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_)=> Center(child: CircularProgressIndicator())
          );
        }
        if(state is LoginErrorState){
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if(state is LoginSuccess){
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=> BlocProvider(create:(_)=>GetNotesBloc(FirebaseFirestore.instance)..add(NotesLoadedRequested()),
            child: NotesHomeScreen())),
          );
        }
      },
      
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
      
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 90, ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Hi, Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text("Email", style: TextStyle(color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        fillColor: ColorManager.secondryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
      
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text("Password", style: TextStyle(color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        hintText: "******",
                        fillColor: ColorManager.secondryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: MaterialButton(
                      height: 40 ,
                      minWidth: 300,
      
      
                      color: Colors.white,
                      onPressed: () {
                        final email = _email.text.trim();
                        final password = _password.text.trim();
                        if(email.isNotEmpty && password.isNotEmpty){
                          context.read<LoginBloc>().add(LoginButtonPressed(email: email, password: password));

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill all Fields")));
                        }
                      },
                      child: Text('Login'),
      
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: MaterialButton(
                      height: 40 ,
                      minWidth: 300,
      
      
                      color: Colors.white,
                      onPressed: () {
                        /* TODO: handle login */
                      },
                      child: Text('Contine with Google'),
      
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(
                           create: (_)=> SignUpBloc(FirebaseAuth.instance),
                             child: SignUpScreen()) ));
      
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
