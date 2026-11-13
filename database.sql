CREATE DATABASE IF NOT EXISTS peminjaman_lab CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE peminjaman_lab;

CREATE TABLE users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL
);

-- Password default: admin123
INSERT INTO users(username,password) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.');

CREATE TABLE barang (
 id INT AUTO_INCREMENT PRIMARY KEY,
 kode VARCHAR(30) NOT NULL UNIQUE,
 nama VARCHAR(120) NOT NULL,
 kategori VARCHAR(80),
 stok INT NOT NULL DEFAULT 0,
 lokasi VARCHAR(100)
);

CREATE TABLE peminjaman (
 id INT AUTO_INCREMENT PRIMARY KEY,
 barang_id INT NOT NULL,
 nama_peminjam VARCHAR(120) NOT NULL,
 kelas VARCHAR(50),
 keperluan TEXT,
 jumlah INT NOT NULL,
 tanggal_pinjam DATE NOT NULL,
 tanggal_rencana DATE NOT NULL,
 tanggal_kembali DATE NULL,
 status ENUM('Dipinjam','Dikembalikan') NOT NULL DEFAULT 'Dipinjam',
 CONSTRAINT fk_peminjaman_barang FOREIGN KEY (barang_id) REFERENCES barang(id)
);

INSERT INTO barang(kode,nama,kategori,stok,lokasi) VALUES
('KB-001','Keyboard','Perangkat Input',15,'Lemari A'),
('MS-001','Mouse','Perangkat Input',20,'Lemari A'),
('MN-001','Monitor','Perangkat Output',10,'Meja Inventaris'),
('HD-001','Headset','Audio',12,'Lemari B');
