<?php
session_start();
$pdo = new PDO("mysql:host=localhost;dbname=peminjaman_lab;charset=utf8mb4", "root", "", [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
]);
function h($v){ return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); }
function logged(){ return isset($_SESSION['user']); }
function go($msg=''){ if($msg) $_SESSION['flash']=$msg; header('Location: index.php'); exit; }

if (isset($_POST['login'])) {
    $q=$pdo->prepare("SELECT * FROM users WHERE username=?");
    $q->execute([trim($_POST['username'] ?? '')]); $u=$q->fetch();
    if($u && password_verify($_POST['password'] ?? '', $u['password'])){
        session_regenerate_id(true); $_SESSION['user']=$u['username']; go('Berhasil masuk.');
    }
    $error='Username atau password salah.';
}
if (isset($_GET['logout'])) { session_destroy(); header('Location: index.php'); exit; }

if (logged() && $_SERVER['REQUEST_METHOD']==='POST' && !isset($_POST['login'])) {
    $action=$_POST['action'] ?? '';
    if($action==='add_item'){
        $pdo->prepare("INSERT INTO barang(kode,nama,kategori,stok,lokasi) VALUES(?,?,?,?,?)")
            ->execute([trim($_POST['kode']),trim($_POST['nama']),trim($_POST['kategori']),max(0,(int)$_POST['stok']),trim($_POST['lokasi'])]);
        go('Barang berhasil ditambahkan.');
    }
    if($action==='delete_item'){
        $pdo->prepare("DELETE FROM barang WHERE id=?")->execute([(int)$_POST['id']]);
        go('Barang berhasil dihapus.');
    }
    if($action==='borrow'){
        $id=(int)$_POST['barang_id']; $jumlah=max(1,(int)$_POST['jumlah']);
        $pdo->beginTransaction();
        $q=$pdo->prepare("SELECT stok FROM barang WHERE id=? FOR UPDATE"); $q->execute([$id]); $item=$q->fetch();
        if(!$item || $item['stok']<$jumlah){ $pdo->rollBack(); go('Stok barang tidak mencukupi.'); }
        $pdo->prepare("INSERT INTO peminjaman(barang_id,nama_peminjam,kelas,keperluan,jumlah,tanggal_pinjam,tanggal_rencana,status) VALUES(?,?,?,?,?,CURDATE(),?,'Dipinjam')")
            ->execute([$id,trim($_POST['peminjam']),trim($_POST['kelas']),trim($_POST['keperluan']),$jumlah,$_POST['tanggal_kembali']]);
        $pdo->prepare("UPDATE barang SET stok=stok-? WHERE id=?")->execute([$jumlah,$id]);
        $pdo->commit(); go('Peminjaman berhasil dicatat.');
    }
    if($action==='return'){
        $id=(int)$_POST['id'];
        $q=$pdo->prepare("SELECT * FROM peminjaman WHERE id=? AND status='Dipinjam'"); $q->execute([$id]); $loan=$q->fetch();
        if($loan){
            $pdo->beginTransaction();
            $pdo->prepare("UPDATE peminjaman SET status='Dikembalikan',tanggal_kembali=CURDATE() WHERE id=?")->execute([$id]);
            $pdo->prepare("UPDATE barang SET stok=stok+? WHERE id=?")->execute([$loan['jumlah'],$loan['barang_id']]);
            $pdo->commit();
        }
        go('Pengembalian berhasil diproses.');
    }
}

