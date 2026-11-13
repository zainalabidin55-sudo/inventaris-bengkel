APLIKASI PEMINJAMAN BARANG LAB KOMPUTER

Persiapan:
1. Install dan jalankan Apache serta MySQL melalui XAMPP.
2. Salin folder peminjaman-lab ke C:\\xampp\\htdocs\\
3. Buka http://localhost/phpmyadmin
4. Import file database.sql.
5. Buka http://localhost/peminjaman-lab/

Login awal:
Username: admin
Password: admin123

Catatan:
- Konfigurasi database default: host localhost, user root, password kosong.
- Ubah kredensial database pada bagian awal index.php jika konfigurasi XAMPP berbeda.
- Aplikasi ini adalah contoh/prototipe pembelajaran. Sebelum dipakai operasional, tambahkan CSRF protection, pembatasan akses per peran, validasi lebih ketat, dan backup database.
