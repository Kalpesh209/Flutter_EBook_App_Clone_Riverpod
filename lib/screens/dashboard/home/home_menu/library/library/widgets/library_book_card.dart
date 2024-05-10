import 'package:dio/dio.dart' as dio;
import 'package:event_bus_plus/res/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/tag.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class CartUpdatedEvent extends AppEvent {
  @override
  List<Object?> get props => ['cart'];
}

class LibraryBookCardState extends ChangeNotifier {
  BookDetailsModal book;
  bool _addingToCart = false;

  get addingToCart => _addingToCart;

  set addingToCart(status) {
    _addingToCart = status;
    notifyListeners();
  }

  LibraryBookCardState(this.book);

  addToCart() async {
    addingToCart = true;
    book.isCart = true;
    dio.Response<dynamic> response = await dioService.post(
      '/bookorder/user/add-cart',
      data: {'book_id': book.id ?? book.id},
    ).whenComplete(() => addingToCart = false);
    book.isCart = true;
    Map<String, dynamic> res = response.data;
    debugPrint('response.data ${response.data}');
    book.cartId = res['data']['id'];
    eventBus.fire(CartUpdatedEvent());
    notifyListeners();
  }

  removeFromCart() async {
    addingToCart = true;
    dio.Response<dynamic> response = await dioService
        .delete(
          '/bookorder/user/delete-cart-book/${book.id}',
        )
        .whenComplete(() => addingToCart = false);
    book.isCart = false;
    //Map<String, dynamic> res = response.data;
    debugPrint('response.data ${response.data}');
    eventBus.fire(CartUpdatedEvent());
    notifyListeners();
  }
}

final libraryBookCardProvider =
    ChangeNotifierProvider.family.autoDispose((r, BookDetailsModal book) {
  return LibraryBookCardState(book);
});

class LibraryBookCard extends ConsumerWidget {
  final BookDetailsModal book;
  final bool selected;
  final Function openDetails;

  const LibraryBookCard(
    this.book, {
    Key? key,
    this.selected = false,
    required this.openDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(libraryBookCardProvider(book));

    return InkWell(
      onTap: () => openDetails(),
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          border: Border.all(
            color: FPcolors.greyBorder,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Get.width * 0.04),
              child: Image.network(
                book.coverImage ?? '',
                width: Get.width * 0.18,
                height: Get.height * 0.11,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text("No Image"));
                },
              ),
            ),
            SizedBox(width: Get.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.bookTitle ?? book.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Text(
                    book.authorName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: FPcolors.fpgreyText),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    children: [
                      if (book.bookTag != null && book.bookTag!.isNotEmpty)
                        TagWidget(tag: (book.bookTag ?? '')),
                      RatingWidget(
                        rating: book.rating ?? 0.0,
                        bookId: book.id,
                        provider: null,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: Get.width * 0.01),
            state.book.isCart == true
                ? InkWell(
                    onTap: () async {
                      try {
                        await state.removeFromCart();
                      } on dio.DioException catch (e) {
                        SnackbarHelper.error(e.response?.data['message']);
                      }
                    },
                    child: SvgPicture.asset(
                      Assets.icons.tick2,
                      width: Get.width * 0.08,
                    ),
                  )
                : OutlinedButton(
                    onPressed: () async {
                      try {
                        await state.addToCart();
                      } on dio.DioException catch (e) {
                        SnackbarHelper.error(e.response?.data['message']);
                      }
                    },
                    child: Text(state.addingToCart ? '...' : 'Rent'),
                  )
          ],
        ),
      ),
    );
  }
}
