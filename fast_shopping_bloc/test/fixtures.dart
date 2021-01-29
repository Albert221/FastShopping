import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';

import 'clock.dart';

final shoppingList1 = ShoppingList(
  id: '42c644d3-f37d-49f0-962d-15859e1d0355',
  name: 'Some shopping list',
  createdAt: clock.now(),
  items: [item1, item2, item3],
);

final shoppingList2 = ShoppingList(
  id: '109c3284-dd5e-47c8-aa56-ac5a146cf627',
  name: 'This is other shopping list',
  createdAt: clock.minutesAgo(30),
  archivedAt: clock.minutesAgo(2),
);

const item1 = Item(
  id: '02a50f58-6695-438f-9e9f-ac2f655a9b3c',
  title: 'Eggs',
);

final item2 = Item(
  id: 'ab7e82ac-6709-48c8-bc1b-d2b6c63f2a39',
  title: 'Bacon',
  doneAt: clock.minutesAgo(17),
);

const item3 = Item(
  id: 'd5e7b694-c8c4-4dec-bc3f-9a0e2ea6c236',
  title: 'Pan',
);

const removedItem = Item(
  id: '6457003e-320e-42e6-9d8d-fe929766a083',
  title: 'Ketchup',
  removed: true,
);

const orphanItem1 = Item(
  id: 'ba603f43-fa4a-4196-bbec-f4207c7b30d3',
  title: 'Cheese',
);
