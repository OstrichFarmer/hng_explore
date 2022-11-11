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
            padding: const EdgeInsets.only(left: 24.0, top: 20, right: 24.0),
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
                            color: Colors.black,
                          )
                        : const Icon(Icons.light_mode)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
