import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/feedback/providers/feedback_providers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/exceptions/invalid_form.dart';
import '../../../common/helpers/snakbar_helper.dart';
import '../../../common/widgets/components.dart';
import '../../../config/colors/colors.dart';
import '../../../config/size/size.dart';
import '../../../config/themes/textfield_decorations.dart';
import '../../../gen/assets.gen.dart';

const List<String> list = <String>[
  'App usage',
  'Suggestions',
  'Feature requests',
  'Complaints',
  'Other'
];

class FeedBackScreen extends ConsumerWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(feedbackprov);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.background.bgTop.keyName))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: FpAppBar(title: '', backButtonRequired: true),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LargeTitle28('Feedback'),
              /* Container(
                color: Colors.white,
                child: TextFormField(
                  controller: state.catcon,
                  decoration: FpTextFieldDecoration(hintText: 'Category').copyWith(
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              ),*/
              /*Container(
                color: Colors.white,
                child: TextFormField(
                  onTap: (){
                    const DropdownMenuExample();
                  },
                  controller: state.catcon,
                  decoration: FpTextFieldDecoration(hintText: 'Category').copyWith(
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              ),*/
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownMenu<String>(
                      width: 360.w,
                      menuHeight: 200,
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        debugPrint("Feedback category $value");
                        state.categoryName = value.toString();
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    )
                  ],
                ),
              ),
              defaultSpacer,
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: state.subcategory,
                  decoration: FpTextFieldDecoration(hintText: 'Sub - Category'),
                ),
              ),
              defaultSpacer,
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: state.subcon,
                  decoration: FpTextFieldDecoration(hintText: 'Subject'),
                ),
              ),
              defaultSpacer,
              Container(
                color: Colors.white,
                height: 136,
                child: TextFormField(
                    controller: state.feedcon,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    expands: true,
                    decoration:
                        FpTextFieldDecorationLarge(hintText: 'Feedback')),
              ),
              defaultSpacer,
              SizedBox(
                  height: 72,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 18),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: FPcolors.fpPrimary),
                        onPressed: () async {
                          try {
                            await state.sendfeeback();
                            FocusScope.of(context).unfocus();
                            // SnackbarHelper.success('Feedback done');
                            Get.back(result: true);
                          } on InvalidFormException catch (e) {
                            SnackbarHelper.error(e.message);
                          } on DioException catch (e) {
                            SnackbarHelper.error(e.response?.data['message']);
                          }
                        },
                        child: Text('Submit',
                            style: TextStyle(
                                color: FPcolors.colorWhite, fontSize: 16))),
                  ))
            ],
          ),
        ),
        // bottomNavigationBar:
        //     FpElevatedButton(onPressed: () {}, buttonTitle: 'Submit'),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
