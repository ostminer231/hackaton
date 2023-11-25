import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class OTP_Verification_page extends StatelessWidget {
  const OTP_Verification_page({super.key});
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
              'Введите одноразовый код',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Text(
              'Введите 6-значные номера, отправленные на ваш электронный адрес',
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
            Text.rich(
              TextSpan(
                text: 'Если вы не получили код,',
                style: TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(0.5)),
                children: [
                  TextSpan(
                    text: 'Отправить повторно',
                    style: TextStyle(
                      color: Color(0xFF0560FA),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
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
          ],
        ),
      ),
    );
  }
}