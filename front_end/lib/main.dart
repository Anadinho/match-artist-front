import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_page.dart';
import 'package:front_end/pages/login/login_page.dart';

void main() {
  runApp(AppWidget(title: 'Teste'));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, chuild) {
        return MaterialApp(
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/homeArtista': (context) => HomePage()
          },
        );
      },
      animation: AppController(),
    );
  }
}

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDartTheme = false;

  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
