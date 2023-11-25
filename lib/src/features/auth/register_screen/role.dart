import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: const ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Профиль'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        children: <Widget>[
          UserHeader(),
          MenuItem(
            icon: Icons.edit,
            text: 'Редактировать профиль',
            onTap: () { /* Handle tap */ },
          ),
          MenuItem(
            icon: Icons.folder,
            text: 'Документы',
            onTap: () { /* Handle tap */ },
          ),
          LogoutItem(),
        ],
      ),
    );
  }
}


class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('url_to_profile_image'),
      ),
      title: Text('Ken Nwaeze'),
      subtitle: Text('Статус: в поиске'),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}

class LogoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app, color: Colors.red),
      title: Text('Выйти', style: TextStyle(color: Colors.red)),
      onTap: () { /* Handle logout */ },
    );
  }
}