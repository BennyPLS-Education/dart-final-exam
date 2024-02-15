import 'dart:convert';

class Ip {
  String? ip;

  Ip({
    this.ip,
  });

  Ip copyWith({
    String? ip,
  }) =>
      Ip(
        ip: ip ?? this.ip,
      );

  factory Ip.fromJson(String str) => Ip.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ip.fromMap(Map<String, dynamic> json) => Ip(
        ip: json["ip"],
      );

  Map<String, dynamic> toMap() => {
        "ip": ip,
      };
}
