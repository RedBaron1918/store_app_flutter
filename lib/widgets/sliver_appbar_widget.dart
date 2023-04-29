import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/widgets/icons/circle_icon.dart';

import 'icons/icon_text_widget_row.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    required this.text,
    required this.bgColor,
    required this.txtColor,
    required this.leading,
    this.callback,
    super.key,
  });
  final String text;
  final Color bgColor;
  final Color txtColor;
  final bool leading;
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: bgColor,
      floating: true,
      toolbarHeight: 80.10,
      flexibleSpace: SafeArea(
        child: Container(
          color: ColorConstants.backgroundColor,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading
                  ? CircleIcon(
                      icon: Icons.grid_view_outlined,
                      iconSize: 25,
                      iconColor: Colors.black,
                      callBack: callback,
                    )
                  : const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Location",
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconTextWidgetRow(
                    align: MainAxisAlignment.center,
                    icon: Icons.location_on,
                    text: "Batumi",
                    iconSize: 18,
                    textSize: 20,
                    color: Colors.redAccent,
                    textColor: Colors.black,
                  ),
                ],
              ),
              const CircleIcon(
                icon: Icons.notifications,
                iconSize: 25,
                iconColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
