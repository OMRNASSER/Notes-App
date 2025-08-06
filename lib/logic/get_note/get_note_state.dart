import '../../models/notes_model.dart';

abstract class GetNotesState {

}


class GetNotesInitialState extends GetNotesState{}
class GetNotesLoading extends GetNotesState{}
class GetNotesLoaded extends GetNotesState{
  final List<Note> notes ;

  GetNotesLoaded( this.notes);
}
class GetNotesError extends GetNotesState{

  String message ;

  GetNotesError(this.message);
}



class DeleteNoteInitialState extends GetNotesState{}
class DeleteNoteLoading extends GetNotesState{}
class DeleteNoteSuccess extends GetNotesState{}
class DeleteNoteError extends GetNotesState{
  String message;

  DeleteNoteError(this.message);
}