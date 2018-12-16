import 'package:flutter/material.dart';
import 'package:shopping_list/purchase.dart';

class PurchaseListItem extends StatelessWidget {
  const PurchaseListItem(
      {Key key, @required this.purchase, this.onTap, this.onDelete})
      : super(key: key);

  final Purchase purchase;
  final Function onTap;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(purchase.name,
            style: TextStyle(
                decoration:
                    purchase.purchased ? TextDecoration.lineThrough : null)),
        leading: purchase.purchased ? const Icon(Icons.check) : SizedBox(),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete),
                padding: const EdgeInsets.all(2.0),
                onPressed: onDelete)
            : null,
        onTap: onTap);
  }
}
