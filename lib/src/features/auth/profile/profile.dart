import 'package:flutter/material.dart';
import 'packakecustom_navigation_bar.dart'; // Import the custom_navigation_bar.dart file

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
      body: Column(
        children: <Widget>[
          UserHeader(),
          MenuItem(
            icon: Icons.edit,
            text: 'Редактировать профиль',
            onTap: () {
              // Handle tap
            },
          ),
          MenuItem(
            icon: Icons.folder,
            text: 'Документы',
            onTap: () {
              // Handle tap
            },
          ),
          LogoutItem(),
          Expanded(
            child: IndexedStack(
              index: currentPageIndex,
              children: <Widget>[
                Card(
                  shadowColor: Colors.transparent,
                  margin: const EdgeInsets.all(8.0),
                  child: SizedBox.expand(
                    child: Center(
                      child: Text(
                        'Home page',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                // Add your pages here similar to the original NavigationExample
                // Notifications page
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Text('Notification 1'),
                          subtitle: Text('This is a notification'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Text('Notification 2'),
                          subtitle: Text('This is a notification'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Messages page
                ListView.builder(
                  reverse: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    // Your messages page implementation
                  },
                ),
              ],
            ),
          ),
          NavigationBar(
            onDestinationSelected: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.notifications_sharp)),
                label: 'Notifications',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(Icons.messenger_sharp),
                ),
                label: 'Messages',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
