import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/section_items_controller.dart';
import 'package:medicalista/controller/home_page_controller.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/view/components/home_page_widgets/custom_section_listtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    SectionItemsControllerImp seccontorller =
        Get.put(SectionItemsControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('5.0'.tr,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          )
        ],
      ),
      //_______________________________drawer____________________________________
      drawer: Drawer(
        // width: 250,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(color: Colors.tealAccent),
                padding: const EdgeInsets.only(top: 60, bottom: 24),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 52,
                      child: Icon(
                        Icons.person,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.myService.sharedPreferences
                          .getString('firstname')!,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.myService.sharedPreferences
                          .getString('email')!,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.view_list),
                      title: const Text('Orders'),
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
                      onTap: () {
                        Get.toNamed(AppRoutes.language);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        controller.myService.sharedPreferences.clear();
                        Get.offAllNamed(AppRoutes.login);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.medication),
                      title: const Text('About'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ////////////////////////body//////////////////////////////////////////
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Lottie.asset(AppImageAssets.factoryOne, height: 300),
            CustomSectionListTile(
                title: '5.1'.tr,
                subtitle: '5.2'.tr, //Analgesics
                onTap: () {
                  seccontorller.secName = 'Analgesics';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.3'.tr,
                subtitle: '5.4'.tr,
                onTap: () {
                  seccontorller.secName = 'Antibiotics';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.5'.tr,
                subtitle: '5.6'.tr,
                onTap: () {
                  seccontorller.secName = 'Vaccines';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.7'.tr,
                subtitle: '5.8'.tr,
                onTap: () {
                  seccontorller.secName = 'Ophthalmic Medications';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
          ],
        ),
      ),
    );
  }
}
