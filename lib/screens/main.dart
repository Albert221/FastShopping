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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Text('Lista zakupów 1'),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: 2,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListItem(
            done: false,
            title: 'Herbatniki duża paczka',
          ),
        ),
      ),
    );
  }
}
