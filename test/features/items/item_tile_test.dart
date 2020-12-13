import 'package:fast_shopping/features/items/widgets/item_tile/item_tile.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_wrapper.dart';

void main() {
  const exampleId = '8de317bb-388a-4e66-aaca-6c084c74b7dc';

  group('ItemTile', () {
    testWidgets('shows title on collapsed tile', (tester) async {
      await tester.pumpWidget(wrapper(ItemTile(
        item: const Item(id: exampleId, title: 'An item'),
        onExpandedChanged: (_) {},
        onEditingChanged: (_) {},
      )));

      await tester.pumpAndSettle();

      expect(find.text('An item'), findsNWidgets(2));
    });
  });
}
