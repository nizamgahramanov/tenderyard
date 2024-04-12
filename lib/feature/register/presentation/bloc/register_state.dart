part of 'bloc.dart';

class RegisterState {
  final ApiResponse? apiResponse;
  final Map<int, String> fieldTexts;
  final int selectedIndex;
  final int selectedFieldIndex;

  RegisterState({

    this.apiResponse,
    this.fieldTexts=const {},
    this.selectedIndex = -1,
    this.selectedFieldIndex = -1,
  });

  RegisterState copyWith({
    ApiResponse? apiResponse,
    Map<int, String>? fieldTexts,
    int? selectedIndex,
    int? selectedFieldIndex,
  }) {
    return RegisterState(
      apiResponse: apiResponse ?? this.apiResponse,
      fieldTexts: fieldTexts ?? this.fieldTexts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedFieldIndex: selectedFieldIndex ?? this.selectedFieldIndex,
    );
  }
}
