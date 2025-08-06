import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_event.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_state.dart';
import 'package:notes_app_firebase/models/notes_model.dart';

class GetNotesBloc extends Bloc<GetNotesEvent, GetNotesState> {
  final FirebaseFirestore firestore;
  final user = FirebaseAuth.instance.currentUser!;
  GetNotesBloc(this.firestore) : super(GetNotesInitialState()) {
    on<NotesLoadedRequested>((event, emit) async {
      emit(GetNotesLoading());

      try {
        final snapshot = await firestore.collection("notes").where("userId" , isEqualTo:  user.uid).get();
        final notes =
        snapshot.docs.map((doc) => Note.fromJson(doc.data(), doc.id)).toList();
        emit(GetNotesLoaded(notes));
      } catch (e) {
        emit(GetNotesError("Failed to load data"));
      }


    }



    );
    on<DeleteNoteEvent>((event, emit)async{
      emit(DeleteNoteLoading());
      try{
        await firestore.collection("notes").doc(event.noteId).delete();
        emit(DeleteNoteSuccess());
        add(NotesLoadedRequested());

      }catch(e){
        emit(DeleteNoteError("Failed to Delete!"));

      }
    });

  }
}
