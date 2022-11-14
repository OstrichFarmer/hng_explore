import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hng_explore/utilities/dimensions.dart';
import '../main.dart';
import '../models/country_model.dart';
import '../widgets/row_details_widget.dart';

class CountryDetailsScreen extends StatefulWidget {
  final int? index;
  final Country? country;
  const CountryDetailsScreen(
      {Key? key, @required this.index, @required this.country})
      : super(key: key);

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  List<String?> items = [];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.country!.flag != null) {
      items.add(widget.country!.flags!.png!);
      print(widget.country!.flag!);
    }
    if (widget.country!.coatOfArms!.png != null) {
      items.add(widget.country!.coatOfArms!.png!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height24, vertical: Dimensions.height19),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: Dimensions.height35,
                      )),
                  Center(
                      child: Text(
                    widget.country!.name!.common!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w500),
                  )),
                  const SizedBox.shrink()
                ],
              ),
              SizedBox(
                height: Dimensions.height16,
              ),
              CarouselSlider(
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height8),
                            image: DecorationImage(
                                image: NetworkImage(i!), fit: BoxFit.contain)),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: Dimensions.height250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: Dimensions.height24,
              ),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: strings.get(2),
                  value: widget.country!.population!.toString()),
              RowDetails(
                  name: strings.get(3),
                  value: widget.country?.region ?? '-----'),
              RowDetails(
                  name: strings.get(4),
                  value: widget.country!.capital?.first ?? '-----'),
              RowDetails(name: strings.get(5), value: '-----'),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: strings.get(6),
                  value: widget.country!.languages?.eng ?? '-----'),
              RowDetails(
                  name: strings.get(7),
                  value: widget.country!.demonyms?.eng!.f ?? '-----'),
              RowDetails(name: strings.get(8), value: '-----'),
              RowDetails(
                  name: strings.get(9), value: 'Parliamentary democracy'),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: strings.get(10),
                  value: widget.country!.independent?.toString() ?? '-----'),
              RowDetails(
                  name: strings.get(11),
                  value: widget.country?.area.toString() ?? '-----'),
              RowDetails(
                  name: strings.get(12),
                  value: widget.country!.currencies?.bBD?.name ?? 'Euro'),
              RowDetails(name: 'GDP', value: "US\$3.400 billion"),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: strings.get(13),
                  value: widget.country!.timezones?.first ?? 'UTC+01:00'),
              RowDetails(
                  name: strings.get(14),
                  value: widget.country!.postalCode?.format ?? 'dd/mm/yyyy'),
              RowDetails(
                  name: strings.get(15),
                  value:
                      '${widget.country!.idd?.root ?? ''}${widget.country!.idd?.suffixes?.first ?? ''}'),
              RowDetails(
                  name: strings.get(16),
                  value: widget.country!.car?.side ?? 'right'),
            ],
          ),
        )),
      ),
    );
  }
}
