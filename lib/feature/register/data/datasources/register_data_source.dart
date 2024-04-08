import 'package:tenderyard/core/api_client/api_client.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';


abstract class RegisterDataSource {
  Future<ApiResponse> registerAsIndividual(UserDataModel userDataModel);
  Future<ApiResponse> registerAsIndividualOwner(UserDataModel userDataModel);
  Future<ApiResponse> registerAsJuridicalPerson(UserDataModel userDataModel);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  RegisterDataSourceImpl();
  @override
  Future<ApiResponse> registerAsIndividual(UserDataModel userDataModel) async {
    return await ApiClient().registerAsIndividual(userDataModel);
  }

    @override
  Future<ApiResponse> registerAsIndividualOwner(UserDataModel userDataModel) async {
    return await ApiClient().registerAsIndividualOwner(userDataModel);
  }
    @override
  Future<ApiResponse> registerAsJuridicalPerson(UserDataModel userDataModel) async {
    return await ApiClient().registerAsJuridicalPerson(userDataModel);
  }
}
