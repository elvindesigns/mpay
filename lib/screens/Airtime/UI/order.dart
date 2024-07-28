import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/bill_paid_dialog.dart';
import 'package:mpay/Widgets/pin_dialog.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/data/sample.dart';
import 'package:sizer/sizer.dart';

class AirtimeOrderScreen extends StatefulWidget {
  const AirtimeOrderScreen({super.key});

  @override
  State<AirtimeOrderScreen> createState() => _AirtimeOrderScreenState();
}

class _AirtimeOrderScreenState extends State<AirtimeOrderScreen> {
  int? selectedProvider;
  TextEditingController planController = TextEditingController();

  List airtimeProviders = [
    '9mobile',
    'Airtel',
    'MTN',
    'Glo',
  ];

  List filteredPlansSearch = [];
  String selectedPlan = "";
  String selectedAmount = "";

  @override
  void initState() {
    filteredPlansSearch = List.from(dataPlans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          actions: [AppLogo(), SizedBox(width: 20)]),
      body: SizedBox(
        height: 89.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: SizedBox(
              height: 89.h - 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h),
                  TitleText(
                    title: "Buy Airtime",
                  ),
                  Text(
                    "Purchase Airtime.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Select Network Provider"),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 100.w,
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: airtimeProviders.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedProvider = index;
                            });
                          },
                          child: Container(
                            width: 70,
                            height: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: selectedProvider == index ? 2 : 1,
                                color: selectedProvider == index
                                    ? BrandColors().red
                                    : Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            child: Image.asset(
                              "assets/${airtimeProviders[index]}.png",
                              color: airtimeProviders[index] == "MTN"
                                  ? Colors.orange
                                  : airtimeProviders[index] == "Spectranet" &&
                                          selectedProvider == index
                                      ? Colors.white
                                      : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Mobile Number"),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.ellipsis,
                        color: BrandColors().lightblue,
                        size: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            "₦",
                            style: TextStyle(
                              color: BrandColors().lightblue,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        FontAwesomeIcons.wallet,
                        color: BrandColors().red,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BrandColors().blue,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PINDialog(),
                        ).then((value) {
                          if (value == true) {
                            showDialog(
                              barrierDismissible: false,
                              barrierColor: Color.fromARGB(192, 3, 23, 41),
                              context: context,
                              builder: (context) => BillPaidDialog(),
                            );
                          }
                        });
                      },
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Pay with Wallet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(child: Text("OR")),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Other Payment Methods"),
                    ),
                  ),
                  SizedBox(height: 20),
                ].animate(interval: 30.ms).fade(duration: 100.ms).moveY(
                      duration: 100.ms,
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
}
