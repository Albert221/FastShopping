import 'package:flutter/material.dart';
import 'package:fast_shopping/model/purchase.dart';

class PurchaseListItem extends StatelessWidget {
  const PurchaseListItem(
      {Key key, @required this.purchase, this.onTap, this.onDelete})
      : super(key: key);

  final Purchase purchase;
  final Function onTap;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    final background =
        purchase.purchased ? Colors.green.shade100 : Colors.white;

    return Container(
        height: 60,
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Material(
                  color: background,
                  child: InkWell(
                      onTap: onTap,
                      child: Row(children: [
                        _PurchasedIcon(purchased: purchase.purchased),
                        Expanded(
                            child: Text(purchase.name,
                                style: const TextStyle(fontSize: 16)))
                      ])))),
          Material(
              color: background,
              child: InkWell(
                  onTap: onDelete,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Opacity(
                          opacity: 0.5,
                          child: const Icon(Icons.delete, size: 20)))))
        ]));
  }
}

class _PurchasedIcon extends StatelessWidget {
  final bool purchased;

  _PurchasedIcon({Key key, @required this.purchased}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(children: [
        AnimatedOpacity(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 200),
            opacity: purchased ? 1 : 0,
            child: const Icon(Icons.check, color: Colors.green)),
        AnimatedOpacity(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 200),
            opacity: purchased ? 0 : 1,
            child: const Icon(Icons.remove))
      ]),
    );
  }
}
