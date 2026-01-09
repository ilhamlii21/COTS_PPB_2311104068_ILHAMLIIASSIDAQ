import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/recipe_controller.dart';
import '../widgets/recipe_card.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RecipeController>().fetchRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RecipeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Daftar Resep')),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.sm),
              itemCount: controller.recipes.length,
              itemBuilder: (context, index) {
                final recipe = controller.recipes[index];

                return RecipeCard(
                  title: recipe.title,
                  category: recipe.category,
                  duration: recipe.duration,
                  imageUrl: recipe.imageUrl,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/recipe-detail',
                      arguments: recipe,
                    );
                  },
                );
              },
            ),
    );
  }
}
