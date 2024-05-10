import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notificaton_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(notificationProvider).loadNotification();
    });
    FirebaseAnalytics.instance.logEvent(name: notificationScreen);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(notificationProvider);
    return Stack(
      children: [
        /* Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.background.bgTopCorner.keyName,
            width: Get.width / 1.6,
          ),
        ),*/
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Notification'),
            centerTitle: false,
          ),
          body: state.loading
              ? loadingCenter()
              : state.listOfNotification.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.auth.images.notificationempty
                              .image(width: 200, height: 150),
                          const Text(
                            'Welcome to Your Notifications Hub: \nStay Connected and Informed!',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),

                      /* child: Text(
                      'Welcome to Your Notifications Hub: \nStay Connected and Informed!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DM Sans',
                        fontSize: 16,
                      ),
                    )*/
                    )
                  : ListView.builder(
                      itemCount: state.listOfNotification.length,
                      itemBuilder: (ctx, index) {
                        NotificationData notificationData =
                            state.listOfNotification[index];

                        return InkWell(
                          onTap: () {
                            // state.onTapNotification(notificationData);
                          },
                          child: Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: const ValueKey(0),

                            // The start action pane is the one at the left or the top side.
                            startActionPane: ActionPane(
                              // A motion is a widget used to control how the pane animates.
                              motion: const ScrollMotion(),

                              // A pane can dismiss the Slidable.
                              // dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    state.onTapNotification(notificationData);
                                  },
                                  backgroundColor: FPcolors.color1F9E80BF,
                                  foregroundColor: Colors.black,
                                  icon: Icons.mark_chat_read_outlined,
                                  label: 'Read',
                                ),
                              ],
                            ),

                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (context) {
                                    state
                                        .ondeleteNotification(notificationData);
                                    state.loadNotification();
                                  },
                                  backgroundColor: FPcolors.colorD9D9D9,
                                  foregroundColor: Colors.red,
                                  icon: Icons.delete_outlined,
                                  label: 'Delete',
                                ),
                                /* const SlidableAction(
                                  onPressed: doNothing,
                                  backgroundColor: Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.save,
                                  label: 'Save',
                                ),*/
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        /*Text(
                                            timeAgo(notificationData.createdAt),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: FPcolors.fpgreyText,
                                            ),
                                          ),*/
                                        notificationData.isRead == false
                                            ? Container(
                                                height: 5.h,
                                                width: 5.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: FPcolors.fpPrimary,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ).marginSymmetric(horizontal: 5.w),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        notificationData.image ?? '',
                                        width: 40.h,
                                        height: 40.h,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return SizedBox(
                                            width: 40.h,
                                            height: 40.h,
                                            child: const Center(
                                              child: Text("No Image"),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        /*  Text(
                                            notificationData.title ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 4.h),*/
                                        SizedBox(
                                          width: Get.width * 0.6,
                                          child: Text(
                                            notificationData.title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: FPcolors.colorBlack,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).marginSymmetric(horizontal: 12.w),
                                  ],
                                ),
                              ],
                            ).marginSymmetric(horizontal: 16.w, vertical: 8.h),
                          ),
                          /* */
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

void doNothing(BuildContext context) {}
