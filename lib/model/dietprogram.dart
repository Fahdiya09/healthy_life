class Dietprogram {
  String? id;
  String jenis;
  String definisi;
  String manfaat;
  String makanan;

  Dietprogram(
      {this.id,
      required this.jenis,
      required this.definisi,
      required this.manfaat,
      required this.makanan});

  factory Dietprogram.fromJson(Map<String, dynamic> json) => Dietprogram(
      id: json["id"],
      jenis: json["jenis"],
      definisi: json["definisi"],
      manfaat: json["manfaat"],
      makanan: json["makanan"]);

  Map<String, dynamic> toJson() => {
        "jenis": jenis,
        "definisi": definisi,
        "manfaat": manfaat,
        "makanan": makanan
      };
}
