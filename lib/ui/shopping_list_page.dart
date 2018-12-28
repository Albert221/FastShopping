import 'package:fast_shopping/localization.dart';
import 'package:fast_shopping/model/shopping_list_model.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/ui/confirm_dialog.dart';
import 'package:fast_shopping/ui/purchase_dialog.dart';
import 'package:fast_shopping/ui/purchase_list_item.dart';
import 'package:fast_shopping/model/purchase.dart';
import 'package:scoped_model/scoped_model.dart';

// ignore: must_be_immutable
class ShoppingListPage extends StatelessWidget {
  BuildContext _context;

  void _addPurchase() async {
    String name = await showDialog(
        context: _context, builder: (BuildContext context) => PurchaseDialog());

    if (name == null) return;

    ScopedModel.of<ShoppingListModel>(_context).add(Purchase(name));
  }

  void _togglePurchase(Purchase purchase) {
    ScopedModel.of<ShoppingListModel>(_context).toggle(purchase);
  }

  void _deletePurchase(Purchase purchase) async {
    bool result = await showDialog(
        context: _context, builder: (BuildContext context) => ConfirmDialog());

    if (result == true) {
      final model = ScopedModel.of<ShoppingListModel>(_context);

      model.delete(purchase);

      Scaffold.of(_context).hideCurrentSnackBar();
      Scaffold.of(_context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(_context).deletedSnackbarText),
          action: SnackBarAction(
              label: AppLocalizations.of(_context).undo.toUpperCase(),
              onPressed: () => model.undoDeleting())));
    }
  }

  void _deleteCompletedPurchases() async {
    bool result = await showDialog(
        context: _context,
        builder: (BuildContext context) => ConfirmDialog(all: true));

    if (result == true) {
      final model = ScopedModel.of<ShoppingListModel>(_context);
      model.deleteCompleted();

      Scaffold.of(_context).hideCurrentSnackBar();
      Scaffold.of(_context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(_context).deletedAllSnackbarText),
          action: SnackBarAction(
              label: AppLocalizations.of(_context).undo.toUpperCase(),
              onPressed: () => model.undoDeleting())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ShoppingListModel>(
        builder: (BuildContext context, child, model) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: Text(AppLocalizations.of(context).navigationTitle),
                actions: model.purchases
                        .where((purchase) => purchase.purchased)
                        .isEmpty
                    ? []
                    : [
                        IconButton(
                            icon: const Icon(Icons.delete_forever),
                            onPressed: () => _deleteCompletedPurchases())
                      ]),
            body: Builder(builder: (BuildContext context) {
              _context = context;

              return model.purchases.isNotEmpty
                  ? _buildList(context, model)
                  : _buildPlaceholder(context);
            }),
            floatingActionButton: FloatingActionButton(
                onPressed: () => _addPurchase(),
                child: const Icon(Icons.add))));
  }

  Widget _buildList(BuildContext context, ShoppingListModel model) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: model.purchases.length,
        itemBuilder: (BuildContext context, int i) {
          final purchase = model.purchases[i];

          return PurchaseListItem(
              purchase: purchase,
              onTap: () => _togglePurchase(purchase),
              onDelete: () => _deletePurchase(purchase));
        });
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Image.asset('assets/placeholder.png')),
      const SizedBox(height: 24.0),
      Text(AppLocalizations.of(context).purchasesPlaceholder,
          style: const TextStyle(fontSize: 16.0))
    ]));
  }
}
