class ImageData {
  String id;
  String? name;
  String? url;

  ImageData({required this.id, this.name, this.url});

  ImageData.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'] ?? '',
        url = snapshot['url'] ?? '';

  toJson() {
    return {
      "name": name,
      "url": url,
    };
  }
}
