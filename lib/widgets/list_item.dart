import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListItem extends StatefulWidget {
  final bool done;
  final String title;
  final DateTime doneAt;

  final bool actionsVisible;
  final VoidCallback onDeleteTap;
  final ValueChanged<String> onEdited;

  const ListItem({
    Key key,
    @required this.done,
    @required this.title,
    this.doneAt,
    this.actionsVisible = true,
    this.onDeleteTap,
    this.onEdited,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _titleFocusNode = FocusNode();

  bool expanded = false;
  bool editing = false;

  @override
  void initState() {
    super.initState();
    _setupTitle();
  }

  void _setupTitle() {
    _titleController
      ..text = widget.title
      ..selection = TextSelection.collapsed(offset: widget.title.length);
  }

  void _onEditingComplete() {
    if (widget.onEdited != null) {
      widget.onEdited(_titleController.text);
    }
    setState(() => editing = false);
  }

  @override
  Widget build(BuildContext context) {
    const curve = Curves.ease;
    const duration = const Duration(milliseconds: 300);

    return AnimatedCrossFade(
      firstCurve: curve,
      secondCurve: curve,
      sizeCurve: curve,
      duration: duration,
      crossFadeState:
          expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: () => setState(() => expanded = true),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  visualDensity: VisualDensity.standard,
                  value: widget.done,
                  onChanged: (_) {},
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: Text(widget.title),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      secondChild: Container(
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Material(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 17),
                  Checkbox(
                    visualDensity: VisualDensity.standard,
                    value: widget.done,
                    onChanged: (_) {},
                  ),
                  if (widget.doneAt != null)
                    Text(
                      'oznaczone ' + timeago.format(widget.doneAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        expanded = false;
                        editing = false;
                        _setupTitle();
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  minLines: 1,
                  maxLines: 1000,
                  readOnly: !editing,
                  controller: _titleController,
                  focusNode: _titleFocusNode,
                  onSubmitted: (_) => _onEditingComplete(),
                ),
              ),
              if (widget.actionsVisible)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                  child: editing
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              child: Text('ANULUJ'),
                              onPressed: () {
                                setState(() {
                                  editing = false;
                                  _setupTitle();
                                });
                              },
                            ),
                            const SizedBox(width: 16),
                            FlatButton(
                              child: Text(
                                'ZAPISZ',
                                style: TextStyle(
                                  color: Color(0xFF4D3900),
                                ),
                              ),
                              color: Color(0xFFFFF0C3),
                              onPressed: _onEditingComplete,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              // TODO: Dragging
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.black87,
                              ),
                            ),
                            Spacer(),
                            FlatButton(
                              child: Text(
                                'USUŃ',
                                style: TextStyle(
                                  color: Color(0xFFD32F2F),
                                ),
                              ),
                              onPressed: () {
                                if (widget.onDeleteTap != null) {
                                  widget.onDeleteTap();
                                }
                              },
                            ),
                            const SizedBox(width: 16),
                            FlatButton(
                                child: Text(
                                  'EDYTUJ',
                                  style: TextStyle(
                                    color: Color(0xFF4D3900),
                                  ),
                                ),
                                color: Color(0xFFFFF0C3),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(_titleFocusNode);
                                  setState(() => editing = true);
                                }),
                          ],
                        ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
