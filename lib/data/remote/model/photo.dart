class Photo {
  String? id;
  String? owner;
  String? secret;
  String? server;
  int? farm;
  String? title;
  int? isPublic;
  int? isFriend;
  int? isFamily;

  Photo({
    this.id,
    this.owner,
    this.secret,
    this.server,
    this.farm,
    this.title,
    this.isPublic,
    this.isFriend,
    this.isFamily,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    secret = json['secret'];
    server = json['server'];
    farm = json['farm'];
    title = json['title'];
    isPublic = json['ispublic'];
    isFriend = json['isfriend'];
    isFamily = json['isfamily'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner'] = owner;
    data['secret'] = secret;
    data['server'] = server;
    data['farm'] = farm;
    data['title'] = title;
    data['ispublic'] = isPublic;
    data['isfriend'] = isFriend;
    data['isfamily'] = isFamily;
    return data;
  }

  String get imageUrl => 'https://live.staticflickr.com/$server/${id}_${secret}_w.jpg';
}
