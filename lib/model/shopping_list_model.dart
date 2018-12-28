import 'package:fast_shopping/model/purchase.dart';
import 'package:scoped_model/scoped_model.dart';

class ShoppingListModel extends Model {
  final List<Purchase> _purchases = [];

  List<Purchase> get purchases =>
      _purchases.where((purchase) => !purchase.isDeleted).toList();

  final Function(ShoppingListModel) onSave;

  ShoppingListModel({this.onSave});

  void import(List<Purchase> purchases) {
    _purchases.addAll(purchases);

    notifyListeners();
  }

  void add(Purchase purchase) {
    _purchases.add(purchase);

    _save();
  }

  void toggle(Purchase purchase) {
    purchase.toggle();

    _save();
  }

  void delete(Purchase purchase) {
    _clearHistory();
    purchase.delete();

    _save();
  }

  void deleteCompleted() {
    _clearHistory();
    _purchases
        .where((purchase) => purchase.purchased)
        .forEach((purchase) => purchase.delete());

    _save();
  }

  void _clearHistory() {
    _purchases.removeWhere((purchase) => purchase.isDeleted);
  }

  void undoDeleting() {
    _purchases.forEach((purchase) => purchase.recover());

    _save();
  }

  void _save() {
    if (onSave != null) {
      onSave(this);
    }

    notifyListeners();
  }
}
