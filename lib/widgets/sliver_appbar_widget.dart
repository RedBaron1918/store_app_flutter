import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/widgets/circle_icon.dart';

import 'icon_text_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    required this.text,
    required this.bgColor,
    required this.txtColor,
    super.key,
  });
  final String text;
  final Color bgColor;
  final Color txtColor;

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
              const CircleIcon(
                icon: Icons.grid_view_outlined,
                iconSize: 25,
                iconColor: Colors.black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Location",
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconTextWidget(
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
