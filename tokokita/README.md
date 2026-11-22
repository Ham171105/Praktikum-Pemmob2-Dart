# Tugas Praktikum Pemrograman Mobile - Aplikasi Toko Kita (tokokita)

## Identitas Mahasiswa
- **Nama :** Mohamad Ilham Huda Saputra
- **NIM :** H1D024126
- **Shift/Kelas :** Shift B

---

## Video Demonstrasi Aplikasi Toko Kita

<!-- =================================================================== -->
<!-- TEMPEL / DRAG & DROP LINK VIDEO DEMO TOKOKITA DI BAWAH INI         -->
<!-- =================================================================== -->

*(Silakan drag & drop video demo kamu di sini melalui editor web GitHub)*

<!-- =================================================================== -->

---

## Deskripsi Proyek

Aplikasi **`tokokita`** merupakan implementasi tugas praktikum Pemrograman Mobile (Modul 5) yang menghubungkan frontend Flutter dengan RESTful API backend CodeIgniter 4 menggunakan pola arsitektur **BLoC (Business Logic Component)**, manajemen sesi dengan **`shared_preferences`**, komunikasi jaringan melalui paket **`http`**, penanganan *exception* khusus, serta dialog notifikasi kustom.

---

## Struktur Arsitektur dan Fitur (Modul 5)

### 1. Helpers (`lib/helpers/`)
* **`UserInfo` (`user_info.dart`)**: Pengelolaan data sesi lokal menggunakan `SharedPreferences` untuk menyimpan token (`setToken`, `getToken`), user ID (`setUserID`, `getUserID`), serta fungsi `logout()`.
* **`Api` (`api.dart`)**: Wrapper HTTP client untuk request `POST`, `GET`, dan `DELETE` dengan otomatis menyertakan header otorisasi Bearer Token dan pengecekan status code.
* **`ApiUrl` (`api_url.dart`)**: Konfigurasi endpoint REST API (base URL `http://10.0.2.2/toko-api/public`, registrasi, login, produk CRUD).
* **`AppException` (`app_exception.dart`)**: Kelas exception kustom untuk menangani error jaringan (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, `InvalidInputException`).

### 2. BLoC - Business Logic Component (`lib/bloc/`)
* **`RegistrasiBloc` (`registrasi_bloc.dart`)**: Menghubungkan proses pendaftaran user baru ke endpoint registrasi API.
* **`LoginBloc` (`login_bloc.dart`)**: Mengirim kredensial login dan mengembalikan objek `Login` beserta auth token.
* **`LogoutBloc` (`logout_bloc.dart`)**: Menghapus data sesi lokal saat user logout.
* **`ProdukBloc` (`produk_bloc.dart`)**: Mengelola data produk (mengambil list produk via `getProduks()`, menambah produk via `addProduk()`, mengupdate via `updateProduk()`, dan menghapus via `deleteProduk()`).

### 3. Model Data (`lib/model/`)
* **`Login` (`login.dart`)**: Model respon login dengan parser aman `int.tryParse` untuk ID user.
* **`Registrasi` (`registrasi.dart`)**: Model respon registrasi akun baru.
* **`Produk` (`produk.dart`)**: Model data barang dengan parser aman `int.tryParse` untuk ID dan harga produk.

### 4. Custom Widgets (`lib/widget/`)
* **`SuccessDialog` (`success_dialog.dart`)**: Dialog pop-up hijau kustom saat operasi berhasil.
* **`WarningDialog` (`warning_dialog.dart`)**: Dialog pop-up merah kustom saat operasi gagal / terjadi error.

### 5. Antarmuka Pengguna / UI (`lib/ui/`)
* **`RegistrasiPage` (`registrasi_page.dart`)**: Form registrasi dengan validasi form (Nama min 3 karakter, format regex Email, Password min 6 karakter, Konfirmasi Password) dan integrasi `RegistrasiBloc`.
* **`LoginPage` (`login_page.dart`)**: Form autentikasi login dengan `LoginBloc`, penyimpanan sesi via `UserInfo`, dan navigasi otomatis ke `ProdukPage`.
* **`ProdukPage` (`produk_page.dart`)**: Menampilkan data produk langsung dari server menggunakan `FutureBuilder<List>` dan `ProdukBloc.getProduks()`, tombol navigasi tambah produk (`+`), serta drawer logout.
* **`ProdukForm` (`produk_form.dart`)**: Form dinamis untuk menambah produk baru atau mengubah produk yang sudah ada menggunakan `ProdukBloc`.
* **`ProdukDetail` (`produk_detail.dart`)**: Halaman rincian produk dengan opsi **EDIT** dan **DELETE** (didukung konfirmasi dialog).

### 6. Entry Point (`lib/main.dart`)
* Menggunakan pengecekan sesi login asinkron (`isLogin()`). Jika token tersimpan di local storage, aplikasi langsung membuka `ProdukPage()`, sebaliknya jika belum login akan diarahkan ke `LoginPage()`.

---

## Cara Menjalankan

1. Pastikan backend server REST API `toko-api` (Laragon / XAMPP) sudah berjalan.
2. Masuk ke direktori proyek:
   ```bash
   cd tokokita
   ```
3. Unduh dependencies Flutter:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada emulator atau perangkat:
   ```bash
   flutter run
   ```
