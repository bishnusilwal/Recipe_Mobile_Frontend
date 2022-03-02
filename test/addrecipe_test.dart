import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_mobile_frontend/screens/direction_screen.dart';
import 'package:recipe_mobile_frontend/screens/home_page.dart';
import 'package:recipe_mobile_frontend/screens/pouplar_screen.dart';
import 'package:recipe_mobile_frontend/screens/recipe_form.dart';

void main() {
  testWidgets("my Testing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FormScreen(),
    ));
    final home = find.byType(AppBar);
    expect(home, findsOneWidget);
  });
}