import 'package:flutter/material.dart';

class TestButtons extends StatelessWidget {
  const TestButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/session_2/register');
              },
              child: Text('Регистрация'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login_page');
              },
              child: Text('Логин'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Профиль'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/services');
              },
              child: Text('Сервисы'),
            ),
            // Продолжайте добавлять кнопки по аналогии
          ],
        ),
      ),
    );
  }

}
