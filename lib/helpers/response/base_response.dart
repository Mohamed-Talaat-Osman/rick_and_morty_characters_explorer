import '../../helpers/codable/codable.dart';
import 'info_data_model.dart';

class BaseResponse<T extends Codable> {
  InfoDataModel? info;

  T? data;

  List<T>? dataList; // Added for list support

  BaseResponse({required this.info, this.data, this.dataList});
}
