import 'package:equatable/equatable.dart';

abstract class GetNotesEvent {

}
class NotesLoadedRequested extends GetNotesEvent{

}

class DeleteNoteEvent extends GetNotesEvent{
  final String noteId ;

  DeleteNoteEvent({required this.noteId});

}




