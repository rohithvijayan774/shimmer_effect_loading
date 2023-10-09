class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        albumId: json['albumId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        url: json['url'] as String?,
        thumbnailUrl: json['thumbnailUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
