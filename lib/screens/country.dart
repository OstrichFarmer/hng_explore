import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config_file.dart';
import '../main.dart';
import '../models/country_model.dart';
import '../models/language_model.dart';
import '../provider/countr_list_provider.dart';
import '../repository/country_repository.dart';
import '../utilities/colors.dart';
import '../utilities/dimensions.dart';
import '../utilities/styles.dart';
import '../widgets/country_card.dart';
import '../widgets/searchbar_widget.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

bool darkMode = true;

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _CountryListScreenState extends State<CountryListScreen> {
  TextEditingController? searchCountryController = TextEditingController();
  final _debouncer = Debouncer();
  List<Country> temp = [];
  List<Country> country = [];
  int langVal = 0;

  @override
  Widget build(BuildContext context) {
    List alpha = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    List added = [];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.h),
          child: Consumer<CountryProvider>(
            builder: (_, provider, body) {
              provider.setCountryData(CountryRespository().getData());
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        darkMode
                            ? Image(
                                image:
                                    const AssetImage('assets/images/logo.png'),
                                width: Dimensions.height114,
                                height: Dimensions.height35,
                              )
                            : Image(
                                image: const AssetImage(
                                    'assets/images/ex_logo.png'),
                                width: Dimensions.height114,
                                height: Dimensions.height35,
                              ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                darkMode = !darkMode;
                                currentTheme.switchTheme();
                              });
                            },
                            child: !darkMode
                                ? const Icon(Icons.light_mode_outlined)
                                : const Icon(Icons.dark_mode_outlined))
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // const SearchBar(),
                    /// searchbar
                    Container(
                      height: 48.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                        color: searchBarColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: Dimensions.height16),
                          Icon(
                            Icons.search,
                            size: Dimensions.height16,
                            color: searchTextColor,
                          ),
                          Expanded(child: SizedBox(width: Dimensions.height16)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: searchCountryController,
                                decoration: InputDecoration(
                                    hintText: strings.get(0),
                                    hintStyle: searchTextStyle,
                                    border: InputBorder.none),
                                onChanged: (string) {
                                  _debouncer.run(() {
                                    setState(() {
                                      country = temp
                                          .where(
                                            (u) => (u.name!.common!
                                                .toLowerCase()
                                                .contains(
                                                  string.toLowerCase(),
                                                )),
                                          )
                                          .toList();
                                    });
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox(width: Dimensions.height16))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Language
                        InkWell(
                          onTap: () => showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Dimensions.height20),
                                        topRight: Radius.circular(
                                            Dimensions.height20))),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      ListTile(
                                        title: Text('Languages',
                                            style: TextStyle(
                                                fontFamily: "Axiforma",
                                                fontSize: Dimensions.font25,
                                                fontWeight: FontWeight.w600)),
                                        trailing: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              size: Dimensions.height30,
                                            )),
                                      ),
                                      ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: Lang().langData.length,
                                          shrinkWrap: true,
                                          itemBuilder: (_, index) {
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    left: 24.w,
                                                    right: 24.w,
                                                    top: 24.h),
                                                child: ListTile(
                                                  title: Text(Lang()
                                                      .langData[index]
                                                      .name!),
                                                  trailing: Radio<int>(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    value: Lang()
                                                        .langData[index]
                                                        .id!,
                                                    groupValue: langVal,
                                                    onChanged:
                                                        (int? value) async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      setState(() {
                                                        langVal = value!;
                                                        prefs.setInt(
                                                            'langu', index + 1);
                                                        strings
                                                            .setLang(index + 1);
                                                      });
                                                    },
                                                  ),
                                                ));
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          child: Container(
                            height: Dimensions.height20 * 2,
                            width: Dimensions.height68 + 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                    Border.all(color: const Color(0xffA9B8D4))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Dimensions.height5,
                                ),
                                Icon(
                                  Icons.language_rounded,
                                  size: Dimensions.height19,
                                ),
                                Text(
                                  'EN',
                                  style: TextStyle(fontSize: Dimensions.font12),
                                ),
                                SizedBox(
                                  width: Dimensions.height5,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// filter
                        Container(
                          height: Dimensions.height20 * 2,
                          width: Dimensions.height68 + 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border:
                                  Border.all(color: const Color(0xffA9B8D4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.filter_alt_outlined,
                                size: 19.r,
                              ),
                              Text(
                                strings.get(1),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    /// country list
                    FutureBuilder(
                      future: provider.getCountryData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          temp = snapshot.data as List<Country>;
                          if (country.isEmpty) {
                            country = temp;
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              String first = '';
                              for (int i = 0; i < alpha.length; i++) {
                                if (alpha[i] ==
                                        country[index].name!.common![0] &&
                                    !added.contains(alpha[i])) {
                                  first = alpha[i];
                                  added.add(alpha[i]);
                                }
                                if (added.isEmpty) {
                                  first = alpha[i];
                                  added.add(alpha[i]);
                                }
                              }

                              return CountryCard(
                                image: country[index].flags!.png,
                                capital:
                                    country[index].capital?.first ?? '-----',
                                countryName: country[index].name!.common,
                                abbr: first,
                                index: index,
                                country: country[index],
                              );
                            },
                            itemCount: country.length,
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 25.r,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Something Went Wrong')
                              ],
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
