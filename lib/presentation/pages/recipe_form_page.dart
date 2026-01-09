import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/recipe_controller.dart';
import '../../models/recipe_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../../design_system/spacing.dart';

class RecipeFormPage extends StatelessWidget {
  const RecipeFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final categoryController = TextEditingController();
    final durationController = TextEditingController();
    final imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resep')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            CustomInput(
              controller: titleController,
              label: 'Nama Resep',
            ),
            const SizedBox(height: AppSpacing.sm),
            CustomInput(
              controller: categoryController,
              label: 'Kategori',
            ),
            const SizedBox(height: AppSpacing.sm),
            CustomInput(
              controller: durationController,
              label: 'Durasi (contoh: 20 Menit)',
            ),
            const SizedBox(height: AppSpacing.sm),
            CustomInput(
              controller: imageUrlController,
              label: 'Image URL',
            ),
            const SizedBox(height: AppSpacing.lg),

            CustomButton(
              text: 'Simpan',
              onPressed: () async {
                final recipe = RecipeModel(
                  title: titleController.text,
                  category: categoryController.text,
                  duration: durationController.text,
                  imageUrl: imageUrlController.text,
                );

                final success = await context
                    .read<RecipeController>()
                    .addRecipe(recipe);

                if (success && context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
