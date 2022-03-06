import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';

import 'recipe_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("recipe tests", () {
    HttpRecipe httpRecipe = HttpRecipe();

    test('update list of recipe', () async {
      final client = MockClient();
      when(client.put(
        Uri.parse(Constants.baseUrl + "recipe/update"),
        headers: {"Authorization": "Bearer "},
        body: {
          "username": "bishnu",
          "discription": "bissfsfdhnu",
          "pretime": "10",
          "cooktime": "4",
          "totaltime": "14",
          "category": "veg",
          "ingredients": "sdffdf",
          "direction": "fgfg",
        },
      ).then((value) async => http.Response('', 200)));

      expect(await httpRecipe.getRecipe(), isA<List>());
    });
  });
}
