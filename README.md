# COTS - Resep Masakan (Flutter)

Proyek Flutter sederhana untuk menyimpan dan menampilkan resep masakan.

## Dokumentasi & Screenshot

Letakkan screenshot aplikasi pada folder `docs/screenshots` dengan nama-nama berikut:

- `dashboard.png` — tampilan Dashboard
- `list.png` — tampilan Daftar Resep
- `detail.png` — tampilan Detail Resep
- `add_recipe.png` — tampilan Tambah Resep (Tambah Tugas)

Setelah menambahkan gambar, Anda bisa menampilkan mereka di README dengan contoh markdown berikut:

<img width="612" height="972" alt="Screenshot 2026-01-09 153628" src="https://github.com/user-attachments/assets/3436c999-fb5a-4e73-95e6-3fd51575eae2" />
<img width="615" height="974" alt="Screenshot 2026-01-09 153604" src="https://github.com/user-attachments/assets/a4f3e6e6-af00-4513-9b03-1ad41a460529" />
<img width="613" height="971" alt="Screenshot 2026-01-09 153536" src="https://github.com/user-attachments/assets/e81dd62a-9b3b-4e5c-ba2e-ffc6c4b4c004" />
<img width="615" height="972" alt="Screenshot 2026-01-09 153547" src="https://github.com/user-attachments/assets/e75267b3-c2c7-4e54-a377-913cec1e5260" />

## Struktur Folder (direkomendasikan)

- `lib/controllers` — state & logic (contoh: `RecipeController`)
- `lib/models` — model data (contoh: `RecipeModel`)
- `lib/services` — akses data / API
- `lib/presentation` — UI (pages & widgets)
- `lib/design_system` — tema, warna, spacing, typography

Anda dapat mengikuti struktur ini atau menyesuaikannya. Proyek ini sudah menggunakan `provider` untuk state management, namun Anda bebas memakai `Riverpod`, `Bloc`, atau solusi lain.

## Menambahkan screenshot

1. Simpan file gambar ke `docs/screenshots` dengan nama yang tercantum di atas.
2. Commit dan push perubahan:

```bash
git add docs/screenshots/*.png README.md
git commit -m "Add documentation and screenshots placeholders"
git push
```

---
Dokumentasi tambahan ada di folder `docs/`.

