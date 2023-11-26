import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackaton/src/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(const Profile());

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarApp();
  }
}

class Page_1 extends StatelessWidget {
  const Page_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserHeader(),
        UserTitles(),
      ],
    );
  }
}

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/icons/user.png'),
            radius: 35,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carlo Marcs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Статус: в поиске',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationForm extends StatefulWidget {
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  _saveDocs() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Документ успешно сохранен'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Дoкументы',
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView( // Добавляем SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_imageFile != null)
                Image.file(_imageFile!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Прикрепить документ об образовании'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(342, 46),
                  backgroundColor: primaryColor,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'О себе',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Сохранить'),
                onPressed: _saveDocs,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(342, 46),
                  backgroundColor: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTitles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          _buildUserTile(
            context,
            icon: Icons.account_circle,
            title: 'Редактировать профиль',
            subtitle: 'Имя, номер телефона, почта...',
            onTap: () => print('Карточка Редактировать профиль нажата'),
          ),
          _buildUserTile(
            context,
            icon: Icons.add_chart_outlined,
            title: 'Документы',
            subtitle: 'Документы об образовании',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducationForm()),
              );
            },
          ),
          _buildUserTile(
            context,
            icon: Icons.output,
            title: 'Выход',
            subtitle: '',
            onTap: () => print('Карточка Выход нажата'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 42, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 14)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff0560FA),
        ),
        onTap: onTap,
      ),
    );
  }
}

class mainInfo_1 extends StatelessWidget {
  const mainInfo_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Вакансии',
          style: TextStyle(
            color: Colors.blue, // Используйте ваш primaryColor
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue), // Используйте ваш primaryColor
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const cUserHeader(), // Предполагается, что CUserHeader определен в другом месте
            const SizedBox(height: 30),
            const Text(
              'Мы нуждаемся в:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Монтажник лифтов',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Минимальный стаж',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '3 года',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Номер телефона:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+79227648353',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cUserHeader extends StatelessWidget {
  const cUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/HomePage/arpicon.png'),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Arpicon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Статус: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'в поиске',
                    style: TextStyle(
                      fontSize: 16,
                      color: successColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class mainInfo_2 extends StatelessWidget {
  const mainInfo_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Вакансии',
          style: TextStyle(
            color: Colors.blue, // Используйте ваш primaryColor
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue), // Используйте ваш primaryColor
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const cUserHeader_2(), // Предполагается, что CUserHeader определен в другом месте
            const SizedBox(height: 30),
            const Text(
              'Мы нуждаемся в:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Монтажник лифтов',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Минимальный стаж',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1 год',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Номер телефона:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+79226301225',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cUserHeader_2 extends StatelessWidget {
  const cUserHeader_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/HomePage/shipyard.png'),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ЩЛЗ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Статус: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'в поиске',
                    style: TextStyle(
                      fontSize: 16,
                      color: successColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class mainInfo_3 extends StatelessWidget {
  const mainInfo_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Вакансии',
          style: TextStyle(
            color: Colors.blue, // Используйте ваш primaryColor
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue), // Используйте ваш primaryColor
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const cUserHeader_3(), // Предполагается, что CUserHeader определен в другом месте
            const SizedBox(height: 30),
            const Text(
              'Мы нуждаемся в:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Инженер-конструктор',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Минимальный стаж',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2 года',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Номер телефона:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+79223302530',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cUserHeader_3 extends StatelessWidget {
  const cUserHeader_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/HomePage/avialift.png'),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Avaliaft',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Статус: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'в поиске',
                    style: TextStyle(
                      fontSize: 16,
                      color: successColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class mainInfo_4 extends StatelessWidget {
  const mainInfo_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Вакансии',
          style: TextStyle(
            color: Colors.blue, // Используйте ваш primaryColor
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue), // Используйте ваш primaryColor
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const cUserHeader_4(), // Предполагается, что CUserHeader определен в другом месте
            const SizedBox(height: 30),
            const Text(
              'Мы нуждаемся в:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Техник по обслуживанию',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Минимальный стаж',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '4 года',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Номер телефона:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+79225437575',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cUserHeader_4 extends StatelessWidget {
  const cUserHeader_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/HomePage/eonessi.png'),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eonessi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Статус: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'в поиске',
                    style: TextStyle(
                      fontSize: 16,
                      color: successColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class Page_2 extends StatelessWidget {
  const Page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        CompanyTile(
          icon: 'assets/images/HomePage/arpicon.png',
          title: 'Arpicon',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainInfo_1()),
            );
          },
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/shipyard.png',
          title: 'ЩЕРБИНСКИЙ ЛИФТОСТРОИТЕЛЬНЫЙ ЗАВОД',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainInfo_2()),
            );
          },
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/avialift.png',
          title: 'Avialift',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainInfo_3()),
            );
          },
        ),
        const Divider(),
        CompanyTile(
          icon: 'assets/images/HomePage/eonessi.png',
          title: 'Eonessi',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainInfo_4()),
            );
          },
        ),
      ],
    );
  }
}

class CompanyTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const CompanyTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff0560FA),
            ),
          ],
        ),
      ),
    );
  }
}

class Page_3 extends StatelessWidget {
  const Page_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        children: [
          ServiceCard(
            title: 'Менеджер по продукции',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Техник по обслуживанию',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Программист оборудования',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Инженер-конструктор',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Менеджер по продукции',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap; // Добавьте новый параметр

  const ServiceCard({
    super.key,
    required this.title,
    this.onTap, //
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff0560FA),
        ),
        onTap: () => Navigator.pushNamed(context, '/availableVacation'),
      ),
    );
  }
}

class AvailableVacation extends StatefulWidget {
  const AvailableVacation({Key? key}) : super(key: key);

  @override
  _AvailableVacationState createState() => _AvailableVacationState();
}

class _AvailableVacationState extends State<AvailableVacation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        children: [
          ServiceCard(
            title: 'Гриценко Владислав',
            onTap: () => Navigator.pushNamed(context, '/availableVacation'), // Add onTap callback
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Шамсутдинов Марсель',
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Дададжанов Нурмухаммад',
          ),
          const SizedBox(height: 10),
          ServiceCard(
            title: 'Гриценко Владислав',
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Вакансии';
      case 1:
        return 'Услуги';
      case 2:
        return 'Профиль';
      default:
        return 'Страница';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // Экран Главное
      const Page_2(), // Экран Вакансий
      const Page_3(), // Услуги
      const Page_1(), // Экран Профиль
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitle(currentPageIndex),
          // Здесь вызываем функцию для установки заголовка
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Вакансии',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Услуги',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle_outlined),
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Профиль',
          ),
        ],
      ),
      body: _pages[currentPageIndex], // Отображение выбранной страницы
    );
  }
}
