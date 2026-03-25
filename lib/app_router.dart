// ── Router Terpusat ──
import 'package:flutter/material.dart';
import 'package:ongenerate_route_sampel/app_routes.dart';
import 'package:ongenerate_route_sampel/detail_screen.dart';
import 'package:ongenerate_route_sampel/home_screen.dart';
import 'package:ongenerate_route_sampel/profile_screen.dart';
import 'package:ongenerate_route_sampel/settings_screen.dart';
import 'package:ongenerate_route_sampel/user.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Setiap case menangani satu route berdasarkan nama yang didefinisikan di AppRoutes
      /// Setiap case juga melakukan validasi argumen jika diperlukan, memastikan bahwa data yang dikirim ke screen sesuai dengan yang diharapkan
      /// Jika route tidak dikenali, default case akan menampilkan NotFoundScreen, memberikan pengalaman pengguna yang lebih baik daripada error yang tidak terduga
      /// Dengan cara ini, semua logika routing terpusat di satu tempat, membuatnya lebih mudah untuk dikelola dan dikembangkan seiring waktu
      case AppRoutes.home: //* Route untuk HomeScreen, tidak memerlukan argumen
        return _buildRoute(settings, HomeScreen()); //

      case AppRoutes.detail:
        // Route untuk DetailScreen, memerlukan argumen berupa String (judul)
        // Validasi argumen
        final args = settings.arguments; // harusnya String
        if (args is String) {
          // validasi tipe data
          return _buildRoute(
            settings,
            DetailScreen(title: args),
          ); // Kirim data ke DetailScreen
        }
        return _buildRoute(
          // Jika argumen tidak valid, tampilkan error screen
          settings, // tetap kirim settings agar bisa diakses di ErrorScreen
          ErrorScreen(
            message: 'Argumen tidak valid untuk /detail',
          ), // pesan error yang jelas
        );

      case AppRoutes.profile:
        //* Argumen berupa object User
        final args = settings.arguments;
        if (args is User) {
          return _buildRoute(settings, ProfileScreen(user: args));
        }
        return _buildRoute(
          settings,
          ErrorScreen(message: 'Argumen tidak valid untuk /profile'),
        );

      case AppRoutes.settings:
        // Route dengan custom transition
        return _buildRouteWithTransition(settings, SettingsScreen());

      default:
        return _buildRoute(settings, NotFoundScreen());
    }
  }

  // Transisi default (MaterialPageRoute)
  //
  /// Helper method untuk membuat route dengan MaterialPageRoute
  /// Menerima RouteSettings dan Widget tujuan, mengembalikan MaterialPageRoute
  /// Memastikan semua route menggunakan format yang konsisten dan mudah di-maintain
  /// Dengan cara ini, jika kita ingin mengganti jenis transisi untuk semua route, cukup ubah di satu tempat (misal ganti ke PageRouteBuilder)
  /// Juga memastikan bahwa RouteSettings tetap diteruskan, sehingga informasi seperti nama route dan argumen tetap tersedia di semua screen
  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget page) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => page,
    ); //  gunakan MaterialPageRoute untuk transisi default (slide dari kanan) dengan pengaturan yang konsisten
  }

  // Transisi kustom (fade)
  /// Helper method untuk membuat route dengan transisi fade
  /// Menerima RouteSettings dan Widget tujuan, mengembalikan PageRouteBuilder dengan transisi fade
  /// Digunakan khusus untuk route settings agar memberikan efek masuk yang lebih halus
  static PageRouteBuilder _buildRouteWithTransition(
    RouteSettings settings,
    Widget page,
  ) {
    return PageRouteBuilder(
      // menggunakan PageRouteBuilder untuk transisi kustom
      settings:
          settings, // tetap kirim settings agar bisa diakses di SettingsScreen jika diperlukan
      pageBuilder: (_, __, ___) => page, // halaman tujuan
      transitionsBuilder: (_, animation, __, child) {
        // definisikan transisi
        return FadeTransition(
          opacity: animation,
          child: child,
        ); // gunakan FadeTransition untuk transisi fade
      },
      transitionDuration: Duration(milliseconds: 400), // durasi transisi
    );
  }
}
