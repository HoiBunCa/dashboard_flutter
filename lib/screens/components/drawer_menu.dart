import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/dashboard_content.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';
import '../../common/base_screen.dart';
import '../dash_board_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logowithtext.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BaseScreen('dashboard')));
              }),
          DrawerListTile(
              title: 'OCR System',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BaseScreen('ocr_system')));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: Colors.blueAccent,
              thickness: 0.5,
            ),
          ),
          DrawerListTile(
              title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {
                print("LOGOUT");
          }),
        ],
      ),
    );
  }
}
