import 'package:bloom_app/app/widgets/bottom_bar.dart';
import 'package:bloom_app/app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) {},
          children: BottomBarEnum.values.map((e) => e.getScreen).toList(),
        ),
        BottomNavigation(
          onChange: (bottomBarEnum) {
            _controller.jumpToPage(bottomBarEnum.index); // Chuyển trang
          },
        ),
      ],
    );
  }
}
