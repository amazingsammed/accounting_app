import 'package:accounting/shared/utils/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: CircleAvatar(),
              title: Text("Sammed Twumasi"),
              subtitle: Text("Sammed@gmail.com"),
            ),
            kSizedbox20,
            SettingButton(
              icon: CupertinoIcons.heart,
              title: "Tell a friend",
            ),
            SettingButton(
              icon: Icons.star_rate,
              title: "Rate this app",
            ),
            SettingButton(
              icon: Icons.notifications_active_rounded,
              title: "Notification",
            ),
            SettingButton(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy",
            ),
            SettingButton(
              icon: Icons.logout,
              title: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final String title;
  final IconData icon;
   Function()? onTap;
   SettingButton(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: ElevatedButton(
          style: ButtonStyle(
              side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.black12)),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
          onPressed: () {},
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon),
            title: Text(title),
          )),
    );
  }
}
