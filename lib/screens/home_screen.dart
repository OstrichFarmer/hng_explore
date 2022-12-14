// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hng_explore/provider/countr_list_provider.dart';
// import 'package:hng_explore/utilities/colors.dart';
// import 'package:hng_explore/utilities/dimensions.dart';
// import 'package:provider/provider.dart';

// import '../models/country_model.dart';
// import '../repository/country_repository.dart';
// import '../widgets/country_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// bool selectMode = true;

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     List alpha = [
//       'A',
//       'B',
//       'C',
//       'D',
//       'E',
//       'F',
//       'G',
//       'H',
//       'I',
//       'J',
//       'K',
//       'L',
//       'M',
//       'N',
//       'O',
//       'P',
//       'Q',
//       'R',
//       'S',
//       'T',
//       'U',
//       'V',
//       'W',
//       'X',
//       'Y',
//       'Z'
//     ];
//     List added = [];
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(150),
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: Dimensions.height24,
//                 top: Dimensions.height20,
//                 right: Dimensions.height24,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image(
//                     image: const AssetImage('assets/images/ex_logo.png'),
//                     width: Dimensions.height114,
//                     height: Dimensions.height35,
//                   ),
//                   InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectMode = !selectMode;
//                         });
//                       },
//                       child: selectMode
//                           ? const Icon(
//                               Icons.wb_sunny_outlined,
//                               size: 30,
//                               color: Colors.black,
//                             )
//                           : const Icon(
//                               Icons.light_mode,
//                               size: 30,
//                             )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(
//               left: Dimensions.height24,
//               top: Dimensions.height24,
//               right: Dimensions.height24,
//             ),
//             child: Consumer<CountryProvider>(builder: (_, provider, body) {
//               provider.setCountryData(CountryRespository().getData());
//               return Column(
//                 children: [
//                   TextFormField(
//                     textAlign: TextAlign.center,
//                     onChanged: (_) {},
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColors.paleWhite,
//                       hintText: 'Search Country',
//                       hintStyle: GoogleFonts.montserrat(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xff667085),
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.search,
//                         color: Colors.black54,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.all(Dimensions.height16),
//                     ),
//                   ),
//                   SizedBox(
//                     height: Dimensions.height16,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () => showModalBottomSheet(
//                             isScrollControlled: true,
//                             backgroundColor: Colors.transparent,
//                             context: context,
//                             builder: (context) => languageSheet()),
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             padding: const EdgeInsets.all(10)),
//                         child: Row(
//                           children: const [
//                             Icon(Icons.language),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text('EN')
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             padding: const EdgeInsets.all(10)),
//                         child: Row(
//                           children: const [
//                             Icon(Icons.filter_alt_outlined),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text('Filter')
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: Dimensions.height20,
//                   ),
//                   FutureBuilder(
//                     future: provider.getCountryData,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done &&
//                           snapshot.hasData) {
//                         // final json = snapshot.data;

//                         final List<Country> country =
//                             snapshot.data as List<Country>;

//                         // print('here ' + country[245].name!.common.toString());
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           physics: const BouncingScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             String first = '';
//                             for (int i = 0; i < alpha.length; i++) {
//                               if (alpha[i] == country[index].name!.common![0] &&
//                                   !added.contains(alpha[i])) {
//                                 first = alpha[i];
//                                 added.add(alpha[i]);
//                               }
//                               if (added.isEmpty) {
//                                 first = alpha[i];
//                                 added.add(alpha[i]);
//                               }
//                             }
//                             return CountryCard(
//                               image: country[index].flags!.png,
//                               capital: country[index].capital?.first ?? '-----',
//                               countryName: country[index].name!.common,
//                               abbr: first,
//                               index: index,
//                               country: country[index],
//                             );
//                           },
//                           itemCount: country.length,
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.error_outline,
//                                 color: Colors.red,
//                                 size: Dimensions.height24,
//                               ),
//                               SizedBox(
//                                 height: Dimensions.height10,
//                               ),
//                               const Text('Something Went Wrong')
//                             ],
//                           ),
//                         );
//                       }
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget languageSheet() => Container(
//         height: MediaQuery.of(context).size.height * 0.70,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(Dimensions.height20),
//                 topRight: Radius.circular(Dimensions.height20))),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 'Language',
//                 style: GoogleFonts.montserrat(
//                     fontSize: 25, fontWeight: FontWeight.w600),
//               ),
//               trailing: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Icon(Icons.cancel),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: 50,
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       selectedColor: Colors.black,
//                       leading: Text(
//                         'Nigeria',
//                         style: GoogleFonts.montserrat(
//                             fontSize: Dimensions.font20,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       trailing: const Icon(Icons.circle_outlined),
//                       onTap: () {},
//                     );
//                   }),
//             ),
//           ],
//         ),
//       );
// }
