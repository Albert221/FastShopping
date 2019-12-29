import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        itemCount: 4,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListItem(
            done: true,
            doneAt: DateTime.now().subtract(Duration(hours: 2)),
            title: 'Herbatniki duża paczka',
          ),
        ),
      ),
    );
  }
}
