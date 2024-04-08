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
    on<UpdateFieldEvent>(_updateField);
  }

  Future<void> _registerAsJuridicalPerson(
      RegisterAsJuridicalPersonClicked event, emit) async {
    try {
      debugPrint("Clicked");
      debugPrint(state.email);
      registerAsJuridicalPerson.call(Params(
          userDataModel: UserDataModel(
        name: state.name,
        email: state.email,
        phoneNumber: state.phoneNumber,
        address: state.address,
        voen: state.voen,
        activityArea: state.activityArea,
        interestCategory: state.interestCategory,
        logo: state.logo,
      )));
    } on Error {}
  }

  FutureOr<void> _tileSelected(
      TileSelectedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  FutureOr<void> _updateField(
      UpdateFieldEvent event, Emitter<RegisterState> emit) {
    debugPrint(event.value);
    switch (event.id) {
      case 1:
      debugPrint("asdas");
        emit(state.copyWith(name: event.value));
        break;
      case 2:
        emit(state.copyWith(email: event.value));
        break;
      case 3:
        emit(state.copyWith(phoneNumber: event.value));
        break;
      case 4:
        emit(state.copyWith(address: event.value));
        break;
      case 5:
        emit(state.copyWith(voen: event.value));
        break;
      case 6:
        emit(state.copyWith(activityArea: event.value));
        break;
      case 7:
        emit(state.copyWith(interestCategory: event.value));
        break;
      case 8:
        emit(state.copyWith(logo: event.value));
        break;
    }
  }
}
