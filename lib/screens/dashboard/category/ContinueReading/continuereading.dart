import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/ContinueReading/recentbooks.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/top_picks/seachbook_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/components.dart';
import '../../../../common/widgets/rating.dart';
import '../../../../common/widgets/tag.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/route/route_names.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../home/book_challenge/screens/select_book_search_screen.dart';
import '../../notification/notification_provider.dart';
import '../../notification/notificaton_response.dart';
import '../../wallet/tabs/all_orders.dart';
import '../../wallet/tabs/books_tab.dart';
import '../../wallet/tabs/out_of_box_tab.dart';
import '../../wallet/tabs/transactions_tab.dart';
import 'allbooks.dart';

class ContinueReadingNewScreen extends ConsumerStatefulWidget {
  final String title;

  const ContinueReadingNewScreen({super.key, required this.title});

  @override
  ContinueReadingNewScreenState createState() =>
      ContinueReadingNewScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class ContinueReadingNewScreenState
    extends ConsumerState<ContinueReadingNewScreen>
    with TickerProviderStateMixin {
  SampleItem? selectedItem;
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.watch(notificationProvider).loadNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    // var state = ref.watch(notificationProvider);
    var actionBtnWidth = Get.width * 0.06;

    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
              bottom: TabBar(
                controller: tabController,
                tabAlignment: TabAlignment.fill,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const <Widget>[
                  Tab(text: 'All Books'),
                  Tab(text: 'Recent Reads'),
                ],
              ),
            ),
            body: /*state.loading
                ? loadingCenter()
                :*/
                TabBarView(
              controller: tabController,
              children: const [
                AllBooksScreen(),
                RecentBooksScreen(),
              ],
            )));
  }
}
