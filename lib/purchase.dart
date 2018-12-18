class Purchase implements Comparable<Purchase> {
  Purchase(this.name, [this.purchased = false]);

  String name;
  bool purchased;

  @override
  int compareTo(Purchase other) {
    if (purchased == other.purchased) {
      return name.compareTo(other.name);
    }

    return purchased ? 1 : -1;
  }

  Purchase.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        purchased = json['purchased'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'purchased': purchased
  };
}
