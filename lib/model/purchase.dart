class Purchase {
  Purchase(this.name, [this.purchased = false]);

  String name;
  bool purchased;

  void toggle() => purchased = !purchased;

  Purchase.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        purchased = json['purchased'];

  Map<String, dynamic> toJson() => {'name': name, 'purchased': purchased};
}
