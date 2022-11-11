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
    return Scaffold(
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
                    onPressed: () {},
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
    );
  }
}
