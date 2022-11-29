# Pusat Pengaduan

## Nama Anggota Kelompok

<table>
<tr>
<td> Abdul Rafi </td> 
<td> 2106630113 </td> 
</tr>
<tr>
<td> Kenneth Ferdinand </td> 
<td> 2106750282 </td> 
</tr>
<tr>
<td> Nur Fajar S. A. </td> 
<td> 2106751114 </td> 
</tr>
<tr>
<td> Ruben Tanoey </td> 
<td> 2106752445 </td> 
</tr>
<tr>
<td> Raspati Mahatma K.D </td> 
<td> 2106750244 </td> 
</tr>
</table>

## Deskripsi Aplikasi (nama aplikasi, fungsi aplikasi, dan peran/aktor pengguna aplikasi)

Aplikasi ini bernama Pusat Pengaduan. Aplikasi ini berfungsi untuk menangani laporan mengenai kasus korupsi yang terjadi di sekitar kita. Kami berharap dengan adanya aplikasi ini, tindakan korupsi mampu secara signifikan mengalami penurunan dan dapat dengan cepat ditindaklanjuti. Pada aplikasi ini, akan terdapat 2 role, yaitu : 
1. **User**
User merupakan pengguna Pusat Pengaduan, user memiliki kewenangan untuk melihat berita yang ada di main page dan melayangkan aduan di submission form.
2. **Admin**
Admin merupakan anggota KPK yang di-assign untuk menangani kasus yang    dilayangkan user, sehingga dia bisa melihat dan memberi status untuk aduan yang ditujukan.

## Daftar fitur
[**ABDUL: LOGIN**] Terdapat feature untuk mengautentikasi pengguna app, akan ditentukan apakah role yang dimiliki pengguna app adalah Admin ataupun User. Serta mengubah data dari user tersebut.


[**KENNETH: MAIN PAGE**] Terdapat main page yang berisikan berita-berita terkini mengenai korupsi agar user bisa membaca dan terus update mengenai berita tersebut. Terdapat fitur untuk me-review aplikasi tersebut. 


[**FAJAR: FORM**] Submission form berfungsi untuk melayangkan laporan user mengenai tindakan korupsi kepada admin.


[**TOMMY: DASHBOARD USER**] Setelah mengautentikasi login, jika role adalah user, maka akan segera diarahkan ke dashboard user dimana nanti akan disajikan keluhan yang telah dilayangkan dan status dari keluhan yang sudah dilayangkan tersebut (apakah keluhan sudah ditangani, sedang ditangani ataupun belum ditangani). Selain itu, terdapat button yang akan mengarahkan user menuju submission form.


[**RUBEN: DASHBOARD ADMIN**] Terdapat dashboard admin dimana nanti akan ada daftar keluhan yang di assign kepada admin tertentu untuk ditangani oleh admin tersebut. Admin dapat mengubah status dari setiap laporan yang diterima. Status terbagi menjadi 4: Pending, Diproses, Selesai, dan Ditolak.

## Alur pengintegrasian dengan web service


1. Alur untuk menampilkan data
Menambahkan dependency http ke proyek → Model data → get http (web service) → decode ke json → ubah ke model → Tampilkan / gunakan data tersebut

2. Alur untuk menambahkan data
Menambahkan dependency http ke proyek → Model data → terima input dari user → konfigurasi input agar sesuai dengan model data yang dibuat → encode ke json → post http(web service) 
