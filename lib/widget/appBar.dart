import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';

Widget appBar({required Widget left, String? title, Widget? right}) {
  return Container(
      height: 60,
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Row(
          children: [
            left,
            const SizedBox(
              height: 20,
            ),
            Text(title!, style: kWhiteMdmTextStyle)
          ],
        ),
      ));
}
