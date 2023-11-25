import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  bool isChecked = false;
  bool obscurePassword = true;

  final _formKey = GlobalKey<FormState>();


  final _fullName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _emailAddress = TextEditingController();
  final _userPassword = TextEditingController();


  @override
  void dispose() {
    _fullName.dispose();
    _phoneNumber.dispose();
    _emailAddress.dispose();
    _userPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 36, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Создание аккаунта',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Заполните поля для дальнейшей работы',
                    style: GoogleFonts.roboto(
                        color: grayColorDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 138),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  TextFormField(
                    controller: _fullName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        hintText: 'Введите ваше полное имя?',
                        labelText: 'Ваше имя'
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50)
                    ],
                    validator: fullNameValidate,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _phoneNumber,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        hintText: '7 (955) 281 35 56',
                        labelText: 'Номер телефона',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        hintText: 'example@test.com',
                        labelText: 'Email адресс'
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
                          borderRadius: BorderRadius.all(Radius.circular(4))
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
                        )
                    ),
                    maxLength: 8,
                  ),
                  const SizedBox(
                    height: 20,
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
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  'Поставив галочку в этом поле, вы соглашаетесь с нашими',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: grayColorDark,
                                  ),
                                ),
                                Text(
                                  'условиями и политикой конфиденциальности',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: warningColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(342, 46),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
                        'У вас уже есть аккаунт? ',
                        style: GoogleFonts.roboto(color: grayColorDark),
                      ),
                      Text(
                        'Войти',
                        style: GoogleFonts.roboto(
                            color: primaryColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'or sign in using',
                        style: GoogleFonts.roboto(
                          color: grayColorDark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/icons/google.png',
                        height: 16,
                        width: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Name: ${_fullName.text}');

      Navigator.pushNamed(context, '/profile');
    }
  }

  String? fullNameValidate(value) {
    final _fullNameExp = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)?$');
    if (value.isEmpty) {
      return 'Name is required';
    } else if(!_fullNameExp.hasMatch(value)) {
      return 'Please enter full name';
    } else {
      return null;
    }
  }
}
