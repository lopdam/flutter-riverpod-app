import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/presentation/views/state_provider_view/state_provider_view.dart';

void main() {
  testWidgets('StateProviderView displays initial state correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: StateProviderView(),
        ),
      ),
    );

    // Verify initial counter value (starts at 5)
    expect(find.text('5'), findsOneWidget);

    // Verify initial username
    expect(find.text('Dennys Lopez'), findsOneWidget);

    // Verify dark mode icon is displayed (theme starts as true/dark)
    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
  });

  testWidgets('Counter increments when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: StateProviderView(),
        ),
      ),
    );

    // Verify initial counter
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsNothing);

    // Tap the counter button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter incremented
    expect(find.text('5'), findsNothing);
    expect(find.text('6'), findsOneWidget);
  });

  testWidgets('Theme toggles when icon is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: StateProviderView(),
        ),
      ),
    );

    // Verify dark mode icon initially
    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
    expect(find.byIcon(Icons.light_mode_outlined), findsNothing);

    // Tap the theme toggle button
    await tester.tap(find.byIcon(Icons.dark_mode_outlined));
    await tester.pump();

    // Verify light mode icon is now displayed
    expect(find.byIcon(Icons.dark_mode_outlined), findsNothing);
    expect(find.byIcon(Icons.light_mode_outlined), findsOneWidget);
  });

  testWidgets('Username changes when random name button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: StateProviderView(),
        ),
      ),
    );

    // Verify initial username
    expect(find.text('Dennys Lopez'), findsOneWidget);

    // Tap the "Nombre aleatorio" button
    await tester.tap(find.text('Nombre aleatorio'));
    await tester.pump();

    // Verify username has changed (it should no longer be the initial value)
    expect(find.text('Dennys Lopez'), findsNothing);
  });
}
