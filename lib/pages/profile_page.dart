import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:
                    Image.asset('assets/images/profile.jpg', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Ahmed Saeed',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text('ahmed@saeed.com',
                style: Theme.of(context).textTheme.titleMedium),
            const Text('0599123456'),
            const SizedBox(
              height: 30,
            ),
            infoCard("settings", Icons.settings),
            const SizedBox(
              height: 10,
            ),
            infoCard("personal info", Icons.person_pin_outlined),
            const SizedBox(
              height: 10,
            ),
            infoCard('orders history', Icons.menu_book_sharp),
            const SizedBox(
              height: 10,
            ),
            infoCard('Logout', Icons.logout),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, IconData icon) {
    return Container(
      width: 380,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Icon(icon, color: AppColors.primaryColor, size: 30),
            const SizedBox(width: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium)
          ]),
          Row(
            children: [
              Icon(Icons.arrow_forward_ios_outlined, color: AppColors.darkGrey),
            ],
          )
        ]),
      ),
    );
  }
}
