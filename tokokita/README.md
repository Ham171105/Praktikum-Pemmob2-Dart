# Tugas Praktikum Pemrograman Mobile - Aplikasi Toko Kita (tokokita)

## Identitas Mahasiswa
- **Nama :** Mohamad Ilham Huda Saputra
- **NIM :** H1D024126
- **Shift/Kelas :** Shift B

---

## Video Demonstrasi Aplikasi

<!-- =================================================================== -->
<!-- TEMPEL / DRAG & DROP LINK VIDEO DEMO TOKOKITA ANDA DI BAWAH INI    -->
<!-- =================================================================== -->

*(Silakan drag & drop video demo kamu di sini melalui editor web GitHub)*

<!-- =================================================================== -->

---

## Deskripsi Proyek

Aplikasi **`tokokita`** merupakan implementasi tugas praktikum Pemrograman Mobile yang mencakup pembuatan model data (Login, Registrasi, Produk), form validasi registrasi & login, list produk menggunakan `Card` dan `ListTile`, form tambah/edit produk secara dinamis, serta halaman detail produk lengkap dengan dialog konfirmasi hapus data.

---

## Fitur dan Halaman yang Diimplementasikan

### 1. Model Data (`lib/model/`)
* **`Login` (`lib/model/login.dart`)**: Model data untuk menampung respon login (code, status, token, userID, userEmail) dengan serializer `fromJson`.
* **`Registrasi` (`lib/model/registrasi.dart`)**: Model data untuk menampung respon registrasi (code, status, data) dengan serializer `fromJson`.
* **`Produk` (`lib/model/produk.dart`)**: Model entitas data produk (id, kodeProduk, namaProduk, hargaProduk) dengan serializer `fromJson`.

### 2. Halaman Registrasi (`lib/ui/registrasi_page.dart`)
* Form pendaftaran user baru menggunakan `GlobalKey<FormState>`.
* **Validasi Nama**: Minimal 3 karakter.
* **Validasi Email**: Memastikan format email valid menggunakan pola regex.
* **Validasi Password**: Minimal 6 karakter.
* **Validasi Konfirmasi Password**: Memastikan password konfirmasi sama persis dengan input password sebelumnya.

### 3. Halaman Login (`lib/ui/login_page.dart`)
* Form autentikasi login dengan validasi field email dan password tidak boleh kosong.
* Tombol / menu interaktif **Registrasi** untuk navigasi ke halaman `RegistrasiPage`.

### 4. Halaman List Produk (`lib/ui/produk_page.dart`)
* Menampilkan daftar item produk dalam bentuk `ListView`.
* Widget kustom `ItemProduk` yang dibungkus `GestureDetector`, `Card`, dan `ListTile`.
* Tombol Tambah (`+`) pada `AppBar` untuk membuka halaman `ProdukForm`.
* Menu drawer samping dengan item logout.
* Navigasi ke halaman `ProdukDetail` saat salah satu kartu produk diklik.

### 5. Halaman Form Produk (`lib/ui/produk_form.dart`)
* Form dinamis yang dapat digunakan untuk **TAMBAH PRODUK** (tombol *SIMPAN*) atau **UBAH PRODUK** (tombol *UBAH*) saat menerima objek data `Produk`.
* Input field: Kode Produk, Nama Produk, dan Harga Produk lengkap dengan validasi.

### 6. Halaman Detail Produk (`lib/ui/produk_detail.dart`)
* Menampilkan rincian data produk (Kode, Nama, Harga).
* Tombol **EDIT** untuk mengarahkan pengguna ke halaman `ProdukForm` membawa data produk yang ingin diubah.
* Tombol **DELETE** yang memunculkan `AlertDialog` untuk konfirmasi hapus data ("Yakin ingin menghapus data ini?").

---

## Cara Menjalankan

1. Masuk ke direktori proyek:
   ```bash
   cd tokokita
   ```
2. Unduh dependencies Flutter:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```
   *(Tips: Ubah baris `home` pada `lib/main.dart` untuk menguji halaman `RegistrasiPage()`, `LoginPage()`, atau `ProdukPage()`)*
