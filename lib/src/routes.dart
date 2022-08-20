import 'package:page_transition/page_transition.dart';
import 'package:tasktick/src/pages/dashboard/dashboard_page.dart';
import 'package:tasktick/src/pages/pages.dart';

class Routes {
  static const String splash = '/';
  static const String dash_login = '/dash_login';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String hari_ini = '/hari_ini';
  static const String task = '/task';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case splash:
        return PageTransition(
          child: SplashPage(),
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 300),
        );
      case dash_login:
        return PageTransition(
          child: DashLoginPage(),
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 300),
        );
      case login:
        return PageTransition(
          child: LoginPage(),
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
        );
      case dashboard:
        return PageTransition(
          child: DashboardPage(),
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
        );
      case task:
        return PageTransition(
          child: TaskPage(),
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text('Not Found'),
                  Text('No route defined for ${settings.name}'),
                ],
              ),
            ),
          ),
        );
    }
  }
}
