import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_firebase/core/color_manager.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_bloc.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_state.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_bloc.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_event.dart';
import 'package:notes_app_firebase/logic/get_note/get_note_state.dart';
import 'package:notes_app_firebase/ui/screens/update_note.dart';

import '../../models/notes_model.dart';
import 'new_note.dart';



class NotesHomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            BlocProvider(create: (_) =>
                                CreateNoteBloc(FirebaseFirestore.instance),
                              child: CreateNoteScreen(),),
                        )).then((_)=> context.read<GetNotesBloc>().add(NotesLoadedRequested()));
                      },
                      child: Text("Add Note"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Log out logic
                      },
                      child: Text("Log out"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              BlocBuilder<GetNotesBloc, GetNotesState>(
                  builder: (context, state) {
                    if (state is GetNotesLoading) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if (state is GetNotesLoaded) {
                      final notes = state.notes;

                      if (notes.isEmpty) {
                        return Center(
                            child: Text("We don't have any notes "));
                      }


                      return  Expanded(
                        child: ListView.separated(
                          itemCount: notes.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final note = notes[index];
                            return GestureDetector(
                              onTap: (){
                                print(note.id);
                                Navigator.push(context, MaterialPageRoute(builder: (context )=>  BlocProvider(create: (_) =>
                                    CreateNoteBloc(FirebaseFirestore.instance),
                                  child: UpdateNoteScreen(note),),
                                ));

                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            note.title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            note.content,
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                        "${note.createdAt.toDate().hour.toString().padLeft(2, '0')} : ${note.createdAt.toDate().minute.toString().padLeft(2,'0')}",
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 10,
                                          ),
                                        ),
                                        IconButton(onPressed: ()=>context.read<GetNotesBloc>().add(DeleteNoteEvent(noteId: note.id!)), icon:Icon(Icons.delete), color: Colors.red,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );

                    }
                    else if(state is GetNotesError){

                      return Center(child: Text("Something went wrong! ${state.message}"),);
                    }else{
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
