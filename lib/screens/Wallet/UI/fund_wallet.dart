import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class FundWalletScreen extends StatefulWidget {
  const FundWalletScreen({super.key});

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
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
                  Text(
                    "Fund Wallet",
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Fund your wallet using the means below",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 25),
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
                              Text("Bank"),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  "Wema Bank",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Text("Account No."),
                              SizedBox(width: 35),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        '0123456789',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        FontAwesomeIcons.copy,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Account Name"),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'MFY-Elvin Opara',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Make a transfer to the account above")),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(child: Text("OR")),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Other Funding Methods"),
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
