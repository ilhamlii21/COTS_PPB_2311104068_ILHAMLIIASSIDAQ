import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/recipe_model.dart';

class RecipeService {
  Future<List<RecipeModel>> getRecipes({String? category}) async {
    final uri = Uri.parse(
      ApiConfig.baseUrl +
          ApiConfig.recipesEndpoint +
          (category != null ? '&category=eq.$category' : ''),
    );

    final response = await http.get(uri, headers: ApiConfig.headers);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => RecipeModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal fetch recipes');
    }
  }

  Future<void> addRecipe(RecipeModel recipe) async {
    await http.post(
      Uri.parse(ApiConfig.baseUrl + ApiConfig.recipesEndpoint),
      headers: ApiConfig.headers,
      body: jsonEncode(recipe.toJson()),
    );
  }

  Future<void> updateNote({
    required int id,
    required String note,
  }) async {
    await http.patch(
      Uri.parse(
          '${ApiConfig.baseUrl}/rest/v1/recipes?id=eq.$id'),
      headers: ApiConfig.headers,
      body: jsonEncode({'note': note}),
    );
  }
}
