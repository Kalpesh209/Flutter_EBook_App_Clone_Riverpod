import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:get/get.dart';

import '../../../../config/fonts/fonts.dart';
import '../../../../gen/assets.gen.dart';

// ignore: must_be_immutable
class PolicyMenuExpansionWidget extends StatefulWidget {
  String mainHead;

  int listcount;

  List tileName;

  PolicyMenuExpansionWidget(
      {super.key,
      required this.mainHead,
      required this.listcount,
      required this.tileName});

  @override
  State<PolicyMenuExpansionWidget> createState() =>
      _PolicyMenuExpansionWidgetState();
}

class _PolicyMenuExpansionWidgetState extends State<PolicyMenuExpansionWidget> {
  var isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // MenuData MenuDataList = MenuData(context: context);

    return ListTileTheme(
      dense: true,
      child:
          /* IgnorePointer(
        child: */
          ExpansionTile(
        backgroundColor: FPcolors.colorWhite,
        initiallyExpanded: true,
        iconColor: FPcolors.colorWhite,
        collapsedIconColor: FPcolors.colorWhite,
        title: Text(
          "",
          style: FPfonts.dmSans18Primary,
        ),
        shape: const Border(),
        children: [
          ...List.generate(
              widget.listcount,
              (index) => ListTile(
                    onTap: () {
                      // if (widget.tileName[index]['route'] != 'menu') {
                      Get.toNamed(widget.tileName[index]['route']);
                      // }
                    },
                    leading: widget.tileName[index]['icon'] == 'Privacy policy'
                        ? Text(
                            widget.tileName[index]['title'],
                            style: FPfonts.dmSans17,
                          )
                        : SvgPicture.asset(widget.tileName[index]['icon']),
                    title: Text(
                      widget.tileName[index]['icon'] == 'Privacy policy'
                          ? ""
                          : widget.tileName[index]['title'],
                      style: FPfonts.dmSans17,
                    ),
                  ))
        ],
      ),
      //    ),
    );
  }
}

class MenuExpansionInnerWidget extends StatefulWidget {
  final String mainHead;

  final int listcount;

  final List tileName;
  final Function(String) onTap;

  const MenuExpansionInnerWidget({
    super.key,
    required this.mainHead,
    required this.listcount,
    required this.tileName,
    required this.onTap,
  });

  @override
  State<MenuExpansionInnerWidget> createState() =>
      _MenuExpansionInnerWidgetState();
}

class _MenuExpansionInnerWidgetState extends State<MenuExpansionInnerWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      child: ExpansionTile(
        // tilePadding: EdgeInsets.all(100),
        trailing: isExpanded
            ? const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 30,
              )
            : const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
                size: 30,
              ),
        onExpansionChanged: (bool expanded) {
          setState(() => isExpanded = expanded);
        },
        // trailing: Icon(Icons.keyboard_arrow_down_sharp),
        // tilePadding: EdgeInsets.only(left: 0),
        title: Text(
          widget.mainHead,
          style: FPfonts.dmSans17,
        ),
        shape: const Border(),
        children: [
          ...List.generate(
            widget.listcount,
            (index) => ListTile(
              onTap: () => widget.onTap(widget.tileName[index]['title']),
              leading: SvgPicture.asset(widget.tileName[index]['icon']),
              title: Text(
                widget.tileName[index]['title'],
                style: FPfonts.dmSans17,
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
