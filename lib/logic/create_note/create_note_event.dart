import 'package:equatable/equatable.dart';

import '../../models/notes_model.dart';

abstract class CreateNoteEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class CreateNoteButtonPressed extends CreateNoteEvent {
  final Note note;

  CreateNoteButtonPressed({required this.note});
  @override
  // TODO: implement props
  List<Object?> get props => [note];
}
class EditNoteButtonPressed extends CreateNoteEvent{
  final Note note;

  EditNoteButtonPressed(this.note);

  @override
  // TODO: implement props
  List<Object?> get props => [note];
}

