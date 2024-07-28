import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/bill_paid_dialog.dart';
import 'package:mpay/Widgets/pin_dialog.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/data/sample.dart';
import 'package:sizer/sizer.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  List filteredPlansSearch = [];
  String selectedPlan = "";
  String accountNumber = "";

  TextEditingController bankController = TextEditingController();

  bool hasGottenAccount = false;

  @override
  void initState() {
    filteredPlansSearch = List.from(nigerianBanks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.transparent, actions: [
        AppLogo(),
        SizedBox(width: 20),
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
                    "Withdraw Funds",
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Withdraw from your wallet to bank.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: filteredPlansSearch.isEmpty
                        ? null
                        : () {
                            displayBottomSheet();
                          },
                    child: IgnorePointer(
                      ignoring: true,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: bankController,
                        decoration: InputDecoration(
                          hintText: "Choose Bank",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey.shade300,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        accountNumber = value;
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      hintText: "Account Number",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  selectedPlan.isNotEmpty && accountNumber.length > 9
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "ELVIN OPARA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
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
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: (value) {},
                    maxLines: 3,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: "Remark",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
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
                              builder: (context) => BillPaidDialog(
                                isWithrawing: true,
                              ),
                            );
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void displayBottomSheet() {
    showMaterialModalBottomSheet(
      enableDrag: false,
      context: context,
      // backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        width: 100.w,
        height: 90.h,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                  filteredPlansSearch = List.from(nigerianBanks);
                },
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  filterPlans(value);
                });
              },
              decoration: InputDecoration(hintText: "Search"),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Banks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.3),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Column(
                  children: [...buildPlansList(filteredPlansSearch)],
                ),
              ),
            )
          ],
        ),
      ),
    ).then((value) {
      setState(() {
        filteredPlansSearch = List.from(nigerianBanks);
      });
    });
  }

  List<Widget> buildPlansList(List myBanks) {
    List<Widget> plans = [];
    List filteredPlans = [...myBanks];
    for (var i = 0; i < filteredPlans.length; i++) {
      plans.add(
        InkWell(
          onTap: () {
            bankController.text = selectedPlan = "${filteredPlans[i]}";

            Navigator.pop(context);
          },
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(filteredPlans[i]),
                ),
              ],
            ),
          ),
        ),
      );
      if (i != nigerianBanks.length - 1) {
        plans.add(Divider(
          height: 0,
          color: Colors.grey.withOpacity(0.3),
        ));
      }
    }
    return plans;
  }

  filterPlans(String searchValue) {
    setState(() {
      if (searchValue.isEmpty) {
        filteredPlansSearch = List.from(nigerianBanks);
      } else {
        filteredPlansSearch = nigerianBanks.where((plan) {
          final planName = plan.toString().toLowerCase();
          final query = searchValue.toLowerCase();

          return planName.contains(query);
        }).toList();
      }
    });
  }
}
