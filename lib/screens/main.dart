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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        itemCount: _items.length,
        itemBuilder: (context, i) {
          final item = _items[i];
          return Padding(
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
              onExpand: () {
                _items.where((a) => a != item).forEach((otherItem) {
                  otherItem.widgetKey.currentState.collapse();
                });
              },
            ),
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

  Item(this.title, [this.done = false, this.doneAt]) : widgetKey = GlobalKey();
}
