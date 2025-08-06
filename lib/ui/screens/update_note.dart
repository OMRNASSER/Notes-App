import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_firebase/core/color_manager.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_event.dart';
import 'package:notes_app_firebase/logic/create_note/create_note_state.dart';

import '../../logic/create_note/create_note_bloc.dart';
import '../../models/notes_model.dart';

class UpdateNoteScreen extends StatefulWidget {
  final Note note;

  UpdateNoteScreen(this.note);

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  late TextEditingController headlineController;

  late TextEditingController descriptionController;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    // TODO: implement initState
    headlineController = TextEditingController(text: widget.note.title);
    descriptionController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNoteBloc, CreateNoteState>(
      listener: (context, state) {
        if (state is EditNoteStateLoading) {
          Center(child: CircularProgressIndicator());
        } else if (state is EditNoteStateSuccess) {

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note Successful Updated")));
          Navigator.pop(context);
        } else if (state is EditNoteStateError) {
          Center(child: Text("Error Occured"));
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Update New Note',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Head line',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: headlineController,
                    decoration: InputDecoration(
                      hintText: "Enter Note Address",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,

                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 22),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Enter Your Description",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,

                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Media picker
                      },
                      child: Text('Select Media'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final title = headlineController.text;
                        final content = descriptionController.text;
                        final Note updatedNote = Note(

                          userId: user.uid,
                          title: title,
                          content: content,
                          createdAt: Timestamp.now(),
                        );

                        if (title.isNotEmpty && content.isNotEmpty) {
                          context.read<CreateNoteBloc>().add(
                            EditNoteButtonPressed(updatedNote),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Noted Updated Successfully")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fill all fields")),
                          );
                        }
                      },
                      child: Text('Update'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
