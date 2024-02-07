import 'package:image_search_app/data/remote/model/search_content.dart';

class SearchResult {
  SearchContent? photos;
  String? stat;

  SearchResult({this.photos, this.stat});

  SearchResult.fromJson(Map<String, dynamic> json) {
    photos =
    json['photos'] != null ? SearchContent.fromJson(json['photos']) : null;
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.toJson();
    }
    data['stat'] = stat;
    return data;
  }
}


