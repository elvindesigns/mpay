import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/data/sample.dart';
import 'package:mpay/screens/Electricity/UI/order.dart';

import 'package:sizer/sizer.dart';

class ElectricityProvidersScreen extends StatefulWidget {
  const ElectricityProvidersScreen({super.key});

  @override
  State<ElectricityProvidersScreen> createState() =>
      _ElectricityProvidersScreenState();
}

class _ElectricityProvidersScreenState
    extends State<ElectricityProvidersScreen> {
  bool isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [AppLogo(), SizedBox(width: 20)],
      ),
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
                title: "Electricity",
              ),
              Text(
                "Choose your DISCO below.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: _buildDiscos()
                      .animate(interval: 80.ms)
                      .fade(duration: 100.ms)
                      .moveY(
                        duration: 100.ms,
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

  List<Widget> _buildDiscos() {
    List<Widget> appDiscos = [];
    for (var i = 0; i < discos.length; i++) {
      appDiscos.add(
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ElectricityOrderScreen(
                  disco: discos[i],
                ),
              ),
            );
          },
          child: Container(
            height: 90,
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  // backgroundColor: Color.fromARGB(69, 255, 200, 18),
                  child: SizedBox(
                    width: 30,
                    child: Image.asset(
                      discos[i]['image'],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        discos[i]['name'],
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        discos[i]['billername'],
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
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      );
    }
    return appDiscos;
  }
}
