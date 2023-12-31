import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.gradientApp),
      child: Drawer(
        // width: 250,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenueItems(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Container(
      decoration: const BoxDecoration(color: Colors.tealAccent),
      padding: const EdgeInsets.only(top: 60, bottom: 24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            child: Icon(
              Icons.person,
              size: 70,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Ahmad',
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'ahmad@gmail.com',
            style: TextStyle(fontSize: 16),
          )
        ],
      ));
}

Widget buildMenueItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      runSpacing: 10,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const Text('Favorites'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('History'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.medication),
          title: const Text('About'),
          onTap: () {},
        ),
      ],
    ),
  );
}
