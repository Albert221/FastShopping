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
    return Container(
        color: purchase.purchased ? Colors.green.shade100 : null,
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(purchase.name),
            leading: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: purchase.purchased
                    ? const Icon(Icons.check, color: Colors.green)
                    : const Icon(Icons.remove)),
            trailing: onDelete != null
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    padding: const EdgeInsets.all(2.0),
                    onPressed: onDelete)
                : null,
            onTap: onTap));
  }
}
