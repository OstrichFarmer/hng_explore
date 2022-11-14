import 'package:flutter/material.dart';


class Tile extends StatelessWidget {
  final String? flagUrl;
  final String countryName;
  final String countryCapital;
  const Tile(
      {this.flagUrl, required this.countryName, required this.countryCapital});

  @override
  Widget build(BuildContext context) {
    return flagUrl!.isNotEmpty
        ? ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: NetworkImage(flagUrl!), fit: BoxFit.cover)),
            ),
            title: Text(countryName),
            subtitle: Text(countryCapital == 'N/A'
                ? 'Not found'
                : countryCapital.substring(
                    1, countryCapital.toString().length - 1)),
          )
        : SizedBox.shrink();
  }
}
