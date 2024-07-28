import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatefulWidget {
  final bool willRedirect;
  final String message;
  final Function? redirectFunction;
  const SuccessDialog(
      {super.key,
      required this.willRedirect,
      this.redirectFunction,
      required this.message});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  void initState() {
    peformRedirectAction();
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
            "Congratulations!",
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          widget.willRedirect
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: 25,
                )
        ],
      ),
    );
  }

  void peformRedirectAction() {
    if (mounted) {
      if (widget.willRedirect) {
        Future.delayed(Duration(seconds: 7), () {
          if (widget.redirectFunction != null) {
            widget.redirectFunction!();
          }
        });
      }
    }
  }
}
