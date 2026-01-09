import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constansts/color_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      controller: TextEditingController(),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      showCursor: true,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      defaultPinTheme: PinTheme(
        width: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        height: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        textStyle: const TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: ColorManager.black12, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        height: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        textStyle: const TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: ColorManager.black12, width: 2.5),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        height: (MediaQuery.of(context).size.width - 60 - (16 * 3)) / 4,
        textStyle: const TextStyle(fontSize: 23, color: Colors.black),
        decoration: BoxDecoration(
          color: ColorManager.transparent,
          border: Border.all(color: ColorManager.black54, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onCompleted: (pin) {
        debugPrint('OTP: $pin');
      },
    );
  }
}
