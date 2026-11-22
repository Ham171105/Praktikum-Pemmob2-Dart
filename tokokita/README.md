# 🛍️ Aplikasi Mobile Toko Kita (`tokokita`)
> **Praktikum Pemrograman Mobile - Modul 5 (Flutter & REST API Integration)**

---

## 👤 Identitas Mahasiswa

| Keterangan | Data Mahasiswa |
| :--- | :--- |
| **Nama** | Mohamad Ilham Huda Saputra |
| **NIM** | H1D024126 |
| **Shift / Kelas** | Shift B |
| **Program Studi** | Informatika |

---

## 📖 Deskripsi Proyek

Aplikasi **`tokokita`** merupakan implementasi tugas praktikum Pemrograman Mobile (Modul 5). Aplikasi ini mengintegrasikan frontend mobile berbasis **Flutter** dengan backend web service RESTful API berbasis **CodeIgniter 4**. 

Arsitektur aplikasi dibangun menggunakan pola **BLoC (Business Logic Component)** untuk memisahkan logika bisnis dari antarmuka pengguna (UI), manajemen sesi login menggunakan **`shared_preferences`**, komunikasi jaringan melalui paket **`http`** dengan header *Bearer Token*, serta penanganan *exception* kustom dan pop-up dialog interaktif.

---

## 🎬 Video Demonstrasi Aplikasi

https://github.com/user-attachments/assets/ed632c09-803a-4ca7-8a2e-b54898852291

---

## 📂 Struktur Direktori Proyek (`lib/`)

```
lib/
├── bloc/               # Business Logic Component (Logika API & State)
│   ├── login_bloc.dart
│   ├── logout_bloc.dart
│   ├── produk_bloc.dart
│   └── registrasi_bloc.dart
├── helpers/            # Helper & Network Client
│   ├── api.dart
│   ├── api_url.dart
│   ├── app_exception.dart
│   └── user_info.dart
├── model/              # Model Data & JSON Serializer
│   ├── login.dart
│   ├── produk.dart
│   └── registrasi.dart
├── ui/                 # Tampilan Antarmuka Halaman (Screens)
│   ├── login_page.dart
│   ├── produk_detail.dart
│   ├── produk_form.dart
│   ├── produk_page.dart
│   └── registrasi_page.dart
├── widget/             # Komponen UI Kustom Reusable
│   ├── success_dialog.dart
│   └── warning_dialog.dart
└── main.dart           # Entry Point Aplikasi & Autentikasi Sesi
```

---

## ⚙️ Penjelasan Arsitektur & Komponen

### 1. Helpers (`lib/helpers/`)
| File | Deskripsi & Fungsi Utama |
| :--- | :--- |
| **`user_info.dart`** | Mengelola data sesi lokal via `SharedPreferences` (`setToken`, `getToken`, `setUserID`, `getUserID`, `logout`). |
| **`api.dart`** | Wrapper HTTP client untuk request `POST`, `GET`, dan `DELETE` dengan otomatis menyertakan header otorisasi Bearer Token dan validasi status code. |
| **`api_url.dart`** | Konstanta endpoint REST API (base URL `http://10.0.2.2/toko-api/public`, endpoint registrasi, login, produk CRUD). |
| **`app_exception.dart`** | Kelas exception kustom (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, `InvalidInputException`). |

### 2. BLoC - Business Logic Component (`lib/bloc/`)
| File | Deskripsi & Fungsi Utama |
| :--- | :--- |
| **`registrasi_bloc.dart`** | Mengirim data nama, email, password ke endpoint registrasi API. |
| **`login_bloc.dart`** | Mengirim kredensial login dan mengembalikan objek `Login` beserta auth token. |
| **`logout_bloc.dart`** | Menghapus token dan data sesi lokal saat user logout. |
| **`produk_bloc.dart`** | Operasi CRUD produk: `getProduks()`, `addProduk()`, `updateProduk()`, dan `deleteProduk()`. |

### 3. Model Data (`lib/model/`)
| File | Deskripsi & Fungsi Utama |
| :--- | :--- |
| **`login.dart`** | Model data respons login (token, userID, userEmail). |
| **`registrasi.dart`** | Model data respons status pendaftaran akun. |
| **`produk.dart`** | Model data produk (`id`, `kodeProduk`, `namaProduk`, `hargaProduk`). |

### 4. User Interface & Dialog (`lib/ui/` & `lib/widget/`)
| File / Halaman | Deskripsi & Fitur |
| :--- | :--- |
| **`login_page.dart`** | Form login dengan validasi email/password, integrasi `LoginBloc`, penyimpanan sesi ke `UserInfo`. |
| **`registrasi_page.dart`** | Form registrasi akun dengan validasi input (Nama min 3 karakter, format email regex, password min 6 karakter). |
| **`produk_page.dart`** | Menampilkan katalog produk dari server via `FutureBuilder`, drawer navigasi logout, dan tombol tambah produk. |
| **`produk_detail.dart`** | Rincian detail produk terpilih dengan tombol aksi **EDIT** dan **DELETE** (didukung konfirmasi dialog). |
| **`produk_form.dart`** | Form dinamis untuk menambah produk baru atau mengubah (*update*) produk yang sudah ada. |
| **`success_dialog.dart`** | Pop-up dialog hijau kustom saat operasi berhasil. |
| **`warning_dialog.dart`** | Pop-up dialog merah kustom saat operasi gagal / terjadi error. |

### 5. Alur Autentikasi Aplikasi (`lib/main.dart`)
* Saat aplikasi dibuka, fungsi `isLogin()` memeriksa token tersimpan di local storage secara asinkron.
* Jika token ditemukan, user langsung diarahkan ke **`ProdukPage()`** tanpa perlu login ulang.
* Jika belum terdapat token, user akan diarahkan ke **`LoginPage()`**.

---

## 🚀 Panduan Menjalankan Aplikasi

### 1. Prasyarat
* Backend server `toko-api` sudah berjalan (via Laragon / XAMPP / `php spark serve`).
* Database `toko_api` sudah diimpor di MySQL.

### 2. Menjalankan Flutter
Buka terminal dan masuk ke folder `tokokita`:
```bash
cd tokokita
flutter pub get
flutter run
```
