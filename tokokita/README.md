# 🛍️ Aplikasi Mobile Toko Kita (`tokokita`)
> **Praktikum Pemrograman Mobile - Modul 4 & 5 (CRUD, BLoC Pattern & REST API Integration)**

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

Aplikasi **`tokokita`** merupakan implementasi tugas praktikum Pemrograman Mobile yang memadukan pengembangan frontend mobile berbasis **Flutter** dengan pengelolaan data katalog produk secara penuh (**CRUD: Create, Read, Update, Delete**) dan integrasi web service RESTful API berbasis **CodeIgniter 4**. 

Arsitektur aplikasi dibangun menggunakan pola **BLoC (Business Logic Component)** untuk memisahkan logika bisnis dari antarmuka pengguna (UI), manajemen sesi login menggunakan **`shared_preferences`**, komunikasi jaringan melalui paket **`http`** dengan otorisasi *Bearer Token*, serta penanganan *exception* khusus dan pop-up dialog interaktif.

---

## 🎬 Video Demonstrasi Aplikasi

### 1. Demonstrasi Operasi CRUD Produk (Tambah, Ubah, Hapus)
https://github.com/user-attachments/assets/e106de1c-15ff-4771-96f7-742235653cb0

### 2. Demonstrasi Autentikasi & Integrasi REST API (Registrasi, Login, Sesi)
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

## ⚙️ Penjelasan Fitur & Komponen

### 1. Operasi CRUD Produk (Modul 4)
| Komponen / Fitur | File Terkait | Penjelasan Operasi |
| :--- | :--- | :--- |
| **Model Produk** | `lib/model/produk.dart` | Representasi data objek produk (`id`, `kodeProduk`, `namaProduk`, `hargaProduk`) dengan parser JSON. |
| **List Produk (Read)** | `lib/ui/produk_page.dart` | Menampilkan seluruh katalog produk dalam bentuk list card dengan data realtime. |
| **Tambah Produk (Create)** | `lib/ui/produk_form.dart` | Formulir input kode produk, nama, dan harga dengan validasi input. |
| **Detail Produk** | `lib/ui/produk_detail.dart` | Menampilkan informasi lengkap produk yang dipilih serta aksi navigasi edit dan delete. |
| **Ubah Produk (Update)** | `lib/ui/produk_form.dart` | Mengupdate data produk yang ada dengan auto-fill nilai lama ke formulir. |
| **Hapus Produk (Delete)** | `lib/ui/produk_detail.dart` | Menghapus produk disertai konfirmasi dialog (`AlertDialog`) peringatan. |

### 2. Integrasi BLoC & REST API (Modul 5)
| File | Kategori | Deskripsi & Fungsi Utama |
| :--- | :--- | :--- |
| **`user_info.dart`** | Helpers | Pengelolaan sesi lokal via `SharedPreferences` (`setToken`, `getToken`, `logout`). |
| **`api.dart`** | Helpers | Wrapper HTTP client (`POST`, `GET`, `DELETE`) dengan Bearer Token otomatis. |
| **`api_url.dart`** | Helpers | Konstanta endpoint REST API (`http://10.0.2.2/toko-api/public`). |
| **`app_exception.dart`** | Helpers | Kelas penanganan error jaringan khusus. |
| **`registrasi_bloc.dart`** | BLoC | Penghubung form pendaftaran ke endpoint registrasi server. |
| **`login_bloc.dart`** | BLoC | Penghubung autentikasi login dan pengambilan auth token. |
| **`logout_bloc.dart`** | BLoC | Penghapus sesi token lokal saat user logout. |
| **`produk_bloc.dart`** | BLoC | Menangani komunikasi CRUD produk antara UI dan server. |

### 3. Autentikasi & Dialog Pengguna
| Komponen | File | Deskripsi |
| :--- | :--- | :--- |
| **Registrasi** | `lib/ui/registrasi_page.dart` | Validasi nama min 3 huruf, format regex email, dan panjang password min 6 karakter. |
| **Login** | `lib/ui/login_page.dart` | Validasi kredensial pengguna dan penyimpanan token ke sesi lokal. |
| **Success Dialog** | `lib/widget/success_dialog.dart` | Notifikasi pop-up hijau kustom saat operasi berhasil. |
| **Warning Dialog** | `lib/widget/warning_dialog.dart` | Notifikasi pop-up merah kustom saat operasi gagal / terjadi error. |
| **Auto Session** | `lib/main.dart` | Pengecekan status login otomatis; langsung ke `ProdukPage` jika sudah login. |

---

## 🚀 Panduan Menjalankan Aplikasi

### 1. Prasyarat
* Backend web service `toko-api` sudah aktif di server lokal (Laragon / XAMPP).
* Database `toko_api` sudah diimpor pada MySQL.

### 2. Menjalankan Aplikasi
Buka terminal pada direktori proyek:
```bash
cd tokokita
flutter pub get
flutter run
```
