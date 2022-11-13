import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng_explore/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config_file.dart';
import '../main.dart';
import '../models/country_model.dart';
import '../models/language_model.dart';
import '../provider/countr_list_provider.dart';
import '../repository/country_repository.dart';
import '../utilities/styles.dart';
import '../widgets/country_card.dart';

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

  List<S2Choice<dynamic>> continents = [
    S2Choice(value: 1, title: 'Africa'),
    S2Choice(value: 2, title: 'Antarctica'),
    S2Choice(value: 3, title: 'Asia'),
    S2Choice(value: 4, title: 'Australia'),
    S2Choice(value: 5, title: 'Europe'),
    S2Choice(value: 6, title: 'North America'),
    S2Choice(value: 7, title: 'South America'),
  ];

  List<S2Choice<dynamic>> timeZone = [
    S2Choice(value: 1, title: 'UTC+01:00'),
    S2Choice(value: 2, title: 'UTC+02:00'),
    S2Choice(value: 3, title: 'UTC+03:00'),
    S2Choice(value: 4, title: 'UTC+04:00'),
    S2Choice(value: 5, title: 'UTC+05:00'),
    S2Choice(value: 6, title: 'UTC+06:00'),
    S2Choice(value: 7, title: 'UTC+07:00'),
    S2Choice(value: 8, title: 'UTC-01:00'),
  ];
  List<int> value = [2];
  List<S2Choice> options = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((t) {
      Provider.of<CountryProvider>(context, listen: false)
          .setCountryData(CountryRespository().getData());
    });
    super.initState();
  }

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
                        color: Theme.of(context).highlightColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 16.w),
                          Icon(
                            Icons.search,
                            size: 16.r,
                            color: Theme.of(context).hintColor,
                          ),
                          Expanded(child: SizedBox(width: 16.w)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: searchCountryController,
                                decoration: InputDecoration(
                                    hintText: strings.get(0),
                                    hintStyle: searchTextStyle.copyWith(
                                        color: Theme.of(context).hintColor),
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
                          Expanded(child: SizedBox(width: 16.w))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Language
                        InkWell(
                          onTap: () => showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      ListTile(
                                        title: Text(
                                          strings.get(17),
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(Icons.cancel)),
                                      ),
                                      ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: Lang().langData.length,
                                          shrinkWrap: true,
                                          itemBuilder: (_, index) {
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    left: 24.w, right: 24.w),
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
                                                      Navigator.pop(context);
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
                            height: 40.h,
                            width: 73.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border:
                                    Border.all(color: const Color(0xffA9B8D4))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.language_rounded,
                                  size: 18.r,
                                ),
                                Text(
                                  'EN',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// filter
                        InkWell(
                          onTap: () => showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Text(
                                        strings.get(1),
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      SmartSelect.multiple(
                                        choiceItems: continents,
                                        choiceLoader: null,
                                        title: strings.get(18),
                                        selectedValue: value,
                                        selectedChoice: options,
                                        onChange: (state) {},
                                      ),
                                      SmartSelect.multiple(
                                        choiceItems: timeZone,
                                        choiceLoader: null,
                                        title: strings.get(13),
                                        selectedValue: value,
                                        selectedChoice: options,
                                        onChange: (state) {},
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          child: Container(
                            height: 40.h,
                            width: 86.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
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
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                              ],
                            ),
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
