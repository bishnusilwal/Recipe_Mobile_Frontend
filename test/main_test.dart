import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: avoid_relative_lib_imports
import '../lib/main.dart';

void main() {
  testWidgets("my Testing", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final material = find.byType(MaterialApp);
    expect(material, findsOneWidget);
  });
}
