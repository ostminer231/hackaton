import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  final _emailAddress = TextEditingController();
  final _userPassword = TextEditingController();

  @override
  void dispose() {
    _emailAddress.dispose();
    _userPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите ваш адрес электронной почты';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _userPassword,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите пароль';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Здесь вы можете добавить логику для проверки учетных данных
                      // и выполнение входа
                      // например, вызов аутентификационного API
                      // если успешно, перейдите на другой экран
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Text('Войти'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
