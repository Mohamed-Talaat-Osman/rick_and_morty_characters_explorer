class InfoDataModel {
  int? count;
  int? pages;

  InfoDataModel({this.count, this.pages});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
  }
}
