// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:recipe_mobile_frontend/constants.dart';
// import 'package:recipe_mobile_frontend/http/http_recipe.dart';
// // import 'package:recipe_mobile_frontend/http/httpuser.dart';

// // import 'package:recipe_mobile_frontend/models/recipe_models.dart';

// import 'recipe_test.mocks.dart';

// @GenerateMocks([http.Client])
// void main() {
//   group("recipe tests", () {
//     HttpRecipe httpRecipe = HttpRecipe();

//     test('return list of movies', () async {
//       final client = MockClient();
//       when(client
//           .get(Uri.parse(Constants.baseUrl + "recipe/"))
//           .then((value) async => http.Response('[]', 200)));

//       expect(await httpRecipe.getRecipe(), isA<List>());
//     });
// // 
//     // test('return a movie by id', () async {
//     //   final client = MockClient();
//     //   when(client
//     //       .add(Uri.parse(Constants.baseUrl + "recipe/"))
//     //       .then((value) async => http.Response('{}', 200)));

//     //   expect(await recipeRespository.getRecipeById(1), isA<Recipe>());
//     // });
//   });

//   // group("user tests", () {

//   //   HttpConnectUser httpConnectUser = HttpConnectUser(

//   //   );

//   //   test('user profile', () async {
//   //     final client = MockClient();
//   //     when(client
//   //         .get(Uri.parse(Constants.baseUrl + "user/profile/"))
//   //         .then((value) async => http.Response('[]', 200)));

//   //     expect(await httpConnectUser.getUser), isA<List>());
//   //   });
//   // });
// }
