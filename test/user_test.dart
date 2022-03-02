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
  group("user tests", () {
  HttpConnectUser httpConnectUse = HttpConnectUser();

    test('return profile', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(Constants.baseUrl + "user/Profile"))
          .then((value) async => http.Response('[]', 200)));

    
    });
  });

}
