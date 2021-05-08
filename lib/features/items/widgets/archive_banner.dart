import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class ArchiveBanner extends StatelessWidget {
  const ArchiveBanner({
    Key? key,
    this.visible = true,
    this.onArchiveTap,
  }) : super(key: key);

  final bool visible;
  final VoidCallback? onArchiveTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstCurve: standardEasing,
      secondCurve: standardEasing,
      sizeCurve: standardEasing,
      duration: const Duration(milliseconds: 300),
      firstChild: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
              child: Text(S.of(context)!.archive_banner_content),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: onArchiveTap,
                  child: Text(S.of(context)!.archive_banner_archive),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: DefaultTextStyle.of(context).style.color!.withOpacity(.12),
              thickness: 1,
            ),
          ],
        ),
      ),
      secondChild: const SizedBox(),
    );
  }
}
