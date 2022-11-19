import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../Utils/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String backtitle;
  final String pagetitle;
  bool? hideBack;
  TextDirection? textDirction;
  List<Widget>? actions;
  var top = 0.0;
  CustomAppBar(
      {Key? key,
      required this.backtitle,
      required this.pagetitle,
      this.textDirction,
      this.hideBack = false,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 120.0,
        backgroundColor: Colors.white, //.withOpacity(0.25)
        toolbarHeight: 56,
        collapsedHeight: 56,
        pinned: true,
        snap: false,
        floating: false,
        actions: actions,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                hideBack == false
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child:  Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                      )

                    : Container(),
                hideBack == false
                    ? Text(backtitle,
                        style: TextStyles.Style18_Green)
                    : Container(),
              ],
            ),
          ),
        ),
        leadingWidth: 120,
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(
              start: top > 60 ? 24.0 : 0,
            ),
            centerTitle: top > 60 ? false : true,
            title: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: top > 60 ? 0 : 10.0, sigmaY: top > 60 ? 0 : 60.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.25)),
                child: top > 60
                    ? Text(pagetitle,
                        style: top > 60
                            ? TextStyles.Style24_bold
                            : TextStyles.Style18_hefyBold)
                    : Center(
                        child: Text(pagetitle,
                            style: top > 60
                                ? TextStyles.Style24_bold
                                : TextStyles.Style18_hefyBold),
                      ),
              ),
            ),
          );
        }));
  }
}
