# Pusat Pengaduan

[![Flutter CI](https://github.com/PBP-G20Project/flutter-pusat-pengaduan/actions/workflows/flutter-workflow.yml/badge.svg)](https://github.com/PBP-G20Project/flutter-pusat-pengaduan/actions/workflows/flutter-workflow.yml)

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


## [APK PUSAT PENGADUAN](https://install.appcenter.ms/users/takemeac/apps/pusat-pengaduan/distribution_groups/tester)

## Cerita di balik Pusat Pengaduan


[G20 Topic: Anti-corruption](https://www.oecd.org/g20/topics/anti-corruption/)
Kami membuat aplikasi ini karena korupsi sudah sangat merajalela di Indonesia. Kasus yang mengakar ini sulit sekali untuk dihindarkan. Dampak terbesar akibat korupsi adalah kemiskinan absolut. Oleh karena itu, kami menyediakan layanan ini untuk menampung laporan bagi masyarakat yang menemui dugaan kasus korupsi. Kami berharap dengan adanya aplikasi ini, tindakan korupsi mampu secara signifikan mengalami penurunan dan dapat dengan cepat ditindaklanjuti.

Kami menyediakan platform yang memungkinkan user untuk memberikan laporan tentang kasus korupsi. Laporan ini kemudian akan diproses secara langsung oleh admin. Admin akan mengupdate secara berkala status dari laporan tersebut.

## Role
1. **Guest**
    * Melihat main page
    * Membuat akun
3. **User**
    * User dapat memberikan laporan 
    * Memberikan review
    * Melihat list laporan
    * Mengganti identitas pengguna
4. **Admin**
    * Melihat laporan yang diassign kepada Admin
    * Melihat feedback laporan dari admin lain
    * Mengubah status laporan dari user

## Daftar fitur
[**ABDUL: LOGIN**] Terdapat feature untuk mengautentikasi pengguna app, akan ditentukan apakah role yang dimiliki pengguna app adalah Admin ataupun User. Serta mengubah data dari user tersebut.


[**KENNETH: MAIN PAGE**] Terdapat main page yang berisikan berita-berita terkini mengenai korupsi agar user bisa membaca dan terus update mengenai berita tersebut. Terdapat fitur untuk me-review aplikasi tersebut. 


[**FAJAR: FORM**] Submission form berfungsi untuk melayangkan laporan user mengenai tindakan korupsi kepada admin.


[**TOMMY: DASHBOARD USER**] Setelah mengautentikasi login, jika role adalah user, maka akan segera diarahkan ke dashboard user dimana nanti akan disajikan keluhan yang telah dilayangkan dan status dari keluhan yang sudah dilayangkan tersebut (apakah keluhan sudah ditangani, sedang ditangani ataupun belum ditangani). Selain itu, terdapat button yang akan mengarahkan user menuju submission form.


[**RUBEN: DASHBOARD ADMIN**] Terdapat dashboard admin dimana nanti akan ada daftar keluhan yang di assign kepada admin tertentu untuk ditangani oleh admin tersebut. Admin dapat mengubah status dari setiap laporan yang diterima. Status terbagi menjadi 4: Pending, Diproses, Selesai, dan Ditolak.

## Alur pengintegrasian dengan web service
1. Menambahkan sistem autentikasi untuk memudahkan post dan get pada app django
2. Membuat model untuk menerima data dari app django
3. Menggunakan http get untuk mendapatkan dari app django yang datanya akan digunakan pada app flutter
4. Menggunakan http post untuk mengirim data ke app django sehingga data dapat disimpan pada app django

