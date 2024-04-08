import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tenderyard/common/constants.dart';
import 'package:tenderyard/core/api_client/urls.dart';
import 'package:tenderyard/core/error/server_exception.dart';
import 'package:tenderyard/feature/app/app.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';
import 'api_response.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: Urls.baseUrl));

  static final ApiClient _singletone = ApiClient._();

  factory ApiClient() => _singletone;

  ApiClient._() {
    _createInterceptor();
  }
  Dio get dioI => dio;
  _createInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          if (e.type == DioErrorType.badResponse) {
            handler.resolve(e.response!);
          }
        },
        onRequest: (options, handler) async {
          Map<String, dynamic> headers = {
            "Accept": 'application/json',
            'Content-Type': 'application/json',
          };
          options.responseType = ResponseType.json;
          options.headers = headers;
          handler.next(options);
        },
        onResponse: (e, handler) {
          if (e.statusCode == 200) {
            handler.next(e);
          } else {
            throw ServerException(errorMessage: "");
          }
        },
      ),
    );
  }

  Future<ApiResponse> registerAsIndividual(UserDataModel userData) async {
    try {
      var response = await (dioI)
          .post(Urls.registerAsIndividualUrl, data: userData.toJson());

      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioError catch (e) {
      return handleDioError(e);
    } catch (e) {
      return ApiResponse(
        apiResult: ApiResult.Error,
        message: "",
      );
    }
  }

  Future<ApiResponse> registerAsIndividualOwner(UserDataModel userData) async {
    try {
      var response = await (dioI)
          .post(Urls.registerAsIndividualOwner, data: userData.toJson());

      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioError catch (e) {
      return handleDioError(e);
    } catch (e) {
      return ApiResponse(
        apiResult: ApiResult.Error,
        message: "",
      );
    }
  }

  Future<ApiResponse> registerAsJuridicalPerson(UserDataModel userData) async {
    try {
      debugPrint(userData.toJson().toString());
      var response = await (dioI)
          .post(Urls.registerAsJuridicalPerson, data: userData.toJson());

      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioError catch (e) {
      return handleDioError(e);
    } catch (e) {
      return ApiResponse(
        apiResult: ApiResult.Error,
        message: "",
      );
    }
  }
}

void handleTokenExpiration() {
  Navigator.pushNamedAndRemoveUntil(
      App.navigatorKey.currentContext!, Screens.register, (route) => false);
}

ApiResponse handleDioError(DioError e) {
  switch (e.type) {
    case DioExceptionType.badResponse:
      if (e.response?.statusCode == 401) {
        handleTokenExpiration();
        return ApiResponse(
            apiResult: ApiResult.Error, message: "Sessiya müddəti bitmişdir");
      } else if (e.response?.statusCode == 400 ||
          e.response?.statusCode == 404) {
        return ApiResponse.fromJson(e.response?.data);
      }
      return ApiResponse(
          apiResult: ApiResult.Error, message: "Serverdə xəta baş verdi");

    case DioExceptionType.connectionTimeout:
      return ApiResponse(
          apiResult: ApiResult.Error, message: "Bağlantı vaxtı bitmişdir");

    case DioExceptionType.unknown:
      return ApiResponse(
          apiResult: ApiResult.Error,
          message:
              "Xəta baş verdi. Lütfən internet bağlantısını yoxlayıb tətbiqi yenidən açın");

    default:
      return ApiResponse(
          apiResult: ApiResult.Error,
          message:
              "Xəta baş verdi. Lütfən internet bağlantısını yoxlayıb tətbiqi yenidən açın");
  }
}
