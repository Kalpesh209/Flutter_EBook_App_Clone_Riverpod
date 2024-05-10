import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';

import '../../home/models/book_details_modal.dart';

class CategoryText extends StatelessWidget {
  final BookDetailsModal? slide;

  const CategoryText({
    super.key,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Get.width * 0.04),
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shadowColor: Colors.grey.shade300.withOpacity(0.4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business',
                  style: TextStyle(
                      fontSize: 20,
                      color: FPcolors.fpPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
