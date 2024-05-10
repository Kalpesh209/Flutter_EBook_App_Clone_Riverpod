import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/providers/select_contact_provider.dart';
import 'package:get/get.dart';

class SelectContactScreen extends ConsumerStatefulWidget {
  const SelectContactScreen({super.key});

  @override
  SelectContactScreenState createState() => SelectContactScreenState();
}

class SelectContactScreenState extends ConsumerState<SelectContactScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_select_contact_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(selectContactProvider).onInit();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(selectContactProvider);

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: FPcolors.colorWhite)),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              Assets.background.bgTopCorner.keyName,
              width: Get.width / 1.6,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Select contact for challenge'),
              centerTitle: true,
            ),
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
                            onChanged: state.onChanged,
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              filled: true,
                              fillColor: FPcolors.colorF2F4F5,
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: FPcolors.colorBlack,
                                  width: 1,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 20,
                                color: Color(0xff090A0A),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  searchController.clear();
                                  state.onCloseSearch();
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
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ref.watch(selectContactProvider).isLoading
                      ? const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.listOfContactsSearch.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  state.listOfContactsSearch[index].photo !=
                                          null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.memory(
                                            state.listOfContactsSearch[index]
                                                .photo!,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                color: FPcolors.colorEEEEEE,
                                                height: 50,
                                                width: 50,
                                              );
                                            },
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            color: FPcolors.colorEEEEEE,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                  SizedBox(width: 16.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.listOfContactsSearch[index]
                                            .displayName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        state.listOfContactsSearch[index]
                                            .phones[0].number,
                                        style: TextStyle(
                                          color: FPcolors.color6C7072,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: FPcolors.fpPrimary,
                                    ),
                                    onPressed: () {
                                      Get.back(
                                          result: state
                                              .listOfContactsSearch[index]);
                                    },
                                    child: Text(
                                      'Challenge',
                                      style: TextStyle(
                                        color: FPcolors.colorWhite,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ).marginOnly(left: 16.w),
                                ],
                              ).marginOnly(bottom: 16.h);
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
