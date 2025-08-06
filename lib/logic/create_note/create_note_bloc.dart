
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_event.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_state.dart';

import '../../models/notes_model.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState>{
  final FirebaseFirestore firestore ;
  final user = FirebaseAuth.instance.currentUser!; 
  CreateNoteBloc(this.firestore):super(CreateNoteInitialState()){
    on<CreateNoteButtonPressed>((event, emit)async{
      emit(CreateNoteLoading());
      try{

        await firestore.collection("notes").add(event.note.toJson());
        emit(CreateNoteSuccessState());

      }catch(e){
        emit(CreateNoteErrorState("Something Went Wrong"));

      }
    });
    on<EditNoteButtonPressed>((event, emit) async{
      emit(EditNoteStateLoading());
      try{

      final noteId = event.note.id; 
        await  firestore.collection("notes").doc(noteId).update(event.note.toJson());
        emit(EditNoteStateSuccess());

      }catch(e){
        emit(EditNoteStateError("Something went wrong can not update note!"));

      }
    });
  }



}