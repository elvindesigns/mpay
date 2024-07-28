import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/service_button.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Airtime/UI/order.dart';
import 'package:mpay/screens/Cable/UI/order.dart';
import 'package:mpay/screens/Data/UI/order.dart';
import 'package:mpay/screens/Electricity/UI/providers.dart';
import 'package:mpay/screens/History/UI/view_history.dart';
import 'package:mpay/screens/Wallet/UI/fund_wallet.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) => Scaffold(
        body: SizedBox(
          height: 100.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Morning 👋"),
                          Text(
                            "Elvin Opara",
                            style: TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            iconSize: 18,
                            icon: Icon(FontAwesomeIcons.bell),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: BrandColors().red,
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: BrandColors().blue,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/mpay-banner.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.3,
                        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/mpay.png",
                            width: 85,
                          ),
                        ),
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
                        Container(
                          width: 160,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FundWalletScreen(),
                                    ),
                                  );
                                },
                                child: ServiceButton(
                                  icon: FontAwesomeIcons.circlePlus,
                                  buttonColor: Color.fromARGB(255, 24, 66, 184),
                                  textColor: Color.fromARGB(255, 24, 66, 184),
                                  text: "Top Up",
                                  iconSize: 17,
                                  textSize: 12,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewHistoryScreen(),
                                    ),
                                  );
                                },
                                child: ServiceButton(
                                  icon: FontAwesomeIcons.clockRotateLeft,
                                  buttonColor: Color.fromARGB(255, 24, 66, 184),
                                  textColor: Color.fromARGB(255, 24, 66, 184),
                                  text: "History",
                                  iconSize: 17,
                                  textSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18,
                        ),
                      ),
                      // Text(
                      //   "See All",
                      //   style: TextStyle(
                      //     color: Colors.blue,
                      //     fontFamily: 'NunitoBold',
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ElectricityProvidersScreen(),
                            ),
                          );
                        },
                        child: ServiceButton(
                          icon: FontAwesomeIcons.lightbulb,
                          buttonColor: Color.fromARGB(255, 255, 200, 18),
                          text: "Electricity",
                          iconSize: 20,
                          textSize: 13,
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataOrderScreen(),
                            ),
                          );
                        },
                        child: ServiceButton(
                          icon: FontAwesomeIcons.wifi,
                          buttonColor: Color.fromARGB(255, 255, 144, 18),
                          text: "Data",
                          iconSize: 20,
                          textSize: 13,
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AirtimeOrderScreen(),
                            ),
                          );
                        },
                        child: ServiceButton(
                          icon: FontAwesomeIcons.phone,
                          buttonColor: Color.fromARGB(255, 18, 113, 255),
                          text: "Airtime",
                          iconSize: 20,
                          textSize: 13,
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CableOrderScreen(),
                            ),
                          );
                        },
                        child: ServiceButton(
                          icon: FontAwesomeIcons.satelliteDish,
                          buttonColor: Color.fromARGB(255, 139, 18, 255),
                          text: "Cable TV",
                          iconSize: 20,
                          textSize: 13,
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ServiceButton(
                          icon: FontAwesomeIcons.glassWaterDroplet,
                          buttonColor: Color.fromARGB(255, 18, 148, 255),
                          text: "Water",
                          iconSize: 20,
                          textSize: 13,
                          radius: 26,
                        ),
                      ),
                    ].animate(interval: 50.ms).fade(duration: 150.ms).moveX(
                          duration: 150.ms,
                          begin: 15,
                          end: 0,
                        ),
                  ),
                  SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: ServiceButton(
                  //         icon: FontAwesomeIcons.hotel,
                  //         buttonColor: Color.fromARGB(255, 18, 177, 44),
                  //         textColor: Colors.black,
                  //         text: "Hotel",
                  //         iconSize: 20,
                  //         textSize: 12,
                  //         radius: 26,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: ServiceButton(
                  //         icon: FontAwesomeIcons.plane,
                  //         buttonColor: Color.fromARGB(255, 17, 145, 177),
                  //         textColor: Colors.black,
                  //         text: "Flight",
                  //         iconSize: 20,
                  //         textSize: 12,
                  //         radius: 26,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: ServiceButton(
                  //         icon: FontAwesomeIcons.spoon,
                  //         buttonColor: Color.fromARGB(255, 255, 18, 176),
                  //         textColor: Colors.black,
                  //         text: "Food",
                  //         iconSize: 20,
                  //         textSize: 12,
                  //         radius: 26,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: ServiceButton(
                  //         icon: FontAwesomeIcons.cartShopping,
                  //         buttonColor: Color.fromARGB(255, 35, 199, 98),
                  //         textColor: Colors.black,
                  //         text: "Shopping",
                  //         iconSize: 20,
                  //         textSize: 12,
                  //         radius: 26,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: ServiceButton(
                  //         icon: FontAwesomeIcons.carrot,
                  //         buttonColor: Color.fromARGB(255, 201, 21, 21),
                  //         textColor: Colors.black,
                  //         text: "Groceries",
                  //         iconSize: 20,
                  //         textSize: 12,
                  //         radius: 26,
                  //       ),
                  //     ),
                  //   ]
                  //       .animate(interval: 50.ms, delay: 250.ms)
                  //       .fade(duration: 150.ms)
                  //       .moveX(
                  //         duration: 150.ms,
                  //         begin: 15,
                  //         end: 0,
                  //       ),
                  // )
                  SizedBox(height: 20),
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
                        color: mode.isDark
                            ? Colors.grey.withOpacity(0.3)
                            : Colors.blueGrey.shade100,
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
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo & Discounts",
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'NunitoBold',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Container(
                      width: 100.w,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: mode.isDark
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        image: DecorationImage(
                          opacity: 0.8,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/promo1.png"),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("10% OFF"),
                                  Text(
                                    "Today's Special",
                                    style: TextStyle(
                                      fontFamily: 'NunitoBold',
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "10%",
                                style: TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 40,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Get a discount on every topup and bill payment",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
