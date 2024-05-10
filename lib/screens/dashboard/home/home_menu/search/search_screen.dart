import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key, required this.type});

  final String type;

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        onChanged: (searchTerm) {
                          if (widget.type == 'Audio') {
                            ref
                                .watch(searchBookProvider)
                                .getSearchedAudioBooks(searchTerm);
                          } else if (widget.type == 'Library') {
                            ref
                                .watch(searchBookProvider)
                                .getSearchedLibraryBooks(searchTerm);
                          } else {
                            ref
                                .watch(searchBookProvider)
                                .getSearchedBooks(searchTerm, widget.type);
                          }
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          fillColor: const Color(0XFFF2F4F5),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xff090A0A),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              _controller.clear();
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xff090A0A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              ref.watch(searchBookProvider).loading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ref.watch(searchBookProvider).books.length,
                        itemBuilder: (context, index) {
                          return BookWidget(
                            book: ref.watch(searchBookProvider).books[index],
                            onTap: (bookId) {
                              debugPrint('onTap $bookId');
                              if (widget.type == 'Library') {
                                Get.toNamed(libraryDetails,
                                    parameters: {'book_id': bookId ?? ''});
                              } else if (widget.type == 'Book') {
                                Get.toNamed(eBookDetails,
                                    parameters: {'book_id': bookId ?? ''});
                              } else if (widget.type == 'Audio') {
                                Get.toNamed(audioDetails,
                                    parameters: {'book_id': bookId ?? ''});
                              } else if (widget.type == 'Yoga') {
                                Get.toNamed(yogaDetails,
                                    parameters: {'book_id': bookId ?? ''});
                              } else if (widget.type == 'Meditation') {
                                // Get.toNamed(meditationDetails,
                                //     parameters: {'book_id': bookId ?? ''});
                                Get.to(() => MusicPlayer2(ref
                                    .watch(searchBookProvider)
                                    .books[index]));
                              } else if (widget.type == 'Music') {
                                // Get.toNamed(musicDetails,
                                //     parameters: {'book_id': bookId ?? ''});
                                Get.to(() => MusicPlayer(ref
                                    .watch(searchBookProvider)
                                    .books[index]));
                              }
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.book,
    required this.onTap,
  });

  final BookDetailsModal book;
  final Function(String? bookId) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(book.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                book.coverImage != null
                    ? book.coverImage ?? ''
                    : book.image ?? '',
                // errorBuilder: (context, error, stackTrace) {
                //   return const Center(child: Text("No Image"));
                // },
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    book.bookTitle != null
                        ? book.bookTitle ?? ''
                        : book.title ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  book.authorName != null
                      ? book.authorName ?? ''
                      : book.category ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.300,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
