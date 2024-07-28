import 'package:flutter/material.dart';
import 'package:flutter_monnify/flutter_monnify.dart';
import 'package:mpay/brand/colors.dart';

class PaymentController {
  payWithMonnify(BuildContext context, Map<String, dynamic> payload) async {
    TransactionResponse? response = await Monnify().checkout(
      context, payload,
      // appBar: AppBarConfig(
      //     titleColor: Theme, backgroundColor: Colors.red),
      toast:
          ToastConfig(color: Colors.white, backgroundColor: BrandColors().blue),
    );
  }
}
