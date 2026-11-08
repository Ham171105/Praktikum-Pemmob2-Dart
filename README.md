# Tugas Praktikum Pemrograman Mobile

Repository ini berisi kumpulan tugas dan latihan praktikum mata kuliah Pemrograman Mobile menggunakan bahasa pemrograman **Dart** dan framework **Flutter**.

---

## Identitas Mahasiswa
* **Nama** : Mohamad Ilham Huda Saputra
* **NIM** : H1D024126
* **Shift/Kelas** : Shift B

---

## Preview & Demo Aplikasi

### 1. Tampilan Hasil Praktikum Flutter (`belajarflutter`)
<p align="center">
  <img src="belajarflutter/screenshot/list_data_produk.png" width="280" alt="List Data Produk" />
</p>


---


## Bagian 1: Implementasi Struktur Data Queue (Dart)

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

## Bagian 2: Implementasi Dasar Flutter (`belajarflutter/`)

Implementasi tugas dan latihan praktikum Pemrograman Mobile menggunakan framework Flutter yang berada di dalam folder `belajarflutter/`.

### Latihan yang Diimplementasikan:
1. **Hello World (`belajarflutter/lib/hello_world.dart`)**:
   * Dasar pembuatan tampilan menggunakan `StatelessWidget`, `Scaffold`, `AppBar`, dan `Center`.
2. **Column Widget (`belajarflutter/lib/column_widget.dart`)**:
   * Penataan komponen tata letak (layout) secara vertikal menggunakan `Column`.
3. **Row Widget (`belajarflutter/lib/row_widget.dart`)**:
   * Penataan komponen tata letak secara horizontal menggunakan `Row`.
4. **Form Produk & Detail (`belajarflutter/lib/ui/produk_form.dart` & `belajarflutter/lib/ui/produk_detail.dart`)**:
   * Input data kode produk, nama produk, dan harga produk menggunakan `TextField` dan `StatefulWidget`.
   * Perpindahan halaman dan pengiriman data objek menggunakan `Navigator.push` ke halaman detail produk.
5. **List Data Produk (`belajarflutter/lib/ui/produk_page.dart`)**:
   * Menampilkan daftar item produk dalam bentuk list menggunakan `ListView`, `Card`, dan `ListTile`.

### Cara Menjalankan Aplikasi Flutter:
1. Masuk ke direktori proyek Flutter:
   ```bash
   cd belajarflutter
   ```
2. Unduh *dependencies*:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi (pilih device / emulator / chrome):
   ```bash
   flutter run
   ```

---

## Bagian 3: Implementasi Routing, Sidemenu, & Shared Preferences (`router_flutter/`)

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

### Video Demonstrasi
https://github.com/user-attachments/assets/edc75c85-87eb-4a9c-b0dc-b2914beb90a9

🎬 **[Putar Video Demo (demo.mp4)](https://github.com/Ham171105/Praktikum-Pemmob2-Dart/blob/main/router_flutter/demo/demo.mp4)**

### Cara Menjalankan:
1. Masuk ke direktori:
   ```bash
   cd router_flutter
   ```
2. Unduh dependencies:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```
