import 'package:flutter/material.dart';

import '../presentation/pages/dashboard_page.dart';
import '../presentation/pages/recipe_list_page.dart';
import '../presentation/pages/recipe_detail_page.dart';
import '../presentation/pages/recipe_form_page.dart';

class AppRoutes {
  
  static const String dashboard = '/';
  static const String recipeList = '/recipes';
  static const String recipeDetail = '/recipe-detail';
  static const String recipeForm = '/recipe-form';

  static Map<String, WidgetBuilder> routes = {
    dashboard: (context) => const DashboardPage(),
    recipeList: (context) => const RecipeListPage(),
    recipeDetail: (context) => const RecipeDetailPage(),
    recipeForm: (context) => const RecipeFormPage(),
  };
}
