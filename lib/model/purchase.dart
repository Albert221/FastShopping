class Purchase with Deletable {
  Purchase(this.name, [this.purchased = false]);

  String name;
  bool purchased;

  void toggle() => purchased = !purchased;

  Purchase.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        purchased = json['purchased'];

  Map<String, dynamic> toJson() =>
      isDeleted ? null : {'name': name, 'purchased': purchased};
}

class Deletable {
  bool _deleted = false;

  bool get isDeleted => _deleted;

  void delete() => _deleted = true;

  void recover() => _deleted = false;
}
