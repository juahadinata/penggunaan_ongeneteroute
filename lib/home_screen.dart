// ── Home Screen ──
import 'package:flutter/material.dart';
import 'package:ongenerate_route_sampel/app_routes.dart';
import 'package:ongenerate_route_sampel/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kirim String
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: 'Flutter onGenerateRoute',
              ),
              child: Text('Ke Detail (kirim String)'),
            ),
            SizedBox(height: 12),

            // Kirim Object
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.profile,
                arguments: User(name: 'Budi', age: 25),
              ),
              child: Text('Ke Profile (kirim Object User)'),
            ),
            SizedBox(height: 12),

            // Ke Settings dengan fade transition
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
              child: Text('Ke Settings (fade transition)'),
            ),
            SizedBox(height: 12),

            // Route yang tidak terdaftar → NotFound
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/halaman-random'),
              child: Text('Ke Route Tidak Dikenal'),
            ),
            SizedBox(height: 12),

            // Kirim argumen yang salah → ErrorScreen
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: 123, // salah! harusnya String
              ),
              child: Text('Ke Detail (argumen salah)'),
            ),
          ],
        ),
      ),
    );
  }
}
