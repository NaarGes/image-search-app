import 'package:image_search_app/data/remote/model/photo.dart';

class SearchContent {
  int? page;
  int? pages;
  int? perPage;
  int? total;
  List<Photo>? photo;

  SearchContent({this.page, this.pages, this.perPage, this.total, this.photo});

  SearchContent.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perPage = json['perpage'];
    total = json['total'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pages'] = pages;
    data['perpage'] = perPage;
    data['total'] = total;
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
