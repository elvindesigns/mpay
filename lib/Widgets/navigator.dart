import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Dashboard/UI/dashboard.dart';
import 'package:mpay/screens/Payments/UI/view_payments.dart';
import 'package:mpay/screens/Profile/UI/view_profile.dart';
import 'package:mpay/screens/Wallet/UI/view_wallet.dart';

class AppNaviagtor extends StatefulWidget {
  const AppNaviagtor({super.key});

  @override
  State<AppNaviagtor> createState() => _AppNaviagtorState();
}

class _AppNaviagtorState extends State<AppNaviagtor> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    List buttons = [
      {'name': 'Home', 'icon': FontAwesomeIcons.house},
      {'name': 'Payment', 'icon': FontAwesomeIcons.moneyBill},
      {'name': 'Wallet', 'icon': FontAwesomeIcons.wallet},
      {'name': 'Statistics', 'icon': FontAwesomeIcons.chartLine},
      {'name': 'Profile', 'icon': FontAwesomeIcons.user},
    ];

    List pages = [
      DashboardScreen(),
      ViewPaymentScreen(),
      ViewWalletScreen(),
      DashboardScreen(),
      ViewProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
          ),
          child: ValueListenableBuilder(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, child) => BottomNavigationBar(
              items: buildButtons(buttons, selectedPage),
              selectedItemColor:
                  mode.isLight ? BrandColors().blue : Colors.white,
              unselectedItemColor: Colors.grey.shade500,
              type: BottomNavigationBarType.fixed,
              iconSize: 20,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              elevation: 0,
              onTap: (value) {
                setState(() {
                  selectedPage = value;
                });
              },
              currentIndex: selectedPage,
              backgroundColor: mode.isLight ? Colors.transparent : null,
              selectedLabelStyle: TextStyle(fontFamily: 'NunitoBold'),
            ),
          ),
        ),
      ),
      body: buildPage(pages),
    );
  }

  List<BottomNavigationBarItem> buildButtons(List buttons, int selctedPage) {
    List<BottomNavigationBarItem> appButtons = [];
    for (var i = 0; i < buttons.length; i++) {
      appButtons.add(
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                selectedPage == i
                    ? Positioned(
                        left: -3,
                        child: CircleAvatar(
                          backgroundColor: BrandColors().red,
                          radius: 5,
                        ),
                      ).animate().move(
                          begin: Offset(-5, -5),
                          end: Offset(0, 0),
                        )
                    : SizedBox(),
                Icon(buttons[i]['icon']),
              ],
            ),
          ),
          label: buttons[i]['name'],
          backgroundColor: Colors.white,
        ),
      );
    }
    return appButtons;
  }

  Widget buildPage(List pages) {
    return pages[selectedPage];
  }
}
