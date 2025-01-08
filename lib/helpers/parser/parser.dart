import '../codable/codable.dart';
import '../response/base_response.dart';
import '../response/info_data_model.dart';

class Parser {
  static BaseResponse<T> parse<T extends Codable>(
      Map<String, dynamic> json, T model) {
    if (json['results'] is Map<String, dynamic>) {
      return BaseResponse(
        info: InfoDataModel.fromJson(json['info']),
        data: model.fromJson(json['results']),
      );
    } else if (json['results'] is List) {
      List<T> parsedList = (json['results'])
          .map((item) => model.fromJson(item as Map<String, dynamic>))
          .toList()
          .cast<T>();
      print("parsedList $parsedList");
      return BaseResponse(
        info: InfoDataModel.fromJson(json['info']),
        dataList: parsedList,
        data: null,
      );
    } else {
      throw Exception("Unexpected data type: ${json['results'].runtimeType}");
    }
  }
}
