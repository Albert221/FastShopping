import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _items = [
    Item('Herbatniki duża paczka'),
    Item('3x bita śmietana (proszek)'),
    Item('0,5l śmietany 30% karton'),
    Item('Krem karpatka proszek'),
    Item(
        'Masa kajmakowa/krówkowa (puszka) albo mleko skondensowane jak nie będzie'),
    Item('Kapusta czerwona 2x średnie'),
    Item('6 cebul czerwonych'),
  ];

  bool _shouldShowFab(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  bool _shouldShowArchiveBanner() => _items.every((item) => item.done);

  void _deleteItem(BuildContext context, Item item) {
    setState(() => item.removed = true);
    item.widgetKey.currentState.collapse();

    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context)
        .showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Usunięto element z listy.'),
            action: SnackBarAction(
              textColor: PrimaryFlatButton.buttonColor,
              label: 'COFNIJ',
              onPressed: () {
                setState(() => item.removed = false);
              },
            ),
          ),
        )
        .closed
        .then((reason) {
      if (reason != SnackBarClosedReason.action) {
        setState(() => _items.remove(item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Szybkie zakupy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: _shouldShowFab(context)
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {},
            )
          : null,
      body: ListView.builder(
        itemCount: _items.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AnimatedCrossFade(
                firstCurve: Curves.ease,
                secondCurve: Curves.ease,
                sizeCurve: Curves.ease,
                duration: const Duration(milliseconds: 300),
                crossFadeState: _shouldShowArchiveBanner()
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: ArchiveBanner(
                  onArchiveTap: () {},
                ),
                secondChild: const SizedBox(width: double.infinity),
              ),
            );
          }

          final item = _items[i - 1];

          return AnimatedCrossFade(
            key: ObjectKey(item),
            firstCurve: Curves.ease,
            secondCurve: Curves.ease,
            sizeCurve: Curves.ease,
            duration: const Duration(milliseconds: 300),
            crossFadeState: item.removed
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListItem(
                key: item.widgetKey,
                title: item.title,
                done: item.done,
                doneAt: item.doneAt,
                onDoneTap: (value) {
                  setState(() {
                    item.done = value;
                    if (value) {
                      item.doneAt = DateTime.now();
                    } else {
                      item.doneAt = null;
                    }
                  });
                },
                onTitleEdited: (newTitle) {
                  setState(() => item.title = newTitle);
                },
                onDeleteTap: () => _deleteItem(context, item),
                onExpand: () {
                  _items.where((a) => a != item).forEach((otherItem) {
                    otherItem.widgetKey.currentState?.collapse();
                  });
                },
                dragHandler: ListItemDragHandler(
                  onDragStart: (details) {
                    debugPrint(details.toString());
                  },
                  onDragUpdate: (details) {
                    debugPrint(details.toString());
                  },
                  onDragEnd: (details) {
                    debugPrint(details.toString());
                  },
                ),
              ),
            ),
            secondChild: const SizedBox(width: double.infinity),
          );
        },
      ),
    );
  }
}

class Item {
  final GlobalKey<ListItemState> widgetKey;

  String title;
  bool done;
  DateTime doneAt;
  bool removed = false;

  Item(this.title, [this.done = false, this.doneAt]) : widgetKey = GlobalKey();
}
