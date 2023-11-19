import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/routes.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://jqjvfvokxwmknnknsrpi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxanZmdm9reHdta25ua25zcnBpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzNzc5NDMsImV4cCI6MjAxNTk1Mzk0M30.gIDdgs-T47ImQ-3Jnsqa_AHe190rJh__FG3R4qzPOCw',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);
    return MaterialApp.router(
      title: 'Memories App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: routes,
    );
  }
}
