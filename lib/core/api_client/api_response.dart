enum ApiResult { Loading, Success, Error, Canceled }

class ApiResponse {
  ApiResponse({required this.apiResult, required this.message,this.data});
  late ApiResult apiResult;
  late String message;
  dynamic data;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    apiResult =
    json['success'] == true ? ApiResult.Success : ApiResult.Error;
    message = json['success'] == false
        ? (json['message'] ??
        "Xəta baş verdi. Biraz sonra yenidən cəhd edin")
        : "";
    data = json['data'];
  }
}