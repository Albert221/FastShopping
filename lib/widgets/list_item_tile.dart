import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/l10n/timeago.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListItemTile extends StatefulWidget {
  final bool done;
  final String title;
  final DateTime doneAt;

  final bool actionsVisible;

  final ValueChanged<bool> onDoneTap;
  final ValueChanged<String> onTitleEdited;
  final VoidCallback onDeleteTap;
  final VoidCallback onExpand;
  final ListItemDragHandler dragHandler;

  const ListItemTile({
    Key key,
    @required this.done,
    @required this.title,
    this.doneAt,
    this.actionsVisible = true,
    this.onDoneTap,
    this.onTitleEdited,
    this.onDeleteTap,
    this.onExpand,
    this.dragHandler,
  }) : super(key: key);

  @override
  ListItemTileState createState() => ListItemTileState();
}

class ListItemTileState extends State<ListItemTile>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _titleFocusNode = FocusNode();

  bool _expanded = false;
  bool _editing = false;
  LocalHistoryEntry _editingHistoryEntry;
  LocalHistoryEntry _expandedHistoryEntry;

  @override
  void initState() {
    super.initState();
    _resetTitle();

    _editingHistoryEntry = LocalHistoryEntry(onRemove: () {
      setState(() => _editing = false);
    });
    _expandedHistoryEntry = LocalHistoryEntry(onRemove: () {
      setState(() => _expanded = false);
    });
  }

  void _resetTitle() {
    _titleController
      ..text = widget.title
      // Move caret to the end
      ..selection = TextSelection.collapsed(offset: widget.title.length);
  }

  void _editTitle() {
    ModalRoute.of(context).addLocalHistoryEntry(_editingHistoryEntry);
    FocusScope.of(context).requestFocus(_titleFocusNode);
    setState(() => _editing = true);
  }

  void _onEditingTitleComplete() {
    ModalRoute.of(context).removeLocalHistoryEntry(_editingHistoryEntry);
    widget.onTitleEdited?.call(_titleController.text);
  }

  void _cancelEditingTitle() {
    ModalRoute.of(context).removeLocalHistoryEntry(_editingHistoryEntry);
    _resetTitle();
  }

  void expand({bool editing = false}) {
    if (_expanded) return;

    ModalRoute.of(context).addLocalHistoryEntry(_expandedHistoryEntry);
    setState(() => _expanded = true);
    widget.onExpand?.call();

    if (editing) _editTitle();
  }

  void collapse() {
    if (!_expanded) return;
    if (_editing) _cancelEditingTitle();
    ModalRoute.of(context).removeLocalHistoryEntry(_expandedHistoryEntry);
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
                  child: widget.title.isNotEmpty
                      ? Text(widget.title)
                      : Text(
                          S.of(context).list_item_no_name,
                          style: TextStyle(
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
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
                    S
                        .of(context)
                        .list_item_done_ago(widget.doneAt.timeAgo(context)),
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: _editing
                      ? S.of(context).list_item_title_hint
                      : S.of(context).list_item_no_name,
                  hintStyle: TextStyle(
                    fontStyle: _editing ? FontStyle.normal : FontStyle.italic,
                  ),
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
          child: Text(S.of(context).list_item_editing_cancel),
          onPressed: _cancelEditingTitle,
        ),
        const SizedBox(width: 16),
        PrimaryFlatButton(
          text: S.of(context).list_item_editing_save,
          onPressed: _onEditingTitleComplete,
        ),
      ],
    );
  }

  Widget _buildItemActions(BuildContext context) {
    return Row(
      children: [
        if (widget.dragHandler != null)
          GestureDetector(
            onVerticalDragStart: widget.dragHandler?.onDragStart,
            onVerticalDragUpdate: widget.dragHandler?.onDragUpdate,
            onVerticalDragEnd: widget.dragHandler?.onDragEnd,
            onVerticalDragCancel: widget.dragHandler?.onDragCancel,
            child: const Icon(
              Icons.drag_handle,
              color: Colors.black87,
            ),
          ),
        Spacer(),
        DangerFlatButton(
          text: S.of(context).list_item_remove,
          onPressed: () => widget.onDeleteTap?.call(),
        ),
        const SizedBox(width: 16),
        PrimaryFlatButton(
          text: S.of(context).list_item_edit,
          onPressed: _editTitle,
        ),
      ],
    );
  }
}

class ListItemDragHandler {
  final ValueChanged<DragStartDetails> onDragStart;
  final ValueChanged<DragUpdateDetails> onDragUpdate;
  final ValueChanged<DragEndDetails> onDragEnd;
  final VoidCallback onDragCancel;

  ListItemDragHandler({
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
    this.onDragCancel,
  });
}
