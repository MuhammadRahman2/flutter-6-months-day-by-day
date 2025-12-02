# Provider package gives you these tools:

1. ChangeNotifier

A class that holds your data + business logic.

2. ChangeNotifierProvider

Provides your ChangeNotifier to the entire widget tree.

3. Consumer

Widget to rebuild only a part of UI.

4. context.watch

Rebuild when data changes.

5. context.read

Use methods only (no rebuild).

6. context.select

Rebuild only when selected field changes.

7. MultiProvider

Use multiple providers.

8. Provider.of()

Old style. Do NOT use.
(We’ll talk about drawbacks later.)
