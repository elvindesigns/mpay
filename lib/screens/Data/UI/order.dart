import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mpay/Widgets/bill_paid_dialog.dart';
import 'package:mpay/Widgets/pin_dialog.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/controllers/payment_controller.dart';
import 'package:mpay/data/sample.dart';
import 'package:mpay/utility/functions.dart';
import 'package:sizer/sizer.dart';

class DataOrderScreen extends StatefulWidget {
  const DataOrderScreen({super.key, this.details});
  final Map? details;

  @override
  State<DataOrderScreen> createState() => _DataOrderScreenState();
}

class _DataOrderScreenState extends State<DataOrderScreen> {
  int? selectedProvider;
  TextEditingController planController = TextEditingController();
  TextEditingController _customerID = TextEditingController();

  List dataProviders = [
    '9mobile',
    'Airtel',
    'MTN',
    'Glo',
    'Spectranet',
    'Smile'
  ];

  List filteredPlansSearch = [];
  String selectedPlan = "";
  String selectedAmount = "";

  @override
  void initState() {
    if (widget.details != null) {
      addCustomerDetails();
    }
    // filteredPlansSearch = List.from(dataPlans);
    super.initState();
  }

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
                  TitleText(
                    title: "Buy Data",
                  ),
                  Text(
                    "Purchase a data plan.",
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
                      itemCount: dataProviders.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedProvider = index;
                            });
                            filteredPlansSearch = List.from(dataPlans);
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
                              "assets/${dataProviders[index]}.png",
                              color: dataProviders[index] == "MTN"
                                  ? Colors.orange
                                  : dataProviders[index] == "Spectranet" &&
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
                                ? "Choose Data Plan"
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
                  Text("Mobile Number"),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {},
                    controller: _customerID,
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
                        size: 14,
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
                      onPressed: () {
                        Map<String, dynamic> payload = {
                          "amount": 100,
                          "currency": "NGN",
                          "reference": DateTime.now().toIso8601String(),
                          "customerFullName": "John Doe",
                          "customerEmail": "customer@gmail.com",
                          "apiKey": "MK_TEST_595UN92CCV",
                          "contractCode": "8628159341",
                          "paymentDescription": "Lahray World",
                          "metadata": {"name": "Damilare", "age": 45},
                       
                          "paymentMethod": [
                            "CARD",
                            "ACCOUNT_TRANSFER",
                            "USSD",
                            "PHONE_NUMBER"
                          ],
                        };
                        PaymentController().payWithMonnify(context, payload);
                      },
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

  void displayBottomSheet() {
    showMaterialModalBottomSheet(
      enableDrag: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        height: 60.h,
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
              color: Colors.grey.shade200,
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
        filteredPlansSearch = List.from(dataPlans);
      });
    });
  }

  List<Widget> buildPlansList(List mydataPlans) {
    List<Widget> plans = [];
    List filteredPlans = [...mydataPlans];
    for (var i = 0; i < filteredPlans.length; i++) {
      plans.add(
        InkWell(
          onTap: () {
            planController.text = selectedPlan = "${filteredPlans[i]['name']}";
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
          color: Colors.grey.shade200,
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

          return planName.contains(query);
        }).toList();
      }
    });
  }

  void addCustomerDetails() {
    int _index = dataProviders.indexWhere((element) =>
        element.toString().toLowerCase() ==
        widget.details!['name'].toString().toLowerCase());
    print(_index);
    selectedProvider = _index;
    filteredPlansSearch = List.from(dataPlans);
    selectedPlan = widget.details!['plan'];
    planController.text = widget.details!['plan'];
    _customerID.text = widget.details!['id'];
    selectedAmount = widget.details!['amount'].toString();
    setState(() {});
  }
}
