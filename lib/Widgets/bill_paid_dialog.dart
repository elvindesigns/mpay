import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mpay/Widgets/navigator.dart';
import 'package:mpay/brand/colors.dart';
import 'package:sizer/sizer.dart';

class BillPaidDialog extends StatefulWidget {
  final bool? isWithrawing;
  const BillPaidDialog({
    super.key,
    this.isWithrawing = false,
  });

  @override
  State<BillPaidDialog> createState() => _BillPaidDialogState();
}

class _BillPaidDialogState extends State<BillPaidDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/success.json',
            width: 200,
            height: 200,
            repeat: false,
            fit: BoxFit.cover,
          ),
          Text(
            widget.isWithrawing!
                ? "Funds Withdrawn Successfully"
                : "Bill Paid Successfully!",
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Transaction successfull.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 100.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: BrandColors().blue,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SetFingerprintScreen(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Share Receipt",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NunitoBold',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 100.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppNaviagtor(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'NunitoBold',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
