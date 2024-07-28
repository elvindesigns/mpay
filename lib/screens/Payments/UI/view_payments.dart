import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/data/sample.dart';
import 'package:mpay/screens/Airtime/UI/order.dart';
import 'package:mpay/screens/Cable/UI/order.dart';
import 'package:mpay/screens/Data/UI/order.dart';
import 'package:mpay/screens/Electricity/UI/order.dart';
import 'package:mpay/screens/Electricity/UI/providers.dart';
import 'package:mpay/utility/functions.dart';
import 'package:sizer/sizer.dart';

class ViewPaymentScreen extends StatefulWidget {
  const ViewPaymentScreen({super.key});

  @override
  State<ViewPaymentScreen> createState() => _ViewPaymentScreenState();
}

class _ViewPaymentScreenState extends State<ViewPaymentScreen> {
  final ImagePicker picker = ImagePicker();
  bool hasPickedImage = false;
  String imagePath = '';

  List recent = [
    {
      'name': 'aedc',
      'amount': 1500,
      'type': 'electricity',
      'details': {
        'name': 'aedc',
        'amount': 1500,
        'id': '45123034824',
        'prepaid': true,
      }
    },
    {
      'name': 'dstv',
      'amount': 9300,
      'type': 'cable',
      'details': {
        'name': 'dstv',
        'amount': 9300,
        'id': '7083245167',
        'plan': 'DSTV Confam',
      }
    },
    {
      'name': 'MTN',
      'amount': 600,
      'type': 'data',
      'details': {
        'name': 'MTN',
        'amount': 600,
        'id': '08137331445',
        'plan': '2.5GB, 2-day Plan',
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payments",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'NunitoBold',
                      ),
                    ),
                    Image.asset(
                      "assets/mpay-dark.png",
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Most Used",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'NunitoBold',
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.blueGrey.withOpacity(0.05),
                  //   ),
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       blurRadius: 10,
                  //       offset: Offset(0, 10),
                  //       color: BrandColors().blue.withOpacity(0.1),
                  //     ),
                  //   ],
                  // ),
                  // padding: EdgeInsets.all(15),
                  width: 100.w,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recent.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        screenDecider(recent[index]);
                      },
                      child: SizedBox(
                        width: 90,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                      "assets/${recent[index]['name']}.png"),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              recent[index]['name'].toString().toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AppFunctions.formatNumber(
                                  recent[index]['amount']),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'NunitoBold',
                    ),
                  ),
                ),
                SizedBox(height: 15),
                PaymentListItem(
                  icon: FontAwesomeIcons.lightbulb,
                  text: "Electricity",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElectricityProvidersScreen(),
                      ),
                    );
                  },
                  iconBackground: Color.fromARGB(255, 255, 200, 18),
                ),
                PaymentListItem(
                  icon: Icons.wifi,
                  text: "Data",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataOrderScreen(),
                      ),
                    );
                  },
                  iconBackground: Color.fromARGB(255, 255, 144, 18),
                ),
                PaymentListItem(
                  icon: FontAwesomeIcons.phone,
                  text: "Airtime",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AirtimeOrderScreen(),
                      ),
                    );
                  },
                  iconBackground: Color.fromARGB(255, 18, 113, 255),
                ),
                PaymentListItem(
                  icon: FontAwesomeIcons.satelliteDish,
                  text: "Cable",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CableOrderScreen(),
                      ),
                    );
                  },
                  iconBackground: Color.fromARGB(255, 129, 18, 255),
                ),
                PaymentListItem(
                  icon: Icons.water_drop_outlined,
                  text: "Water",
                  onTap: () {},
                  iconBackground: Color.fromARGB(255, 18, 148, 255),
                ),
              ].animate(interval: 50.ms).fade(duration: 100.ms).moveY(
                    begin: 15,
                    end: 0,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  getProfileImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
        hasPickedImage = true;
      });
    }
  }

  void screenDecider(Map recent) {
    switch (recent['type']) {
      case 'data':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataOrderScreen(
              details: recent['details'],
            ),
          ),
        );

        break;
      case 'cable':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CableOrderScreen(
              details: recent['details'],
            ),
          ),
        );

        break;
      case 'electricity':
        var selectedDisco = discos.where((disco) =>
            disco['name'].toString().toLowerCase() == recent['name']);
        print(selectedDisco.first);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElectricityOrderScreen(
              disco: selectedDisco.first,
              details: recent['details'],
            ),
          ),
        );

        break;
      default:
    }
  }
}

class PaymentListItem extends StatefulWidget {
  final bool isSwitch;
  final IconData icon;
  final String text;
  final Function onTap;
  final Color iconBackground;

  const PaymentListItem({
    super.key,
    this.isSwitch = false,
    required this.icon,
    required this.text,
    required this.onTap,
    this.iconBackground = Colors.white,
  });

  @override
  State<PaymentListItem> createState() => _PaymentListItemState();
}

class _PaymentListItemState extends State<PaymentListItem> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isSwitch
          ? null
          : () {
              widget.onTap();
            },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.iconBackground.withOpacity(0.2),
              radius: 24,
              child: Icon(
                widget.icon,
                size: 18,
                color: widget.iconBackground,
              ),
            ),
            SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.text == 'Logout' ? BrandColors().red : null,
              ),
            ),
            Spacer(),
            widget.text == 'Logout'
                ? SizedBox()
                : widget.isSwitch
                    ? SizedBox(
                        height: 30,
                        child: Switch(
                            value: isDarkTheme,
                            onChanged: (value) {
                              setState(() {
                                isDarkTheme = !isDarkTheme;
                              });
                            }),
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
          ],
        ),
      ),
    );
  }
}
