import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/bill_paid_dialog.dart';
import 'package:mpay/Widgets/pin_dialog.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/utility/functions.dart';
import 'package:sizer/sizer.dart';

class CableVerifyAndpayScreen extends StatefulWidget {
  final Map provider;
  final Map customerDetail;
  const CableVerifyAndpayScreen(
      {super.key, required this.provider, required this.customerDetail});

  @override
  State<CableVerifyAndpayScreen> createState() =>
      _CableVerifyAndpayScreenState();
}

class _CableVerifyAndpayScreenState extends State<CableVerifyAndpayScreen> {
  bool isHidingPassword = true;
  int selectedType = 0;

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "₦",
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 22,
                        ),
                      ),
                      TitleText(
                        title: '${AppFunctions.formatNumber(
                          widget.customerDetail['amount'],
                        )}',
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.provider['name']!.toString().toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    widget.provider['billername']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Customer ID"),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  widget.customerDetail['customerID'],
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name"),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'ELVIN OPARA',
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Amount"),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  '${AppFunctions.formatNumber(
                                    widget.customerDetail['amount'],
                                  )}',
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
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
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
