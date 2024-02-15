import 'dart:convert';

// Firebase Object Mapping
class Tree {
  String? nom;
  String? varietat;
  String? tipus;
  bool? autocton;
  String? foto;
  String? detall;

  Tree({
    this.nom,
    this.varietat,
    this.tipus,
    this.autocton,
    this.foto,
    this.detall,
  });

  Tree copyWith({
    String? nom,
    String? varietat,
    String? tipus,
    bool? autocton,
    String? foto,
    String? detall,
  }) =>
      Tree(
        nom: nom ?? this.nom,
        varietat: varietat ?? this.varietat,
        tipus: tipus ?? this.tipus,
        autocton: autocton ?? this.autocton,
        foto: foto ?? this.foto,
        detall: detall ?? this.detall,
      );

  factory Tree.fromJson(String str) => Tree.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tree.fromMap(Map<String, dynamic> json) => Tree(
        nom: json["nom"],
        varietat: json["varietat"],
        tipus: json["tipus"],
        autocton: json["autocton"],
        foto: json["foto"],
        detall: json["detall"],
      );

  Map<String, dynamic> toMap() => {
        "nom": nom,
        "varietat": varietat,
        "tipus": tipus,
        "autocton": autocton,
        "foto": foto,
        "detall": detall,
      };
}
