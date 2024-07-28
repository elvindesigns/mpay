import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/page_header.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/History/UI/view_history.dart';
import 'package:mpay/screens/Wallet/UI/fund_wallet.dart';
import 'package:mpay/screens/Wallet/UI/withdraw.dart';
import 'package:sizer/sizer.dart';

class ViewWalletScreen extends StatefulWidget {
  const ViewWalletScreen({super.key});

  @override
  State<ViewWalletScreen> createState() => _ViewWalletScreenState();
}

class _ViewWalletScreenState extends State<ViewWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  PageHeader(
                    pageName: 'Wallet',
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        color: BrandColors().blue,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: mode.isDark
                                ? Colors.transparent
                                : Color.fromARGB(255, 201, 200, 255),
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your balance",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "₦102,580.02",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'NunitoBold',
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.arrowDownShortWide,
                                      color: Colors.greenAccent,
                                      size: 14,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "INCOME",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₦255,450.50",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.arrowUpShortWide,
                                      color: Colors.redAccent,
                                      size: 14,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "EXPENSE",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₦152,870.48",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FundWalletScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10),
                              color: BrandColors().blue,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.circlePlus,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Fund Wallet",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WithdrawScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.circleDown,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Withdraw",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transaction",
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewHistoryScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'NunitoBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today"),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: Colors.blueGrey.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.wallet,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AEDC bill payment",
                                    style: TextStyle(
                                      fontFamily: 'NunitoBold',
                                    ),
                                  ),
                                  Text(
                                    "wallet transaction",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "-N 4,500",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NunitoBold',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ].animate(interval: 50.ms).fade(duration: 100.ms).moveY(
                      begin: 15,
                      end: 0,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCategoryIcon(String name) {
    Widget iconWidget = SizedBox();
    switch (name) {
      case 'electricity':
        iconWidget = CircleAvatar(
          radius: 27,
          backgroundColor: Color.fromARGB(255, 255, 200, 18).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.lightbulb,
              color: Color.fromARGB(255, 255, 200, 18),
            ),
          ),
        );
        break;
      case 'data':
        iconWidget = CircleAvatar(
          radius: 27,
          backgroundColor: Color.fromARGB(255, 255, 144, 18).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.wifi,
              color: Color.fromARGB(255, 255, 144, 18),
            ),
          ),
        );
        break;
      case 'airtime':
        iconWidget = CircleAvatar(
          radius: 27,
          backgroundColor: Color.fromARGB(255, 18, 113, 255).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.phone,
              color: Color.fromARGB(255, 18, 113, 255),
            ),
          ),
        );
        break;
      case 'cable':
        iconWidget = CircleAvatar(
          radius: 27,
          backgroundColor: Color.fromARGB(255, 139, 18, 255).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.satelliteDish,
              color: Color.fromARGB(255, 139, 18, 255),
            ),
          ),
        );
        break;
      default:
        iconWidget = CircleAvatar(
          radius: 27,
          backgroundColor: Colors.blueGrey.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.wallet,
              color: Colors.blue,
            ),
          ),
        );
    }
    return iconWidget;
  }
}
