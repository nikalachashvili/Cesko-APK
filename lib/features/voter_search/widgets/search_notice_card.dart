import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

/// White sheet under the header explaining what the search is for.
class SearchNoticeCard extends StatelessWidget {
  const SearchNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 18, 20, 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'გადაამოწმეთ პირადი მონაცემები და მისამართი ამომრჩეველთა ერთიან სიაში',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'პლატფორმა განკუთვნილია მხოლოდ ამომრჩეველთათვის - საკუთარი და ოჯახის წევრების მონაცემების გადასამოწმებლად !',
              style: TextStyle(
                color: AppColors.warning,
                fontSize: 12.5,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
