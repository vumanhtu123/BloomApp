import 'package:bloom_app/app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/colors.dart';
import '../utils/screen_until.dart';

class BottomNavigation extends StatefulWidget {
  final Function(BottomBarEnum) onChange;

  const BottomNavigation({
    super.key,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  final double _heightItem = 66.64;

  // Biến trạng thái cục bộ để lưu tab hiện tại
  BottomBarEnum _currentTab = BottomBarEnum.home;

  void changeToTab(BottomBarEnum enumData) {
    if (_currentTab == enumData) {
      return;
    }
    setState(() {
      _currentTab = enumData; // Cập nhật tab hiện tại
    });
    widget.onChange(enumData); // Gọi callback để thông báo thay đổi tab
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/back_group_bottom_bar.png",
          width: double.infinity,
          height: _heightItem,
          fit: BoxFit.cover,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            BottomBarEnum.values.length,
            (index) => _buildBottomBarItem(BottomBarEnum.values[index]),
          ),
        ),
        _centerIconWidget(),
      ],
    );
  }

  Widget _buildBottomBarItem(BottomBarEnum dataEnum) {
    final isSelected = dataEnum == _currentTab;
    return InkWell(
      onTap: () => changeToTab(dataEnum),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5.3,
        height: _heightItem,
        child: dataEnum == BottomBarEnum.camera
            ? const SizedBox.shrink()
            : Center(
                child: SvgPicture.asset(
                  dataEnum.getIcon,
                  width: 19,
                  color: isSelected ? AppColors.secondaryColor : null,
                ),
              ),
      ),
    );
  }

  Widget _centerIconWidget() => Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: GScreenUtil.screenWidthDp / 5,
        height: _heightItem,
        child: InkWell(
          onTap: () => changeToTab(BottomBarEnum.camera),
          child: const Center(
            // child: Assets.icons.iconScanHome.image(
            //   width: 70,
            //   fit: BoxFit.cover,
            // ),
            child: Icon(Icons.camera, weight: 70),
          ),
        ),
      );
}
