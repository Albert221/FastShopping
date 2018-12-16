import 'package:flutter/material.dart';
import 'package:shopping_list/ui/confirm_dialog.dart';
import 'package:shopping_list/ui/purchase_dialog.dart';
import 'package:shopping_list/ui/purchase_list_item.dart';
import 'package:shopping_list/purchase.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<Purchase> _purchases = [];

  void _addPurchase(BuildContext context) async {
    String name = await showDialog(
        context: context, builder: (BuildContext context) => PurchaseDialog());

    if (name == null) return;

    setState(() {
      _purchases
        ..add(Purchase(name))
        ..sort();
    });
  }

  void _togglePurchase(int index) {
    setState(() {
      _purchases[index].purchased = !_purchases[index].purchased;
      _purchases.sort();
    });
  }

  void _deletePurchase(BuildContext context, int index) async {
    bool result = await showDialog(
        context: context, builder: (BuildContext context) => ConfirmDialog());

    if (result) {
      setState(() => _purchases
        ..removeAt(index)
        ..sort());
    }
  }

  void _deleteAllPurchases(BuildContext context) async {
    bool result = await showDialog(
        context: context,
        builder: (BuildContext context) => ConfirmDialog(all: true));

    if (result) {
      setState(() => _purchases.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista zakupów'), actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () => _deleteAllPurchases(context))
        ]),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: _purchases.length,
            itemBuilder: (BuildContext context, int i) => PurchaseListItem(
                key: ObjectKey(_purchases[i]),
                purchase: _purchases[i],
                onTap: () => _togglePurchase(i),
                onDelete: () => _deletePurchase(context, i))),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _addPurchase(context),
            child: const Icon(Icons.add)));
  }
}
