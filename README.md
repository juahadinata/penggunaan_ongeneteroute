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