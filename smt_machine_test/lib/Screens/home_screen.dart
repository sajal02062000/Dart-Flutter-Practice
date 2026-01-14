import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_machine_test/Controllers/login_controllers.dart';
import 'package:smt_machine_test/Helpers/local_storage_helpers.dart';
import 'package:smt_machine_test/Screens/profile_screen.dart';
import 'package:smt_machine_test/Styles/styled_fonts.dart';
import 'package:smt_machine_test/Constants/custom_colors.dart';
import 'package:smt_machine_test/Widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = LocalStorageHelper.getEmail();
    final LoginControllers loginControllers = Get.put(LoginControllers());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: CustomColors.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                StyledHeadingText(
                  text: "Welcome,",
                  fontSize: 24,
                  color: Colors.black54,
                ),
                const SizedBox(width: 8),
                StyledHeadingText(
                  text: email,
                  fontSize: 28,
                  color: CustomColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items:
                  [
                    "https://www.shutterstock.com/image-vector/illustration-batsman-playing-cricket-championship-600nw-2469319503.jpg",
                    "https://www.shutterstock.com/image-vector/illustration-batsman-playing-cricket-championship-600nw-2146224395.jpg",
                    "https://static.vecteezy.com/system/resources/thumbnails/023/406/904/small/cricket-championship-banner-design-with-3d-red-ball-wicket-stumps-helmet-on-green-and-blue-playground-view-vector.jpg",
                    "https://static.vecteezy.com/system/resources/thumbnails/023/956/627/small/3d-text-with-abstract-purple-background-for-cricket-match-header-poster-or-banner-design-with-wicket-and-ball-equipment-vector.jpg",
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.network(i, fit: BoxFit.cover),
                        );
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              child: CustomButton(
                buttonText: "Go to Profile",
                onTap: () => Get.to(() => const ProfileScreen()),
                buttonColor: CustomColors.primaryColor,
                borderRadius: 12,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: CustomButton(
                buttonText: "Logout",
                onTap: () => loginControllers.logout(),
                buttonColor: Colors.redAccent,
                borderRadius: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
