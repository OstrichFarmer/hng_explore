import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main.dart';
import '../utilities/colors.dart';
import '../utilities/styles.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController? searchCountryController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: searchBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 16.w),
          Icon(
            Icons.search,
            size: 16.r,
            color: searchTextColor,
          ),
          Expanded(child: SizedBox(width: 16.w)),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                controller: searchCountryController,
                decoration: InputDecoration(
                    hintText: strings.get(0),
                    hintStyle: searchTextStyle,
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(child: SizedBox(width: 16.w))
        ],
      ),
    );
  }
}
