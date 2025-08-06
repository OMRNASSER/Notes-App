abstract class CreateNoteState {

}

class CreateNoteInitialState extends CreateNoteState{}
class CreateNoteLoading extends CreateNoteState{}
class CreateNoteSuccessState extends CreateNoteState{}



class CreateNoteErrorState extends CreateNoteState{
  String message;

  CreateNoteErrorState(this.message);
}
class EditNoteIntialState extends CreateNoteState{

}
class EditNoteStateLoading extends CreateNoteState{

}

class EditNoteStateSuccess extends CreateNoteState{

}
class EditNoteStateError extends CreateNoteState{
 String message ;

 EditNoteStateError(this.message);

}