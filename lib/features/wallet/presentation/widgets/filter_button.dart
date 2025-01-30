import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  final List<String> menuItems = ["Date", "Start", "End", "Proceed"];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          selectedItem = value;
        });
      },
      menuPadding: EdgeInsets.zero, // Removes extra padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color: AppColors.grey3,
      itemBuilder: (context) {
        List<PopupMenuEntry<String>> items = [];
        for (int i = 0; i < menuItems.length; i++) {
          items.add(
            PopupMenuItem<String>(
              height: 35,
              value: menuItems[i],
              padding: EdgeInsets.zero, // Removes internal padding
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: menuItems[i] == selectedItem
                        ? AppColors.lightPrimary
                        : AppColors.grey2,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(i == 0 ? 14 : 0),
                        bottom: Radius.circular(
                            i == menuItems.length - 1 ? 14 : 0)),
                    border: i < menuItems.length - 1
                        ? Border(
                            bottom:
                                BorderSide(width: 2, color: AppColors.grey3))
                        : null),
                child: Text(
                  menuItems[i],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.lightTextPrimary,
                  ),
                ),
              ),
            ),
          );
        }
        return items;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.grey3,
        ),
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.swap_vert_rounded,
          color: AppColors.lightSurface,
          size: 20,
        ),
      ),
    );
  }
}
