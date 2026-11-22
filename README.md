# Tugas Praktikum Pemrograman Mobile

Repository ini berisi kumpulan tugas dan latihan praktikum mata kuliah **Pemrograman Mobile** menggunakan bahasa pemrograman **Dart**, framework **Flutter**, serta backend RESTful API **CodeIgniter 4**.

---

## 👤 Identitas Mahasiswa

| Keterangan | Data Mahasiswa |
| :--- | :--- |
| **Nama** | Mohamad Ilham Huda Saputra |
| **NIM** | H1D024126 |
| **Shift / Kelas** | Shift B |
| **Program Studi** | Informatika |

---

## 📌 Daftar Isi
1. [Bagian 1: Struktur Data Queue (Dart)](#-bagian-1-struktur-data-queue-dart)
2. [Bagian 2: Implementasi Dasar Flutter (`belajarflutter/`)](#-bagian-2-implementasi-dasar-flutter-belajarflutter)
3. [Bagian 3: Routing, Sidemenu, & Shared Preferences (`router_flutter/`)](#-bagian-3-routing-sidemenu--shared-preferences-router_flutter)
4. [Bagian 4: Backend REST API CodeIgniter 4 (`toko-api/`)](#-bagian-4-backend-rest-api-codeigniter-4-toko-api)
5. [Bagian 5: Aplikasi Mobile Toko Kita (`tokokita/`)](#-bagian-5-aplikasi-mobile-toko-kita-tokokita)

---

## 🔹 Bagian 1: Struktur Data Queue (Dart)

Implementasi struktur data **Queue (Antrian)** berbasis konsep **FIFO (First In, First Out)** menggunakan bahasa pemrograman Dart (`queue.dart`).

### Deskripsi Singkat
Struktur data **Queue** adalah kumpulan elemen terurut di mana penambahan elemen baru dilakukan di bagian belakang (*tail*) dan pengambilan/penghapusan elemen dilakukan di bagian depan (*head*). Konsep ini mengikuti prinsip **FIFO (First In, First Out)**, yaitu elemen yang pertama kali dimasukkan akan menjadi elemen yang pertama kali dikeluarkan.

### Penjelasan Kode (`queue.dart`)
1. **Kelas `Queue`**
   * Menggunakan variabel *private list* `_antrian` bertipe integer (`List<int>`) untuk menyimpan data antrian.
2. **Metode `enqueue(int data)`**
   * Menambahkan data baru ke urutan paling belakang list menggunakan `_antrian.add(data)`.
   * Menampilkan pesan konfirmasi bahwa data berhasil ditambahkan.
3. **Metode `pop()`**
   * Mengecek apakah antrian kosong via `_antrian.isEmpty`. Jika kosong, menampilkan pesan peringatan dan mengembalikan nilai `null`.
   * Jika ada isi, mengambil dan menghapus elemen indeks pertama menggunakan `_antrian.removeAt(0)` sesuai konsep FIFO.
   * Menampilkan pesan konfirmasi data yang dihapus.
4. **Metode `cetakAntrian()`**
   * Menampilkan daftar isi elemen antrian saat ini ke konsol.
5. **Fungsi `main()`**
   * Menginisialisasi objek `Queue`.
   * Menjalankan operasi antrian: memasukkan data 10, 20, 30 (`enqueue`), mencetak status antrian, menghapus elemen terdepan (`pop`), dan mencetak sisa antrian kembali.

### Cara Menjalankan Program
Buka terminal pada root repositori dan jalankan:
```bash
dart run queue.dart
```

**Output Program:**
```plaintext
10 berhasil ditambahkan ke antrian
20 berhasil ditambahkan ke antrian
30 berhasil ditambahkan ke antrian
Isi antrian: [10, 20, 30]
10 dihapus dari antrian
Isi antrian: [20, 30]
```

---

## 🔹 Bagian 2: Implementasi Dasar Flutter (`belajarflutter/`)

Implementasi tugas dan latihan praktikum Pemrograman Mobile menggunakan framework Flutter yang berada di dalam folder `belajarflutter/`.

### Latihan yang Diimplementasikan:
1. **Hello World (`belajarflutter/lib/hello_world.dart`)**:
   * Dasar pembuatan tampilan menggunakan `StatelessWidget`, `Scaffold`, `AppBar`, dan `Center`.
2. **Column Widget (`belajarflutter/lib/column_widget.dart`)**:
   * Penataan komponen tata letak (*layout*) secara vertikal menggunakan `Column`.
3. **Row Widget (`belajarflutter/lib/row_widget.dart`)**:
   * Penataan komponen tata letak secara horizontal menggunakan `Row`.
4. **Form Produk & Detail (`belajarflutter/lib/ui/produk_form.dart` & `belajarflutter/lib/ui/produk_detail.dart`)**:
   * Input data kode produk, nama produk, dan harga produk menggunakan `TextField` dan `StatefulWidget`.
   * Perpindahan halaman dan pengiriman data objek menggunakan `Navigator.push` ke halaman detail produk.
5. **List Data Produk (`belajarflutter/lib/ui/produk_page.dart`)**:
   * Menampilkan daftar item produk dalam bentuk list menggunakan `ListView`, `Card`, dan `ListTile`.

### 📱 Tampilan Hasil Praktikum
<p align="center">
  <img src="belajarflutter/screenshot/list_data_produk.png" width="280" alt="List Data Produk" />
  <br>
  <em>Tampilan List Data Produk (belajarflutter)</em>
</p>

### Cara Menjalankan:
```bash
cd belajarflutter
flutter pub get
flutter run
```

---

## 🔹 Bagian 3: Routing, Sidemenu, & Shared Preferences (`router_flutter/`)

Implementasi tugas praktikum Pemrograman Mobile yang mencakup pengelolaan rute navigasi antar halaman, menu bilah samping (*Navigation Drawer / Sidemenu*), serta persistensi data sesi login menggunakan **`shared_preferences`**.

### Fitur yang Diimplementasikan:
1. **Halaman Login (`router_flutter/lib/login_page.dart`)**:
   * Input teks Username dan Password (`obscureText: true`).
   * Validasi login (akun demo: username `admin` dan password `admin`).
   * Dialog interaktif (`AlertDialog`) konfirmasi login berhasil atau gagal.
   * Penyimpanan username ke local storage via `SharedPreferences`.
2. **Halaman Home (`router_flutter/lib/home_page.dart`)**:
   * Mengambil dan menampilkan nama user secara dinamis dari `SharedPreferences`.
   * Terintegrasi dengan drawer navigasi (*Sidemenu*).
3. **Halaman About (`router_flutter/lib/about_page.dart`)**:
   * Halaman informasi statis yang dapat diakses melalui drawer menu.
4. **Menu Bilah Samping / Drawer (`router_flutter/lib/sidemenu.dart`)**:
   * Widget `Drawer` yang menghubungkan halaman Home dan About menggunakan `Navigator.push` dan `MaterialPageRoute`.

### 🎬 Video Demonstrasi Routing & Session
https://github.com/user-attachments/assets/edc75c85-87eb-4a9c-b0dc-b2914beb90a9

🎬 **[Putar Video Demo (demo.mp4)](https://github.com/Ham171105/Praktikum-Pemmob2-Dart/blob/main/router_flutter/demo/demo.mp4)**

### Cara Menjalankan:
```bash
cd router_flutter
flutter pub get
flutter run
```

---

## 🔹 Bagian 4: Backend REST API CodeIgniter 4 (`toko-api/`)

Implementasi web service RESTful API (Modul 4) menggunakan framework **CodeIgniter 4** dan database **MySQL** sebagai penyedia layanan backend untuk aplikasi mobile `tokokita`.

### Struktur Database & Schema (`toko_api`)
File dump SQL database disertakan pada [toko_api.sql](file:///C:/Users/Ilham/AndroidStudioProjects/Praktikum-Pemmob2-Dart/toko-api/toko_api.sql).

| Tabel | Kolom Utama | Deskripsi |
| :--- | :--- | :--- |
| **`member`** | `id`, `nama`, `email`, `password` | Menyimpan data user (password di-hash via `PASSWORD_DEFAULT`). |
| **`member_token`** | `id`, `member_id`, `auth_key` | Menyimpan token otorisasi sesi login (Foreign Key ke `member.id`). |
| **`produk`** | `id`, `kode_produk`, `nama_produk`, `harga` | Menyimpan katalog data produk. |

### Struktur Arsitektur Backend:
1. **Konfigurasi Database (`app/Config/Database.php`)**: Terhubung ke database `toko_api` MySQL `localhost:3306`, user `root`.
2. **Model (`app/Models/`)**:
   * `MRegistrasi.php`: Model tabel `member` untuk pendaftaran akun baru.
   * `MMember.php`: Model tabel `member` untuk verifikasi akun saat login.
   * `MLogin.php`: Model tabel `member_token` untuk pencatatan token sesi login.
   * `MProduk.php`: Model tabel `produk` untuk operasi data produk.
3. **Controller (`app/Controllers/`)**:
   * `RestfulController.php`: Base controller extends `CodeIgniter\RESTful\ResourceController` dengan format JSON dan method `responseHasil($code, $status, $data)`.
   * `RegistrasiController.php`: Endpoint `POST /registrasi` untuk registrasi akun.
   * `LoginController.php`: Endpoint `POST /login` dengan verifikasi via `password_verify` dan generate auth token via `RandomString()`.
   * `ProdukController.php`: Endpoint CRUD produk lengkap (`create`, `list`, `detail`, `ubah`, `hapus`).

### Cara Menjalankan Backend:
1. Pastikan Apache & MySQL (Laragon / XAMPP) sudah aktif.
2. Import database:
   ```bash
   mysql -u root -e "CREATE DATABASE IF NOT EXISTS toko_api;"
   mysql -u root toko_api < toko-api/toko_api.sql
   ```
3. Base URL API dapat diakses di:
   * **Local / Browser**: `http://localhost/toko-api/public/`
   * **Android Emulator**: `http://10.0.2.2/toko-api/public/`

---

## 🔹 Bagian 5: Aplikasi Mobile Toko Kita (`tokokita/`)

Implementasi tugas praktikum Pemrograman Mobile (Modul 5) yang menghubungkan antarmuka Flutter dengan RESTful API backend menggunakan pola arsitektur **BLoC (Business Logic Component)**, manajemen sesi token via **`shared_preferences`**, komunikasi jaringan melalui paket **`http`**, penanganan *exception* kustom, serta pop-up dialog interaktif.

### 🎬 Video Demonstrasi Toko Kita
https://github.com/user-attachments/assets/ed632c09-803a-4ca7-8a2e-b54898852291

### Fitur dan Arsitektur yang Diimplementasikan:
1. **Helpers (`tokokita/lib/helpers/`)**:
   * `UserInfo` (`user_info.dart`): Mengelola token dan sesi login via SharedPreferences (`setToken`, `getToken`, `setUserID`, `getUserID`, `logout`).
   * `Api` (`api.dart`): Wrapper HTTP client untuk request POST, GET, dan DELETE dengan header `Authorization: Bearer <token>` dan validasi status code.
   * `ApiUrl` (`api_url.dart`): Konfigurasi endpoint REST API (`http://10.0.2.2/toko-api/public`).
   * `AppException` (`app_exception.dart`): Kelas exception kustom (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, `InvalidInputException`).
2. **BLoC (`tokokita/lib/bloc/`)**:
   * `RegistrasiBloc`, `LoginBloc`, `LogoutBloc`, dan `ProdukBloc` sebagai pemisah logika bisnis dengan antarmuka pengguna.
3. **Model Data (`tokokita/lib/model/`)**:
   * `Login`, `Registrasi`, dan `Produk` dengan serializer `fromJson` yang aman dari error tipe data.
4. **Custom Widgets (`tokokita/lib/widget/`)**:
   * `SuccessDialog`: Dialog hijau saat operasi berhasil.
   * `WarningDialog`: Dialog merah saat operasi gagal / terjadi error.
5. **Antarmuka Pengguna / UI (`tokokita/lib/ui/`)**:
   * `RegistrasiPage`: Form pendaftaran dengan validasi nama, email regex, dan panjang password.
   * `LoginPage`: Form login terhubung ke backend REST API.
   * `ProdukPage`: Menampilkan list produk realtime dari database server menggunakan `FutureBuilder`.
   * `ProdukForm`: Form input dan edit data produk.
   * `ProdukDetail`: Rincian produk dengan opsi edit serta tombol hapus dengan konfirmasi dialog.

### Cara Menjalankan:
```bash
cd tokokita
flutter pub get
flutter run
```
