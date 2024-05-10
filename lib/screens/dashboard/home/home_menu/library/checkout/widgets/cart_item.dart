import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class CartItemState extends ChangeNotifier {
  bool isDeleted = false;
  final BookDetailsModal book;
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  CartItemState(this.book);

  removeFromCart() async {
    loading = true;
    //dio.Response<dynamic> response =
    await dioService.delete(
      '/bookorder/user/delete-cart-book/${book.id}',
      data: {'book_id': book.id},
    ).whenComplete(() => loading = false);
  }
}

final cartItemProvider =
    ChangeNotifierProvider.autoDispose.family((r, BookDetailsModal book) {
  return CartItemState(book);
});

class CartItem extends ConsumerWidget {
  final BookDetailsModal book;
  final Function onRemovedFromCart;

  const CartItem(this.book, {Key? key, required this.onRemovedFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(cartItemProvider(book));
    return Container(
      padding: EdgeInsets.all(Get.width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.04),
        border: Border.all(
          color: FPcolors.greyBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
                child: book.coverImage != "null"
                    ? Image.network(
                        book.coverImage!,
                        width: Get.width * 0.18,
                        height: Get.height * 0.11,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(
                              Assets.settings.svg.emptyimage);
                        },
                      )
                    : SvgPicture.asset(Assets.settings.svg.emptyimage),
              ),
              Padding(
                padding: EdgeInsets.all(Get.width * 0.01),
                child: Assets.icons.bookWhite.image(width: 25),
              ),
            ],
          ),
          SizedBox(width: Get.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookTitle ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: FPcolors.color090A0A),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // SizedBox(height: Get.height * 0.01),
                Text(
                  book.authorName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: FPcolors.color6C7072,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: TagWidget(tag: book.tag),
                    ),
                    RatingWidget(
                      rating: book.rating,
                      bookId: book.id ?? '',
                      provider: null,
                    )
                  ],
                )
              ],
            ),
          ),
          // SizedBox(width: Get.width * 0.02),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () async {
                    showDialog(
                      builder: (context) => AlertDialog(
                        title: const Text('FreshPage'),
                        content: const Text(
                            'Are you sure you want to delete this item?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context), // Closes the dialog
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              try {
                                await state.removeFromCart();
                                onRemovedFromCart();
                              } on dio.DioException catch (e) {
                                SnackbarHelper.error(
                                    e.response?.data['message']);
                              }
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                      context: context,
                    );
                  },
                  child: SvgPicture.asset(
                    Assets.icons.trash_icon,
                    height: 40,
                    width: 40,
                  )),

              Text(
                '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: FPcolors.color090A0A),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(height: Get.height * 0.01),
              Text(
                '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: FPcolors.color6C7072,
                    fontWeight: FontWeight.w400),
              ),
              /* state.loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : ,*/
            ],
          )
        ],
      ),
    );
  }
}
