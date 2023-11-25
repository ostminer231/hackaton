import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;
  late bool _isValidEmail;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _isValidEmail = false;
  }

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
              controller: _emailController,
              onChanged: (value) {
                setState(() {
                  _isValidEmail = isValidEmail(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Электронная почта',
                hintText: 'example@example.com',
                errorText: _isValidEmail ? null : 'Введите валидный email',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isValidEmail
                  ? () {
                Navigator.pushNamed(context, '/otp_verification');
              }
                  : null,
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
                    text: 'входу',
                    style: TextStyle(
                      color: Color(0xFF0560FA),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/login_page');
                      },
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

  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}
