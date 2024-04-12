part of 'bloc.dart';

abstract class RegisterEvent {}

class RegisterAsIndividualClicked extends RegisterEvent {}
class RegisterAsIndividualOwnerClicked extends RegisterEvent {}
class RegisterAsJuridicalPersonClicked extends RegisterEvent {}

class TileSelectedEvent extends RegisterEvent {
  final int selectedIndex;

  TileSelectedEvent(this.selectedIndex);
}

class FieldSelecteEvent extends RegisterEvent {
  final int selectedFieldIndex;

  FieldSelecteEvent(this.selectedFieldIndex);
}

class UpdateFieldEvent extends RegisterEvent {
  final int id;
  final String value;

  UpdateFieldEvent(this.id, this.value);
}
