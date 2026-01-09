import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../services/recipe_service.dart';

class RecipeController extends ChangeNotifier {
  final RecipeService _service = RecipeService();

  // State
  List<RecipeModel> _recipes = [];
  bool _isLoading = false;
  String _selectedCategory = 'Semua';

  // Getter
  List<RecipeModel> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;

  /// Ambil semua resep / filter kategori
  Future<void> fetchRecipes({String? category}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _recipes = await _service.getRecipes(category: category);
    } catch (e) {
      debugPrint('Error fetch recipes: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Ubah kategori (dipakai di dashboard / list)
  void changeCategory(String category) {
    _selectedCategory = category;
    fetchRecipes(category: category == 'Semua' ? null : category);
  }

  /// Tambah resep
  Future<bool> addRecipe(RecipeModel recipe) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _service.addRecipe(recipe);
      fetchRecipes(category: _selectedCategory);
      return true;
    } catch (e) {
      debugPrint('Error add recipe: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update catatan resep
  Future<void> updateNote({
    required int id,
    required String note,
  }) async {
    try {
      await _service.updateNote(id: id, note: note);
      fetchRecipes(category: _selectedCategory);
    } catch (e) {
      debugPrint('Error update note: $e');
    }
  }
}
