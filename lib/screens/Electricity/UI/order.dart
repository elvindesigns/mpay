import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Electricity/UI/verify_n_pay.dart';
import 'package:sizer/sizer.dart';

class ElectricityOrderScreen extends StatefulWidget {
  final Map disco;
  final Map? details;
  const ElectricityOrderScreen({super.key, required this.disco, this.details});

  @override
  State<ElectricityOrderScreen> createState() => _ElectricityOrderScreenState();
}

class _ElectricityOrderScreenState extends State<ElectricityOrderScreen> {
  bool isHidingPassword = true;
  int selectedType = 0;

  Map customerDetail = {};
  TextEditingController _customerID = TextEditingController();
  TextEditingController _amount = TextEditingController();

  @override
  void initState() {
    if (widget.details != null) {
      addCustomerDetail();
    }
    buildCustomerDetail(
      'meterType',
      widget.disco['type'].keys.elementAt(0).toString(),
    );
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
                  TitleText(
                    title: widget.disco['name']!,
                  ),
                  Text(
                    widget.disco['billername']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Customer ID"),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      buildCustomerDetail('customerID', value);
                    },
                    controller: _customerID,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Meter Number",
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
                  SizedBox(height: 15),
                  Text("How much Electricity do you want to buy?"),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      buildCustomerDetail('amount', value);
                    },
                    controller: _amount,
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
                  Text("Select Meter Type"),
                  SizedBox(height: 10),
                  Row(
                    children: _buildMeterType(widget.disco['type']),
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
                                builder: (context) =>
                                    ElectricityVerifyAndpayScreen(
                                        disco: widget.disco,
                                        customerDetail: customerDetail),
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

  List<Widget> _buildMeterType(Map type) {
    List<Widget> meterType = [];
    for (var i = 0; i < type.length; i++) {
      meterType.add(
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedType = i;
              });
              buildCustomerDetail(
                'meterType',
                type.keys.elementAt(i).toString(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: selectedType == i ? BrandColors().blue : Colors.white,
                border: Border.all(
                  color: selectedType == i
                      ? Colors.transparent
                      : BrandColors().blue,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  selectedType == i
                      ? Icon(
                          Icons.check_circle,
                          color: BrandColors().red,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          color: BrandColors().blue,
                        ),
                  SizedBox(width: 5),
                  Text(
                    type.keys.elementAt(i).toString(),
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      color:
                          selectedType == i ? Colors.white : BrandColors().blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return meterType;
  }

  buildCustomerDetail(String type, String value) {
    customerDetail[type] = value;
  }

  void addCustomerDetail() {
    _customerID.text = widget.details!['id'];
    buildCustomerDetail('customerID', widget.details!['id']);
    _amount.text = widget.details!['amount'].toString();
    buildCustomerDetail('amount', widget.details!['amount'].toString());
  }
}
