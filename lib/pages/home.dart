import 'package:flutter/material.dart';
import '../../Utils/Util.dart';
import '../../widgets/CustomAppBar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../Utils/theme.dart';

class eLeave extends StatefulWidget {
  const eLeave({Key? key}) : super(key: key);

  @override
  _eLeaveState createState() => _eLeaveState();
}

class _eLeaveState extends State<eLeave> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Builder(
          builder: (context) => SafeArea(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                CustomAppBar(
                  pagetitle: "",
                  backtitle: "Home",
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 5),
                        //   child: IconButton(
                        //     icon: Image.asset(
                        //       "assets/images/icon-history-30.svg",
                        //       color: CustomColors.green,
                        //       height: 30,
                        //     ),
                        //     onPressed: () {
                        //       pushWithAnimation("/eLeaveHistory", context);
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(child: getBody()),
                )
              ],
            ),
          ),
        ),
      
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.h,
          ),
          
        ]
      ),
    );
  }



  
}
