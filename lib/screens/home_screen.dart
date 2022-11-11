import 'package:flutter/material.dart';
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
            children: [Container()],
          ),
        ),
      ),
    );
  }
}
