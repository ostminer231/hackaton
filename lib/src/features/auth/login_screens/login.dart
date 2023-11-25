import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createStae() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool obscurePassword = true;
  bool isChecked = false; // Add this line

  final _formKey = GlobalKey<FormState>();
  final _emailAddress = TextEditingController();
  final _userPassword = TextEditingController();
  final _fullName = TextEditingController();

  @override
  void dispose() {
    _emailAddress.dispose();
    _userPassword.dispose();
    _fullName.dispose();

    super.dispose();
  }

  void _submitForm() {
    // Add your form submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'С возвращением',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: ListView(
                    padding: const EdgeInsets.all(25),
                    children: [
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
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                      Column(
                        children: [
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
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      'Запомнить пароль',
                                      style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    // Add other form fields here
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(342, 46),
                                backgroundColor: primaryColor // Replace with your primary color
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
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'У вас нет аккаунта? ',
                                style: GoogleFonts.roboto(color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login_page');
                                },
                                child: Text(
                                  'Зарегистрироваться',
                                  style: GoogleFonts.roboto(
                                    color: primaryColor,
                                    // Replace with your primary color
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
