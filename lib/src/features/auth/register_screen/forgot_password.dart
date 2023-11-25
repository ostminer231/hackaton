import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Забыли пароль',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Text(
              'Введите свой адрес электронной почты',
              style: TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(0.5)),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Электронная почта',
                hintText: 'example@example.com',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь логику для отправки одноразового пароля
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0560FA),
              ),
              child: Text('Отправить одноразовый пароль'),
            ),
            SizedBox(height: 20.0),
            Text.rich(
              TextSpan(
                text: 'Помните пароль? Вернуться к ',
                style: TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(0.5)),
                children: [
                  TextSpan(
                    text: 'Входу',
                    style: TextStyle(color: Color(0xFF0560FA))
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
