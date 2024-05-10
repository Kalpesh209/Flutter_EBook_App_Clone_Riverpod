import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_grid_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import 'music_player.dart';

class LastPlayedScreen extends ConsumerStatefulWidget {
  const LastPlayedScreen({Key? key, required this.album}) : super(key: key);
  final List<BookDetailsModal> album;

  @override
  LastPlayedScreenState createState() => LastPlayedScreenState();
}

class LastPlayedScreenState extends ConsumerState<LastPlayedScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    //var state = ref.watch(viewallprovider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Last Played",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.album.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          crossAxisCount: 2,
          childAspectRatio: Get.width / (Get.height / 1.49),
        ),
        itemBuilder: (context, index) {
          BookDetailsModal album = widget.album[index];
          return MusicGridItem(
            album: album,
            fromScreen: 'music',
            onTap: () => Get.to(() => MusicPlayer(album)),
          );
        },
      ),
    );
  }
}
