import 'package:iskaan_inspections_mobile/res/enums.dart';

class ApiResponse<T> {
  ApiResponseStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading() : status = ApiResponseStatus.loading;
  ApiResponse.completed() : status = ApiResponseStatus.completed;
  ApiResponse.error() : status = ApiResponseStatus.error;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data";
  }
}
