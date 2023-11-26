import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscurePassword = true;
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();
  final _emailAddress = TextEditingController();
  final _userPassword = TextEditingController();

  @override
  void dispose() {
    _emailAddress.dispose();
    _userPassword.dispose();
    super.dispose();
  }

  void _submitForm() {
    Navigator.pushNamed(context, '/pin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            const SizedBox(height: 150),
            Text(
              'С возвращением',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Введите свой адрес электронной почты и пароль, чтобы продолжить',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                hintText: 'example@test.com',
                labelText: 'Email адрес',
              ),
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _userPassword,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                hintText: '*******',
                labelText: 'Пароль',
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              maxLength: 8,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Запомнить пароль',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(342, 46),
                backgroundColor: primaryColor, // Replace with your primary color
              ),
              child: Text(
                'Войти',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'У вас нет аккаунта? ',
                  style: GoogleFonts.roboto(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/session_2/register');
                  },
                  child: Text(
                    'Зарегистрироваться',
                    style: GoogleFonts.roboto(
                      color: primaryColor, // Replace with your primary color
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

