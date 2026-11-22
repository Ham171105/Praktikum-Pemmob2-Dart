# Backend RESTful API Toko Kita (`toko-api`)

Implementasi backend web service RESTful API (Modul 4) menggunakan framework **CodeIgniter 4** dan database **MySQL** sebagai backend service untuk aplikasi mobile `tokokita`.

---

## Identitas Mahasiswa
* **Nama** : Mohamad Ilham Huda Saputra
* **NIM** : H1D024126
* **Shift/Kelas** : Shift B

---

## Struktur Database (`toko_api`)

File dump database telah disediakan pada [toko_api.sql](file:///C:/Users/Ilham/AndroidStudioProjects/Praktikum-Pemmob2-Dart/toko-api/toko_api.sql).

### Tabel Database:
1. **`member`**:
   * `id` INT AUTO_INCREMENT PRIMARY KEY
   * `nama` VARCHAR(255) NOT NULL
   * `email` VARCHAR(255) NOT NULL
   * `password` VARCHAR(255) NOT NULL (dienkripsi via `password_hash`)

2. **`member_token`**:
   * `id` INT AUTO_INCREMENT PRIMARY KEY
   * `member_id` INT NOT NULL (Foreign Key ke `member.id`)
   * `auth_key` VARCHAR(255) NOT NULL (Token sesi autentikasi)

3. **`produk`**:
   * `id` INT AUTO_INCREMENT PRIMARY KEY
   * `kode_produk` VARCHAR(255) NOT NULL
   * `nama_produk` VARCHAR(255) NOT NULL
   * `harga` INT NOT NULL

---

## Struktur File Backend

### 1. Models (`app/Models/`)
* `MRegistrasi.php`: Model tabel `member` untuk pendaftaran akun baru.
* `MMember.php`: Model tabel `member` untuk pencarian user saat proses login.
* `MLogin.php`: Model tabel `member_token` untuk menyimpan auth key token user.
* `MProduk.php`: Model tabel `produk` untuk operasi data katalog produk.

### 2. Controllers (`app/Controllers/`)
* `RestfulController.php`: Base RESTful controller yang meng-extend `CodeIgniter\RESTful\ResourceController`, format JSON, dan menyediakan helper `responseHasil($code, $status, $data)`.
* `RegistrasiController.php`: Endpoint `POST /registrasi` untuk pendaftaran member baru.
* `LoginController.php`: Endpoint `POST /login` untuk autentikasi user dan pembuatan auth key acak (`RandomString`).
* `ProdukController.php`: Controller CRUD produk (`create`, `list`, `detail`, `ubah`, `hapus`).

### 3. Routes (`app/Config/Routes.php`)
```php
$routes->get('/', 'Home::index');
$routes->post('/registrasi', 'RegistrasiController::registrasi');
$routes->post('/login', 'LoginController::login');
$routes->group('produk', function ($routes) {
    $routes->post('/', 'ProdukController::create');
    $routes->get('/', 'ProdukController::list');
    $routes->get('(:segment)', 'ProdukController::detail/$1');
    $routes->put('(:segment)', 'ProdukController::ubah/$1');
    $routes->post('(:segment)/update', 'ProdukController::ubah/$1');
    $routes->delete('(:segment)', 'ProdukController::hapus/$1');
});
```

---

## Daftar Endpoint API

| Method | Endpoint | Deskripsi | Parameter Body |
|---|---|---|---|
| `POST` | `/registrasi` | Registrasi akun baru | `nama`, `email`, `password` |
| `POST` | `/login` | Autentikasi user & generate token | `email`, `password` |
| `GET` | `/produk` | Mendapatkan semua list produk | - |
| `POST` | `/produk` | Menambahkan produk baru | `kode_produk`, `nama_produk`, `harga` |
| `GET` | `/produk/{id}` | Detail produk berdasarkan ID | - |
| `POST` | `/produk/{id}/update` | Update data produk | `kode_produk`, `nama_produk`, `harga` |
| `PUT` | `/produk/{id}` | Update data produk (PUT) | `kode_produk`, `nama_produk`, `harga` |
| `DELETE` | `/produk/{id}` | Menghapus produk | - |

---

## Cara Menjalankan

1. Letakkan project di direktori web server (misal Laragon `C:\laragon\www\toko-api` atau `D:\laragon\www\toko-api`).
2. Pastikan service Apache dan MySQL sudah berjalan.
3. Import database `toko_api`:
   ```bash
   mysql -u root -e "CREATE DATABASE IF NOT EXISTS toko_api;"
   mysql -u root toko_api < toko_api.sql
   ```
4. Akses base URL API pada:
   * **Local / Browser**: `http://localhost/toko-api/public/`
   * **Android Emulator**: `http://10.0.2.2/toko-api/public/`
