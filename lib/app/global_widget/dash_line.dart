import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        const dashHeight = 1.0;
        final dashCount = (boxWidth / (dashWidth)).floor();
        final newWidth = boxWidth - (dashCount - 1) * 4;
        final finalDashCount = (newWidth / (dashWidth)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(finalDashCount, (_) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: AppColors.greyColor.withOpacity(0.6)),
              ),
            );
          }),
        );
      },
    );
  }
}
