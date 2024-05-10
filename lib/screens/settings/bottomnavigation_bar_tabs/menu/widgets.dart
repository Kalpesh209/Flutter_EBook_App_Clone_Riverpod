import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/fonts/fonts.dart';
import '../../membership/subscrption_page_new.dart';

// ignore: must_be_immutable
class MenuExpansionWidget extends StatefulWidget {
  String mainHead;

  int listcount;

  List tileName;

  MenuExpansionWidget(
      {super.key,
      required this.mainHead,
      required this.listcount,
      required this.tileName});

  @override
  State<MenuExpansionWidget> createState() => _MenuExpansionWidgetState();
}

class _MenuExpansionWidgetState extends State<MenuExpansionWidget> {
  var isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // MenuData MenuDataList = MenuData(context: context);

    return ListTileTheme(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      child: ExpansionTile(
        initiallyExpanded: true,
        //  childrenPadding: EdgeInsets.zero,
        //  tilePadding: EdgeInsets.zero,
        trailing: isExpanded
            ? const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 30,
              )
            : const Icon(
                Icons.keyboard_arrow_right,
                size: 30,
              ),
        //Icons.keyboard_arrow_right:Icons.keyboard_arrow_right,
        //  SvgPicture.asset(Assets.images.svg.expansionTileOpenedIcon):SvgPicture.asset(Assets.images.svg.expansiontilecollapsedicon),
        onExpansionChanged: (bool expanded) {
          setState(() => isExpanded = expanded);
        },
        // tilePadding: EdgeInsets.only(left: 0),
        title: Text(
          widget.mainHead,
          style: FPfonts.dmSans18Primary,
        ),
        shape: const Border(),
        children: [
          ...List.generate(
              widget.listcount,
              (index) => ListTile(
                  onTap: () {
                    if (widget.tileName[index]['route'] != 'menu') {
                      Get.toNamed(widget.tileName[index]['route']);
                    }else{
                      if (widget.tileName[index]['route'] != 'Memberships') {
                        Get.toNamed( const SubscribePageNew(
                          showSuccess: false,
                          fromCart: false,
                        ) as String);
                      }
                    }
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
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                  )))
        ],
      ),
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
