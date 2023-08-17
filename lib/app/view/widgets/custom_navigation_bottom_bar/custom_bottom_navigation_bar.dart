import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.centerFloatingActionButton,
  });
  final List<Widget> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final Widget centerFloatingActionButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        width: 100.w,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 0.3, color: Colors.grey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: insertSpacerAtCenter(
            items,
            centerFloatingActionButton,
          ),
        ),
      ),
    );
  }

  List<Widget> insertSpacerAtCenter(List<Widget> list, Widget item) {
    int centerIndex = list.length ~/ 2;
    List<Widget> modifiedList = List.from(list);
    modifiedList.insert(centerIndex, item);
    return modifiedList;
  }
}
