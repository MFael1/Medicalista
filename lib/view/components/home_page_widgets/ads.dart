import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: AppColor.grey,
            // gradient: AppColor.gradientApp,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const ListTile(
            title: Text(
              'winter surprise',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'Discount 20%',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Color(0xff222f3e),
                borderRadius: BorderRadius.circular(160)),
          ),
        ),
        Positioned(
          top: -20,
          left: -20,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Color(0xff222f3e),
                borderRadius: BorderRadius.circular(60)),
          ),
        )
      ],
    );
  }
}
