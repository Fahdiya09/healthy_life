class Polahidup {
  String? id;
  String hari;
  String one;
  String two;
  String three;
  String four;
  String five;
  String six;
  String seven;
  String eight;
  String nine;
  String ten;

  Polahidup(
      {this.id,
      required this.hari,
      required this.one,
      required this.two,
      required this.three,
      required this.four,
      required this.five,
      required this.six,
      required this.seven,
      required this.eight,
      required this.nine,
      required this.ten});

  factory Polahidup.fromJson(Map<String, dynamic> json) => Polahidup(
      id: json["id"],
      hari: json["hari"],
      one: json["one"],
      two: json["two"],
      three: json["three"],
      four: json["four"],
      five: json["five"],
      six: json["six"],
      seven: json["seven"],
      eight: json["eight"],
      nine: json["nine"],
      ten: json["ten"]);

  Map<String, dynamic> toJson() => {
        "hari": hari,
        "one": one,
        "two": two,
        "three": three,
        "four": four,
        "five": five,
        "six": six,
        "seven": seven,
        "eight": eight,
        "nine": nine,
        "ten": ten
      };
}
