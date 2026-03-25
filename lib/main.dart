import 'package:flutter/material.dart';
import 'package:ongenerate_route_sampel/app_router.dart';
import 'package:ongenerate_route_sampel/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'onGenerateRoute Demo',
      initialRoute: AppRoutes.home,
      
      onGenerateRoute: AppRouter.generateRoute, 
    );
  }
}
