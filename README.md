# COTS - Resep Masakan (Flutter)

Proyek Flutter sederhana untuk menyimpan dan menampilkan resep masakan.

## Dokumentasi & Screenshot

Letakkan screenshot aplikasi pada folder `docs/screenshots` dengan nama-nama berikut:

- `dashboard.png` — tampilan Dashboard
- `list.png` — tampilan Daftar Resep
- `detail.png` — tampilan Detail Resep
- `add_recipe.png` — tampilan Tambah Resep (Tambah Tugas)

Setelah menambahkan gambar, Anda bisa menampilkan mereka di README dengan contoh markdown berikut:

![Dashboard]("C:\Users\ASUS\Pictures\Screenshots\Screenshot 2026-01-09 153536.png")
![Daftar Resep](docs/screenshots/list.png)
![Detail Resep](docs/screenshots/detail.png)
![Tambah Resep](docs/screenshots/add_recipe.png)

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

