import 'dart:convert';

class Rock {
  Rock(
      {required this.id,
      required this.rockId,
      required this.portada,
      required this.cancion,
      required this.banda,
      required this.url});

  String id;
  int rockId;
  String portada;
  String cancion;
  String banda;
  String url;

  factory Rock.fromJson(String str) => Rock.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rock.fromMap(Map<String, dynamic> json) => Rock(
      id: json["_id"],
      rockId: json["rockId"],
      portada: json["portada"],
      cancion: json["cancion"],
      banda: json["banda"],
      url: json["url"]);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "rockId": rockId,
        "portada": portada,
        "cancion": cancion,
        "banda": banda,
        "url": url,
      };
}
