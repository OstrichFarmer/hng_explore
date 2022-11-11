import 'package:flutter/material.dart';
import '/utilities/dimensions.dart';
import '../models/country_model.dart';

class CountryCard extends StatefulWidget {
  final String? abbr;
  final String? image;
  final String? countryName;
  final String? capital;
  final int? index;
  final Country? country;

  const CountryCard(
      {Key? key,
      @required this.image,
      @required this.countryName,
      @required this.capital,
      @required this.abbr,
      @required this.index,
      @required this.country})
      : super(key: key);

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.abbr!.isEmpty ? const SizedBox.shrink() : Text(widget.abbr!),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CountryInfoPage(
                          index: widget.index,
                          country: widget.country,
                        )));
          },
          child: ListTile(
            leading: widget.image != null
                ? Container(
                    height: Dimensions.height50,
                    width: Dimensions.height50,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height10),
                        image: DecorationImage(
                            image: NetworkImage(widget.image!),
                            fit: BoxFit.cover)),
                  )
                : SizedBox(
                    height: Dimensions.height20 * 2,
                    width: Dimensions.height20 * 2,
                  ),
            title: Text(widget.countryName == null ? '' : widget.countryName!),
            subtitle: Text(widget.capital == null ? '' : widget.capital!),
          ),
        ),
      ],
    );
  }
}
