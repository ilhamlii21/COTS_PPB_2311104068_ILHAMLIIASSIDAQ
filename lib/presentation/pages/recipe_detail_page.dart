import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../design_system/radius.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        title: Text(
          'Detail Resep',
          style: AppTypography.title,
        ),
        leading: const BackButton(),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: edit resep
            },
            child: Text(
              'Edit',
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
            _InfoCard(),
            const SizedBox(height: AppSpacing.md),
            _Section(
              title: 'Bahan-bahan',
              content: const [
                'Nasi putih (2 piring)',
                'Telur (2 butir)',
                'Bawang merah (3 siung)',
                'Kecap manis (2 sdm)',
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            _Section(
              title: 'Langkah-langkah',
              content: const [
                'Panaskan minyak.',
                'Tumis bumbu halus.',
                'Masukkan nasi dan bahan lain.',
                'Masak hingga matang.',
              ],
              numbered: true,
            ),
            const SizedBox(height: AppSpacing.md),
            _NoteSection(),
            const SizedBox(height: AppSpacing.lg),
            _FavoriteButton(),
          ],
        ),
      ),
    );
  }
}

/// ======================
/// INFO CARD (Judul & Kategori)
/// ======================
class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nasi Goreng Spesial',
            style: AppTypography.title,
          ),
          const SizedBox(height: 4),
          Text(
            'Kategori: Sarapan',
            style: AppTypography.caption,
          ),
        ],
      ),
    );
  }
}

/// ======================
/// SECTION (Bahan / Langkah)
/// ======================
class _Section extends StatelessWidget {
  final String title;
  final List<String> content;
  final bool numbered;

  const _Section({
    required this.title,
    required this.content,
    this.numbered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.section),
          const SizedBox(height: AppSpacing.sm),
          ...List.generate(
            content.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                numbered
                    ? '${index + 1}. ${content[index]}'
                    : '- ${content[index]}',
                style: AppTypography.body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ======================
/// NOTE SECTION
/// ======================
class _NoteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Catatan', style: AppTypography.section),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Tambahkan kerupuk sebagai pelengkap.',
            style: AppTypography.body,
          ),
        ],
      ),
    );
  }
}

/// ======================
/// FAVORITE BUTTON
/// ======================
class _FavoriteButton extends StatelessWidget {
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
          // TODO: simpan ke favorit
        },
        child: Text(
          'Simpan ke Favorit',
          style: AppTypography.button,
        ),
      ),
    );
  }
}
