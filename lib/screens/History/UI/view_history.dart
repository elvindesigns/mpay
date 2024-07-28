import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/data/sample.dart';
import 'package:mpay/utility/functions.dart';

import 'package:sizer/sizer.dart';

class ViewHistoryScreen extends StatefulWidget {
  const ViewHistoryScreen({super.key});

  @override
  State<ViewHistoryScreen> createState() => _ViewHistoryScreenState();
}

class _ViewHistoryScreenState extends State<ViewHistoryScreen> {
  bool isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.transparent, actions: [
        Image.asset(
          "assets/mpay-dark.png",
          height: 40,
        ),
        SizedBox(width: 20)
      ]),
      body: SizedBox(
        height: 89.h,
        width: 100.w,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              TitleText(
                title: "History",
              ),
              SizedBox(height: 15),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: _buildHistory()
                      .animate(interval: 100.ms)
                      .fade(duration: 150.ms)
                      .moveY(
                        duration: 150.ms,
                        begin: 15,
                        end: 0,
                      ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildHistory() {
    List<Widget> appHistory = [];
    for (var i = 0; i < transactionHistory.length; i++) {
      appHistory.add(
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 90,
            // margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 15,
            ),
            decoration: BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCategoryIcon(transactionHistory[i]['category']),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transactionHistory[i]['name'],
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${transactionHistory[i]['type']} | ${transactionHistory[i]['date']}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  '₦${AppFunctions.formatNumber(transactionHistory[i]['amount'])}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: transactionHistory[i]['income'] == true
                        ? Color.fromARGB(255, 18, 202, 113)
                        : Colors.red,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
      );
    }
    return appHistory;
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
