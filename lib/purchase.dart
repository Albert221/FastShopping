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
}
