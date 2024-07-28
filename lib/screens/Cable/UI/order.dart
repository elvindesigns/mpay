import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/data/sample.dart';
import 'package:mpay/screens/Cable/UI/verify_n_pay.dart';
import 'package:mpay/utility/functions.dart';
import 'package:sizer/sizer.dart';

class CableOrderScreen extends StatefulWidget {
  const CableOrderScreen({super.key, this.details});
  final Map? details;

  @override
  State<CableOrderScreen> createState() => _CableOrderScreenState();
}

class _CableOrderScreenState extends State<CableOrderScreen> {
  int? selectedProvider;
  Map provider = {};
  Map customerDetail = {};
  TextEditingController planController = TextEditingController();
  TextEditingController _customerID = TextEditingController();

  List cableProviders = [
    'dstv',
    'gotv',
    'startimes',
    'tstv',
  ];

  List filteredPlansSearch = [];
  String selectedPlan = "";
  String selectedAmount = "";
  String idLabel = "Customer ID";

  @override
  void initState() {
    if (widget.details != null) {
      addCustomerDetails();
    }
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
                    title: "Cable TV",
                  ),
                  Text(
                    "Purchase a cable TV Plan.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Select Cable Provider"),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 100.w,
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cableProviders.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: GestureDetector(
                          onTap: () {
                            planController.text = "";
                            if (cableProviders[index] == "dstv") {
                              filteredPlansSearch = List.from(dstvPlans);
                              idLabel = "Smart Card Number";
                            } else if (cableProviders[index] == "gotv") {
                              filteredPlansSearch = List.from(gotvPlans);
                              idLabel = "IUC Number";
                            } else if (cableProviders[index] == "startimes") {
                              idLabel = "Reference ID";
                              filteredPlansSearch = List.from(startimesPlans);
                            } else if (cableProviders[index] == "tstv") {
                              filteredPlansSearch = List.from(tstvPlans);
                              idLabel = "Customer ID";
                            }

                            provider['name'] = cableProviders[index];

                            setState(() {
                              selectedProvider = index;
                              selectedAmount = "0";
                            });
                          },
                          child: Container(
                            width: 80,
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
                              "assets/${cableProviders[index]}.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        controller: planController,
                        decoration: InputDecoration(
                            hintText: selectedProvider != null
                                ? "Choose Cable Plan"
                                : "No Provider Selected",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey.shade300,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    '₦ ${AppFunctions.formatNumber(selectedAmount)}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(idLabel),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      customerDetail['customerID'] = value;
                    },
                    controller: _customerID,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter $idLabel",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.ellipsis,
                        size: 14,
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
                        if (customerDetail.containsKey('customerID') &&
                            customerDetail.containsKey('amount')) {
                          if (customerDetail['customerID']
                                  .toString()
                                  .isNotEmpty &&
                              customerDetail['amount'].toString().isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CableVerifyAndpayScreen(
                                  provider: provider,
                                  customerDetail: customerDetail,
                                ),
                              ),
                            );
                          }
                        }
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
                  SizedBox(height: 30),
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

  void displayBottomSheet() {
    showMaterialModalBottomSheet(
      enableDrag: false,
      context: context,

      // backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        width: 100.w,
        height: 85.h,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            TextField(
              onChanged: (value) {
                filterPlans(value);
              },
              decoration: InputDecoration(hintText: "Search"),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Name"), Text("Price")],
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
        // filteredPlansSearch = List.from(dataPlans);
      });
    });
  }

  List<Widget> buildPlansList(List myProviderPlans) {
    List<Widget> plans = [];
    List filteredPlans = [...myProviderPlans];
    for (var i = 0; i < filteredPlans.length; i++) {
      plans.add(
        InkWell(
          onTap: () {
            planController.text = selectedPlan = "${filteredPlans[i]['name']}";
            customerDetail['amount'] = "${filteredPlans[i]['amount']}";
            provider['billername'] = selectedPlan;
            setState(() {
              selectedAmount = "${filteredPlans[i]['amount']}";
            });
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(filteredPlans[i]['name']),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '₦ ${filteredPlans[i]['amount']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );
      if (i != dataPlans.length - 1) {
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
        filteredPlansSearch = List.from(dataPlans);
      } else {
        filteredPlansSearch = dataPlans.where((plan) {
          final planName = plan['name'].toString().toLowerCase();
          final query = searchValue.toLowerCase();
          print(plan['name'].toString().toLowerCase());
          print(searchValue.toLowerCase());
          print(planName.contains(query));
          print("==================");
          return planName.contains(query);
        }).toList();
      }
    });
  }

  void addCustomerDetails() {
    int _index = cableProviders.indexWhere((element) =>
        element.toString().toLowerCase() ==
        widget.details!['name'].toString().toLowerCase());
    print(_index);
    selectedProvider = _index;
    if (cableProviders[_index] == "dstv") {
      filteredPlansSearch = List.from(dstvPlans);
      idLabel = "Smart Card Number";
    } else if (cableProviders[_index] == "gotv") {
      filteredPlansSearch = List.from(gotvPlans);
      idLabel = "IUC Number";
    } else if (cableProviders[_index] == "startimes") {
      idLabel = "Reference ID";
      filteredPlansSearch = List.from(startimesPlans);
    } else if (cableProviders[_index] == "tstv") {
      filteredPlansSearch = List.from(tstvPlans);
      idLabel = "Customer ID";
    }
    selectedPlan = widget.details!['plan'];
    planController.text = widget.details!['plan'];
    _customerID.text = widget.details!['id'];
    selectedAmount = widget.details!['amount'].toString();
    setState(() {});
  }
}
