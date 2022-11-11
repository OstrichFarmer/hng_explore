import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_explore/utilities/colors.dart';
import 'package:hng_explore/utilities/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool selectMode = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.height24,
                top: Dimensions.height20,
                right: Dimensions.height24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage('assets/images/ex_logo.png'),
                    width: Dimensions.height114,
                    height: Dimensions.height35,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selectMode = !selectMode;
                        });
                      },
                      child: selectMode
                          ? const Icon(
                              Icons.wb_sunny_outlined,
                              size: 30,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.light_mode,
                              size: 30,
                            )),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.height24,
              top: Dimensions.height24,
              right: Dimensions.height24,
            ),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (_) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.paleWhite,
                    hintText: 'Search Country',
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff667085),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(Dimensions.height16),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => languageSheet()),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: const EdgeInsets.all(10)),
                      child: Row(
                        children: const [
                          Icon(Icons.language),
                          SizedBox(
                            width: 10,
                          ),
                          Text('EN')
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: const EdgeInsets.all(10)),
                      child: Row(
                        children: const [
                          Icon(Icons.filter_alt_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Filter')
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget languageSheet() => Container(
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.height20),
                topRight: Radius.circular(Dimensions.height20))),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Language',
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.cancel),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ListTile(
                      selectedColor: Colors.black,
                      leading: Text(
                        'Nigeria',
                        style: GoogleFonts.montserrat(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(Icons.circle_outlined),
                      onTap: () {},
                    );
                  }),
            ),
          ],
        ),
      );
}
