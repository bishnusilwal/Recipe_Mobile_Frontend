import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_mobile_frontend/screens/home_page.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:recipe_mobile_frontend/widget/custom_button.dart';

void main() {
  testWidgets("home page testing", (WidgetTester tester) async {
    final home = find.byType(BottomNavigationBarItem);

    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));
    expect(home, findsNWidgets(0));
  });
}
