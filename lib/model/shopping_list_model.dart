import 'package:fast_shopping/model/purchase.dart';
import 'package:scoped_model/scoped_model.dart';

class ShoppingListModel extends Model {
  final List<Purchase> purchases = [];
  Function(ShoppingListModel) onSave;

  ShoppingListModel({this.onSave});

  void import(List<Purchase> purchases) {
    this.purchases.addAll(purchases);

    notifyListeners();
  }

  void add(Purchase purchase) {
    purchases.add(purchase);

    notifyListeners();
    _save();
  }

  void toggle(Purchase purchase) {
    purchase.toggle();

    notifyListeners();
    _save();
  }

  void delete(Purchase purchase) {
    purchases.remove(purchase);

    notifyListeners();
    _save();
  }

  void deleteCompleted() {
    purchases.removeWhere((purchase) => purchase.purchased);

    notifyListeners();
    _save();
  }

  void _save() {
    if (onSave != null) {
      onSave(this);
    }
  }
}
