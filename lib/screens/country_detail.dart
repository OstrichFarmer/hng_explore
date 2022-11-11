import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hng_explore/utilities/dimensions.dart';
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
                        size: Dimensions.height30,
                      )),
                  Center(
                      child: Text(
                    widget.country!.name!.common!,
                    style: TextStyle(fontSize: Dimensions.height20),
                  )),
                  SizedBox(
                    width: Dimensions.height30,
                  )
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
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(i!),
                                  fit: BoxFit.contain)),
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: 'Population',
                  value: widget.country!.population!.toString()),
              RowDetails(
                  name: 'Region', value: widget.country!.region!.toString()),
              RowDetails(
                  name: 'Capital',
                  value: widget.country!.capital?.first ?? '-----'),
              RowDetails(name: 'Motto', value: 'Virtus unita fortior'),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: 'Official Language',
                  value: widget.country!.languages!.eng ?? '-----'),
              RowDetails(
                  name: 'Ethnic group',
                  value: widget.country!.demonyms!.eng!.f ?? '-----'),
              RowDetails(name: 'Religion', value: 'Christianity'),
              RowDetails(name: 'Government', value: 'Parliamentary democracy'),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(name: 'Independence', value: '8th September, 1911'),
              RowDetails(
                  name: 'Area',
                  value: widget.country?.area.toString() ?? '-----'),
              RowDetails(
                  name: 'Currency',
                  value: widget.country!.currencies!.bBD?.name ?? 'Euro'),
              RowDetails(name: 'GDP', value: "US\$3.400 billion"),
              SizedBox(
                height: Dimensions.height24,
              ),
              RowDetails(
                  name: 'Time zone',
                  value: widget.country!.timezones?.first ?? 'UTC+01:00'),
              RowDetails(
                  name: 'Date Format',
                  value: widget.country!.postalCode?.format ?? 'dd/mm/yyyy'),
              RowDetails(
                  name: 'Dialling Code',
                  value:
                      '${widget.country!.idd!.root}${widget.country!.idd!.suffixes!.first}'),
              RowDetails(
                  name: 'Driving Side',
                  value: widget.country!.car?.side ?? 'right'),
            ],
          ),
        )),
      ),
    );
  }
}