if(!logged()):
?>
<!doctype html><html lang="id"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Login - Lab Komputer</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"><link href="assets/style.css" rel="stylesheet"></head>
<body class="login-bg"><div class="card login-card shadow"><div class="card-body p-4"><h3 class="fw-bold mb-1">Lab Komputer</h3><p class="text-secondary mb-4">Sistem Peminjaman Barang</p>
<?php if(isset($error)): ?><div class="alert alert-danger"><?=h($error)?></div><?php endif; ?>
<form method="post"><div class="mb-3"><label class="form-label">Username</label><input class="form-control" name="username" required autofocus></div><div class="mb-3"><label class="form-label">Password</label><input class="form-control" type="password" name="password" required></div><button class="btn btn-primary w-100" name="login">Masuk</button></form>
<div class="small text-secondary mt-3">Akun awal: admin / admin123</div></div></div></body></html>
<?php exit; endif;
$view=$_GET['page'] ?? 'dashboard';
$flash=$_SESSION['flash'] ?? ''; unset($_SESSION['flash']);
$items=$pdo->query("SELECT * FROM barang ORDER BY nama")->fetchAll();
$loans=$pdo->query("SELECT p.*,b.nama AS nama_barang,b.kode FROM peminjaman p JOIN barang b ON b.id=p.barang_id ORDER BY p.id DESC")->fetchAll();
?>
<!doctype html><html lang="id"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Aplikasi Peminjaman Lab Komputer</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"><link href="assets/style.css" rel="stylesheet"></head>
<body><nav class="navbar navbar-dark bg-primary px-3"><a class="navbar-brand fw-bold" href="index.php">LAB KOMPUTER</a><div class="text-white">Admin: <?=h($_SESSION['user'])?> &nbsp; <a class="btn btn-sm btn-light" href="?logout=1">Keluar</a></div></nav>
<div class="container-fluid"><div class="row"><aside class="col-md-2 sidebar p-3"><a href="?page=dashboard">Dashboard</a><a href="?page=barang">Data Barang</a><a href="?page=peminjaman">Peminjaman</a><a href="?page=riwayat">Riwayat & Pengembalian</a></aside>
<main class="col-md-10 p-4">
<?php if($flash): ?><div class="alert alert-info"><?=h($flash)?></div><?php endif; ?>
<?php if($view==='dashboard'): ?>
<h3 class="mb-4">Dashboard</h3><div class="row g-3">
<div class="col-md-4"><div class="stat-card"><div class="text-secondary">Jenis Barang</div><div class="display-6 fw-bold"><?=$pdo->query("SELECT COUNT(*) FROM barang")->fetchColumn()?></div></div></div>
<div class="col-md-4"><div class="stat-card"><div class="text-secondary">Total Stok Tersedia</div><div class="display-6 fw-bold"><?=$pdo->query("SELECT COALESCE(SUM(stok),0) FROM barang")->fetchColumn()?></div></div></div>
<div class="col-md-4"><div class="stat-card"><div class="text-secondary">Sedang Dipinjam</div><div class="display-6 fw-bold"><?=$pdo->query("SELECT COUNT(*) FROM peminjaman WHERE status='Dipinjam'")->fetchColumn()?></div></div></div></div>
<h5 class="mt-4">Peminjaman Terbaru</h5><?php $recent=array_slice($loans,0,5); ?>
<table class="table table-striped bg-white"><thead><tr><th>Peminjam</th><th>Barang</th><th>Jumlah</th><th>Status</th></tr></thead><tbody><?php foreach($recent as $r): ?><tr><td><?=h($r['nama_peminjam'])?></td><td><?=h($r['nama_barang'])?></td><td><?=$r['jumlah']?></td><td><?=h($r['status'])?></td></tr><?php endforeach; ?></tbody></table>
<?php elseif($view==='barang'): ?>
<h3>Data Barang</h3><div class="card p-3 mb-4"><form method="post" class="row g-2"><input type="hidden" name="action" value="add_item"><div class="col-md-2"><input class="form-control" name="kode" placeholder="Kode barang" required></div><div class="col-md-3"><input class="form-control" name="nama" placeholder="Nama barang" required></div><div class="col-md-2"><input class="form-control" name="kategori" placeholder="Kategori"></div><div class="col-md-1"><input class="form-control" type="number" min="0" name="stok" placeholder="Stok" required></div><div class="col-md-2"><input class="form-control" name="lokasi" placeholder="Lokasi"></div><div class="col-md-2"><button class="btn btn-primary w-100">Tambah</button></div></form></div>
<table class="table table-bordered bg-white"><thead><tr><th>Kode</th><th>Nama</th><th>Kategori</th><th>Stok tersedia</th><th>Lokasi</th><th>Aksi</th></tr></thead><tbody><?php foreach($items as $it): ?><tr><td><?=h($it['kode'])?></td><td><?=h($it['nama'])?></td><td><?=h($it['kategori'])?></td><td><?=$it['stok']?></td><td><?=h($it['lokasi'])?></td><td><form method="post" onsubmit="return confirm('Hapus barang ini?')"><input type="hidden" name="action" value="delete_item"><input type="hidden" name="id" value="<?=$it['id']?>"><button class="btn btn-sm btn-danger">Hapus</button></form></td></tr><?php endforeach; ?></tbody></table>
<?php elseif($view==='peminjaman'): ?>
<h3>Form Peminjaman Barang</h3><div class="card p-4"><form method="post" class="row g-3"><input type="hidden" name="action" value="borrow"><div class="col-md-6"><label class="form-label">Nama Peminjam</label><input class="form-control" name="peminjam" required></div><div class="col-md-6"><label class="form-label">Kelas / Bagian</label><input class="form-control" name="kelas" required></div><div class="col-md-6"><label class="form-label">Barang</label><select class="form-select" name="barang_id" required><option value="">Pilih barang</option><?php foreach($items as $it): if($it['stok']>0): ?><option value="<?=$it['id']?>"><?=h($it['nama'])?> (stok <?=$it['stok']?>)</option><?php endif; endforeach; ?></select></div><div class="col-md-2"><label class="form-label">Jumlah</label><input class="form-control" type="number" min="1" name="jumlah" value="1" required></div><div class="col-md-4"><label class="form-label">Rencana Kembali</label><input class="form-control" type="date" name="tanggal_kembali" min="<?=date('Y-m-d')?>" required></div><div class="col-12"><label class="form-label">Keperluan</label><textarea class="form-control" name="keperluan" rows="2"></textarea></div><div class="col-12"><button class="btn btn-primary">Simpan Peminjaman</button></div></form></div>
<?php elseif($view==='riwayat'): ?>
<h3>Riwayat Peminjaman & Pengembalian</h3><div class="table-responsive"><table class="table table-bordered bg-white"><thead><tr><th>Tanggal</th><th>Peminjam</th><th>Kelas</th><th>Barang</th><th>Jumlah</th><th>Rencana Kembali</th><th>Status</th><th>Aksi</th></tr></thead><tbody><?php foreach($loans as $r): $late=($r['status']==='Dipinjam' && $r['tanggal_rencana']<date('Y-m-d')); ?><tr><td><?=h($r['tanggal_pinjam'])?></td><td><?=h($r['nama_peminjam'])?></td><td><?=h($r['kelas'])?></td><td><?=h($r['nama_barang'])?></td><td><?=$r['jumlah']?></td><td><?=h($r['tanggal_rencana'])?></td><td><span class="badge <?=$r['status']==='Dikembalikan'?'bg-success':($late?'bg-danger':'bg-warning text-dark')?>"><?= $late?'Terlambat':h($r['status']) ?></span></td><td><?php if($r['status']==='Dipinjam'): ?><form method="post"><input type="hidden" name="action" value="return"><input type="hidden" name="id" value="<?=$r['id']?>"><button class="btn btn-sm btn-success">Proses Kembali</button></form><?php else: ?>-<?php endif; ?></td></tr><?php endforeach; ?></tbody></table></div>
<?php else: ?><div class="alert alert-warning">Halaman tidak ditemukan.</div><?php endif; ?>
</main></div></div></body></html>
