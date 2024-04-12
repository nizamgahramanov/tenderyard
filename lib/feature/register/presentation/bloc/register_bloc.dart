part of 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterAsIndividual registerAsIndividual;
  final RegisterAsIndividualOwner registerAsIndividualOwner;
  final RegisterAsJuridicalPerson registerAsJuridicalPerson;
  RegisterBloc({
    required this.registerAsIndividual,
    required this.registerAsIndividualOwner,
    required this.registerAsJuridicalPerson,
  }) : super(RegisterState()) {
    on<RegisterAsJuridicalPersonClicked>(_registerAsJuridicalPerson);
    on<TileSelectedEvent>(_tileSelected);
    on<FieldSelecteEvent>(_fieldSelected);
    on<UpdateFieldEvent>(_updateField);
  }

  Future<void> _registerAsJuridicalPerson(
      RegisterAsJuridicalPersonClicked event, emit) async {
    try {
      registerAsJuridicalPerson.call(Params(
          userDataModel: UserDataModel(
        name: state.fieldTexts[1] ?? '',
        email: state.fieldTexts[2] ?? '',
        phoneNumber: state.fieldTexts[3] ?? '',
        address: state.fieldTexts[4] ?? '',
        voen: state.fieldTexts[5] ?? '',
        activityArea: state.fieldTexts[6] ?? '',
        interestCategory: state.fieldTexts[7] ?? '',
        logo: state.fieldTexts[8] ?? '',
      )));
    } on Error {}
  }

  FutureOr<void> _tileSelected(
      TileSelectedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  FutureOr<void> _fieldSelected(
      FieldSelecteEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(selectedFieldIndex: event.selectedFieldIndex));
  }

  FutureOr<void> _updateField(
      UpdateFieldEvent event, Emitter<RegisterState> emit) {
    final Map<int, String> updatedFieldTexts = Map.from(state.fieldTexts);
    updatedFieldTexts[event.id] = event.value;
    emit(state.copyWith(fieldTexts: updatedFieldTexts));
    if (event.value.isEmpty) {
      updatedFieldTexts.remove(event.id);
      emit(state.copyWith(fieldTexts: updatedFieldTexts));
    }
  }
}
