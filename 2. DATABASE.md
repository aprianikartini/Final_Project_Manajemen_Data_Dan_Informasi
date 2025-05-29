# 🗃️ Dokumentasi Struktur Database

Dokumentasi ini menjelaskan struktur database sistem transaksi penjualan sederhana yang terdiri dari 5 entitas utama: 
`TRANSAKSI`, `DETAIL_TRANSAKSI`, `KARYAWAN`, `PRODUK`, dan `KATEGORI_PRODUK`.

---

## 📚 Daftar Tabel

1. [Tabel TRANSAKSI](#1-tabel-transaksi)
2. [Tabel DETAIL_TRANSAKSI](#2-tabel-detail_transaksi)
3. [Tabel KARYAWAN](#3-tabel-karyawan)
4. [Tabel PRODUK](#4-tabel-produk)
5. [Tabel KATEGORI_PRODUK](#5-tabel-kategori_produk)

---

## 1. Tabel `TRANSAKSI`

| Kolom         | Tipe Data        | Kunci     | Keterangan                  |
|---------------|------------------|-----------|-----------------------------|
| id_transaksi  | VARCHAR2(64)     | PK        | ID unik transaksi           |
| tgl_transaksi | DATE             |           | Tanggal transaksi           |
| total_harga   | INTEGER          |           | Total harga seluruh produk  |
| id_karyawan   | VARCHAR2(64 BYTE)| FK        | Mengacu ke `karyawan.id_karyawan` |

---

## 2. Tabel `DETAIL_TRANSAKSI`

| Kolom           | Tipe Data        | Kunci     | Keterangan                        |
|------------------|------------------|-----------|-----------------------------------|
| id_detail_transaksi | VARCHAR2(64)  | PK        | ID detail transaksi               |
| jmlh_produk      | SMALLINT         |           | Jumlah produk dibeli             |
| jmlh_harga       | INTEGER          |           | Total harga produk tersebut      |
| id_transaksi     | VARCHAR2(64)     | FK        | Relasi ke `transaksi.id_transaksi` |
| id_produk        | VARCHAR2(64)     | FK        | Relasi ke `produk.id_produk`       |

---

## 3. Tabel `KARYAWAN`

| Kolom         | Tipe Data        | Kunci     | Keterangan             |
|---------------|------------------|-----------|------------------------|
| id_karyawan   | VARCHAR2(64 BYTE)| PK        | ID unik karyawan       |
| nama_karyawan | VARCHAR2(100)    |           | Nama lengkap karyawan  |

---

## 4. Tabel `PRODUK`

| Kolom              | Tipe Data     | Kunci     | Keterangan                       |
|--------------------|---------------|-----------|----------------------------------|
| id_produk          | VARCHAR2(64)  | PK        | ID unik produk                   |
| nama_produk        | VARCHAR2(64)  |           | Nama produk                      |
| harga_satuan       | INTEGER       |           | Harga per satuan produk          |
| stok_produk        | SMALLINT      |           | Jumlah stok tersedia             |
| id_kategori_produk | VARCHAR2(64)  | FK        | Relasi ke `kategori_produk.id_kategori_produk` |

---

## 5. Tabel `KATEGORI_PRODUK`

| Kolom              | Tipe Data     | Kunci     | Keterangan                       |
|--------------------|---------------|-----------|----------------------------------|
| id_kategori_produk | VARCHAR2(64)  | PK        | ID kategori produk               |
| nama_kategori_produk | VARCHAR2(64)|           | Nama kategori (misal: Makanan)   |

---

## 🔗 Relasi Antar Tabel

- `transaksi.id_karyawan` ➝ `karyawan.id_karyawan`
- `detail_transaksi.id_transaksi` ➝ `transaksi.id_transaksi`
- `detail_transaksi.id_produk` ➝ `produk.id_produk`
- `produk.id_kategori_produk` ➝ `kategori_produk.id_kategori_produk`

