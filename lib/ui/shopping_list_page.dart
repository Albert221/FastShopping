import 'package:flutter/material.dart';
import 'package:shopping_list/persistor.dart';
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
  Persistor _persistor = Persistor();

  @override
  void initState() {
    super.initState();

    _persistor.load().then((data) => setState(() => _purchases = data));
  }

  void _save() {
    _persistor.save(_purchases);
  }

  void _addPurchase(BuildContext context) async {
    String name = await showDialog(
        context: context, builder: (BuildContext context) => PurchaseDialog());

    if (name == null) return;

    setState(() {
      _purchases.add(Purchase(name));
    });
    _save();
  }

  void _togglePurchase(int index) {
    setState(() => _purchases[index].purchased = !_purchases[index].purchased);
    _save();
  }

  void _deletePurchase(BuildContext context, int index) async {
    bool result = await showDialog(
        context: context, builder: (BuildContext context) => ConfirmDialog());

    if (result == true) {
      setState(() => _purchases.removeAt(index));
    }
    _save();
  }

  void _deleteAllPurchases(BuildContext context) async {
    bool result = await showDialog(
        context: context,
        builder: (BuildContext context) => ConfirmDialog(all: true));

    if (result == true) {
      setState(() => _purchases.clear());
    }
    _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Lista zakupów'), actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () => _deleteAllPurchases(context))
        ]),
        body: _purchases.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                itemCount: _purchases.length,
                itemBuilder: (BuildContext context, int i) => PurchaseListItem(
                    key: ObjectKey(_purchases[i]),
                    purchase: _purchases[i],
                    onTap: () => _togglePurchase(i),
                    onDelete: () => _deletePurchase(context, i)))
            : _buildPlaceholder(context),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _addPurchase(context),
            child: const Icon(Icons.add)));
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Image.asset('assets/placeholder.png')),
      SizedBox(height: 24.0),
      const Text('Nie masz żadnych zakupów na liście.',
          style: TextStyle(fontSize: 16.0))
    ]));
  }
}
