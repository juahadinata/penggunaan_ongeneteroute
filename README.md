### ongenerate_route_sampel

#### routes
Digunakan ketika aplikasi memiliki halaman-halaman sederhana dan statis — artinya setiap route sudah pasti ada, tidak butuh logika tambahan, dan tidak perlu memvalidasi data yang dikirim. Cocok untuk proyek kecil atau prototyping cepat karena penulisannya ringkas dan langsung.

Contoh situasinya: aplikasi yang hanya punya halaman Home, About, dan Contact tanpa perlu kirim data apapun antar halaman.

#### onGenerateRoute
Digunakan ketika routing membutuhkan kendali penuh dan logika dinamis. Ini adalah pilihan yang tepat ketika:

- Perlu validasi argumen — kamu bisa cek apakah data yang dikirim ke suatu halaman sesuai tipe yang diharapkan, lalu tampilkan halaman error jika tidak valid.
- Argumen berupa object kompleks — seperti mengirim `User`, `Product`, atau model lainnya ke halaman tujuan.
- Animasi transisi berbeda-beda — tiap route bisa punya transisi sendiri, misalnya fade untuk Settings, slide untuk Detail.
- Penanganan route tidak dikenal (404) — jika route tidak ditemukan, kamu bisa arahkan ke halaman NotFound secara terpusat.
- Routing terpusat — semua logika navigasi dikumpulkan di satu kelas `AppRouter`, sehingga lebih mudah dikelola di proyek besar.


##### Intinya

>Gunakan `routes` kalau routingmu simpel dan tidak ada kondisi khusus. Gunakan `onGenerateRoute` kalau butuh kontrol, validasi, atau fleksibilitas lebih — terutama di aplikasi skala menengah ke atas.

Keduanya bisa juga dikombinasikan — `routes` untuk halaman-halaman umum, `onGenerateRoute` sebagai fallback untuk menangani kasus yang lebih dinamis.


#### Berikut contoh sederhana penggunaan named routes di Flutter:

```dart
dartimport 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

// ── Home Screen ──
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Text('Ke Detail'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Ke Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Detail Screen ──
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // kembali ke Home
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}

// ── Profile Screen ──
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/'); // ganti ke Home
          },
          child: Text('Ke Home (Replace)'),
        ),
      ),
    );
  }
}
```

##### Poin penting yang dipakai:

- `initialRoute: '/'` — route pertama yang tampil saat app dibuka
- `routes: { ... }` — daftar semua named routes yang didaftarkan
- `Navigator.pushNamed(context, '/nama')` — berpindah ke route tertentu
- `Navigator.pop(context)` — kembali ke halaman sebelumnya
- `Navigator.pushReplacementNamed(context, '/nama')` — pindah dan hapus halaman saat ini dari stack