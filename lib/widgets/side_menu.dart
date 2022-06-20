import 'package:flutter/material.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerTop(),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Peoples"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              // Navigator.pushNamed(context, 'Settings');
              Navigator.pushReplacementNamed(context, 'Settings');
            },
          )
        ],
      ),
    );
  }
}

class DrawerTop extends StatelessWidget {
  const DrawerTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/menu-img.jpg'),
                  fit: BoxFit.cover)),
        ));
  }
}
