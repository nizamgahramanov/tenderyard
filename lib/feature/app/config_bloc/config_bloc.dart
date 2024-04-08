part of 'bloc.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigInitial()) {
    on<InitApp>(_initApp);
  }

  Future<void> _initApp(InitApp event, emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AppInitialized());
  }
}
