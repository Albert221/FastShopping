import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListItem extends StatefulWidget {
  final bool done;
  final String title;
  final DateTime doneAt;

  final bool actionsVisible;
  final ValueChanged<bool> onDoneTap;
  final ValueChanged<String> onTitleEdited;
  final VoidCallback onDeleteTap;
  final VoidCallback onExpand;

  const ListItem({
    Key key,
    @required this.done,
    @required this.title,
    this.doneAt,
    this.actionsVisible = true,
    this.onDoneTap,
    this.onTitleEdited,
    this.onDeleteTap,
    this.onExpand,
  }) : super(key: key);

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _titleFocusNode = FocusNode();

  bool _expanded = false;
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _resetTitle();
  }

  void _resetTitle() {
    _titleController
      ..text = widget.title
      ..selection = TextSelection.collapsed(offset: widget.title.length);
  }

  void _onEditingTitleComplete() {
    setState(() => _editing = false);
    if (widget.onTitleEdited != null) {
      widget.onTitleEdited(_titleController.text);
    }
  }

  void _cancelEditingTitle() {
    _resetTitle();
    setState(() => _editing = false);
  }

  void expand() {
    setState(() => _expanded = true);
    if (widget.onExpand != null) {
      widget.onExpand();
    }
  }

  void collapse() {
    // FocusScope.of(context).unfocus();
    _cancelEditingTitle();
    setState(() => _expanded = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.ease,
      secondCurve: Curves.ease,
      sizeCurve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: _buildCollapsed(context),
      secondChild: _buildExpanded(context),
    );
  }

  Widget _buildCollapsed(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: expand,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                visualDensity: VisualDensity.standard,
                value: widget.done,
                onChanged: widget.onDoneTap,
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
    );
  }

  Widget _buildExpanded(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
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
                  onChanged: widget.onDoneTap,
                ),
                if (widget.doneAt != null)
                  Text(
                    'oznaczone ' + timeago.format(widget.doneAt),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: collapse,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                minLines: 1,
                maxLines: 1000,
                readOnly: !_editing,
                controller: _titleController,
                focusNode: _titleFocusNode,
                onSubmitted: (_) => _onEditingTitleComplete(),
              ),
            ),
            if (widget.actionsVisible)
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: _editing
                    ? _buildEditingActions(context)
                    : _buildItemActions(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditingActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlatButton(
          child: Text('ANULUJ'),
          onPressed: _cancelEditingTitle,
        ),
        const SizedBox(width: 16),
        FlatButton(
          child: Text(
            'ZAPISZ',
            style: const TextStyle(color: Color(0xFF4D3900)),
          ),
          color: const Color(0xFFFFF0C3),
          onPressed: _onEditingTitleComplete,
        ),
      ],
    );
  }

  Widget _buildItemActions(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          // TODO: Dragging
          child: const Icon(
            Icons.drag_handle,
            color: Colors.black87,
          ),
        ),
        Spacer(),
        FlatButton(
          child: Text(
            'USUŃ',
            style: const TextStyle(color: Color(0xFFD32F2F)),
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
            style: const TextStyle(color: Color(0xFF4D3900)),
          ),
          color: const Color(0xFFFFF0C3),
          onPressed: () {
            FocusScope.of(context).requestFocus(_titleFocusNode);
            setState(() => _editing = true);
          },
        ),
      ],
    );
  }
}
