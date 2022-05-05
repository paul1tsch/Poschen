import 'package:go_router/go_router.dart';
import 'package:poschen/main.dart';

class MyRouter {
  // 1
  final StartScreen startScreen;
  MyRouter(this.startScreen);

  // 2
  late final router = GoRouter(
    // 3
    // refreshListenable: startScreen,
    // 4
    debugLogDiagnostics: true,
    // 5
    urlPathStrategy: UrlPathStrategy.path,

    // 6
    routes: [
      // TODO: Add Routes
    ],
    // TODO: Add Error Handler
    // TODO Add Redirect
  );

}
