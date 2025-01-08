import 'dart:convert';

mixin Decodable<T> {
  T fromJson(Map<String, dynamic> json);
}

mixin Encodable<T> {
  Map<String, dynamic> toJson();
}

abstract class Codable<T> with Decodable<T>, Encodable<T> {
  @override
  T fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson();
}

class JSONDecoder {
  R? decode<R, T extends Decodable<T>>(dynamic data, T model) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).cast<T>().toList() as R;
    } else if (data is Map<String, dynamic>) {
      return model.fromJson(data) as R;
    } else {
      return null;
    }
  }
}

class JSONEncoder {
  dynamic encode<T extends Encodable<T>>(dynamic data) {
    if (data is List<T>) {
      return data.map((e) => e.toJson()).toList();
    } else if (data is T) {
      return data.toJson();
    } else if (data != null) {
      return jsonEncode(data);
    } else {
      return null;
    }
  }
}

abstract class BaseObject<T> {
  T fromJson(Map<String, dynamic> json);
}