import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    this.anotherWidget,
    this.showPic = true,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    super.key,
  });
  final String text;
  final Color bgColor;
  final Color txtColor;
  final bool? showPic;
  final Widget? anotherWidget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      actions: [
        if (showPic == true)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              backgroundImage: NetworkImage(
                  "https://scontent.ftbs5-2.fna.fbcdn.net/v/t1.18169-9/1391743_603079143062900_1606433576_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IzVRfgAz8P8AX8LH0nX&_nc_ht=scontent.ftbs5-2.fna&oh=00_AfC0t0cP4wxY2R1FPTntC20Mat35rgn9LWwoP0_1Vn4Crg&oe=644D488A"),
            ),
          ),
        if (showPic == false) anotherWidget!,
      ],
      backgroundColor: bgColor,
      floating: true,
      title: Text(
        text,
        style: TextStyle(
          color: txtColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
    );
  }
}
