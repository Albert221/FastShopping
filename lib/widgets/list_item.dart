import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final bool done;
  final String title;

  const ListItem({
    Key key,
    @required this.done,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: done,
              onChanged: (_) {},
            ),
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
