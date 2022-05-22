// ignore_for_file: file_names

class Places {
  String name;
  String image;
  String desc;
  Places({required this.desc, required this.image, required this.name});
  factory Places.fromJson(Map<String, dynamic> json) {
    return Places(
        desc: json['desc'] as String,
        image: json['image'] as String,
        name: json['name'] as String);
  }

  @override
  String toString() {
    return 'Places{name: $name, image: $image ,desc:$desc}';
  }
}
