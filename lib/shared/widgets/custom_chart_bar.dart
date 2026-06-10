import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/spacing.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double height;

  const ChartBar({
    super.key,
    required this.day,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 110,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 8,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          day,
          style: AppTextStyles.caption.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}