import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constant/app_string.dart';
import 'core/router/app_router.dart';
import 'core/theme/theme.dart';

class FinWiseApp extends ConsumerWidget {
  const FinWiseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
