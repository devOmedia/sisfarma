class CardModel {
  final String name;
  final String surname;
  final String barcode;
  final String ean;

  CardModel(
      {required this.barcode,
      required this.name,
      required this.surname,
      required this.ean});

  Map<String, dynamic> toJson() {
    return {'name': name, 'surname': surname, 'barcode': barcode, 'ean': ean};
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'],
      surname: json['surname'],
      barcode: json['barcode'],
      ean: json['ean'],
    );
  }
}
