import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../design_system/radius.dart';
import '../../config/app_routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text(
          'Resep Masakan',
          style: AppTypography.title,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.recipeList);
            },
            child: Text(
              'Daftar Resep',
              style: AppTypography.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatsGrid(),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Resep Terbaru',
              style: AppTypography.section,
            ),
            const SizedBox(height: AppSpacing.sm),
            _LatestRecipeCard(
              title: 'Nasi Goreng Spesial',
              category: 'Sarapan',
              duration: '20 Menit',
            ),
            _LatestRecipeCard(
              title: 'Ayam Bakar Madu',
              category: 'Makan Malam',
              duration: '45 Menit',
            ),
            const SizedBox(height: AppSpacing.lg),
            _AddButton(),
          ],
        ),
      ),
    );
  }
}

/// ======================
/// GRID STATISTIK
/// ======================
class _StatsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> stats = const [
    {'title': 'Total Resep', 'value': '15'},
    {'title': 'Sarapan', 'value': '8'},
    {'title': 'Makan Siang', 'value': '12'},
    {'title': 'Dessert', 'value': '3'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final item = stats[index];
        return Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item['title'], style: AppTypography.caption),
              const SizedBox(height: 4),
              Text(item['value'], style: AppTypography.title),
            ],
          ),
        );
      },
    );
  }
}

/// ======================
/// CARD RESEP TERBARU
/// ======================
class _LatestRecipeCard extends StatelessWidget {
  final String title;
  final String category;
  final String duration;

  const _LatestRecipeCard({
    required this.title,
    required this.category,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: const Icon(Icons.restaurant),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.section),
                const SizedBox(height: 2),
                Text(
                  '$category • $duration',
                  style: AppTypography.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ======================
/// BUTTON TAMBAH RESEP
/// ======================
class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.recipeForm);
        },
        child: Text(
          'Tambah Resep Baru',
          style: AppTypography.button,
        ),
      ),
    );
  }
}
