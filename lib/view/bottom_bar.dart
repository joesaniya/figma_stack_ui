import 'dart:ui';

import 'package:figma_ui/data/modal.dart';
import 'package:figma_ui/view/home-page.dart';
import 'package:figma_ui/widgets/button_notch.dart';
import 'package:flutter/material.dart';
import '/constants/color.dart';
import '/constants/text_style.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectBtn = 0;

  final List<Widget> _screens = [
    HomePage(),
    Center(child: Text('Connect Screen')),
    Center(child: Text('Portfolio Screen')),
    Center(child: Text('Messages Screen')),
    Center(child: Text('Profile Screen')),
  ];

  final List<NavButton> navBtn = [
    NavButton(name: 'Deals', iconData: Icons.local_offer_outlined),
    NavButton(name: 'Connect', iconData: Icons.people_outline),
    NavButton(name: 'Portfolio', iconData: Icons.work_outline),
    NavButton(name: 'Messages', iconData: Icons.message_outlined),
    NavButton(name: 'Profile', iconData: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _screens[selectBtn],
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          ),
        ],
      ),
    );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () => setState(() => selectBtn = i),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              navBtn[i].iconData, // Use IconData instead of an image
              color: isActive ? selectColor : black,
              size: 24.0, // Adjust the icon size
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              navBtn[i].name,
              style: isActive ? bntText.copyWith(color: selectColor) : bntText,
            ),
          ),
        ],
      ),
    );
  }
}
