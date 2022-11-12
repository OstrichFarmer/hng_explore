class Filter {
  final String title;
  final List<Filter> tiles;
  Filter({this.tiles = const [], required this.title});

  static map(buildTiles) {}
}

final continents = <Filter>[
  Filter(title: 'Continents', tiles: [
    Filter(title: 'Asia'),
    Filter(title: 'Africa'),
    Filter(title: 'Europe'),
    Filter(title: 'Antartica'),
    Filter(title: 'North America'),
    Filter(title: 'South America'),
    Filter(title: 'Australia'),
  ]),
  Filter(title: 'Time Zone', tiles: [
    Filter(title: 'GMT '),
    Filter(title: 'GMT + 1'),
    Filter(title: 'GMT + 2'),
    Filter(title: 'GMT + 3'),
    Filter(title: 'GMT + 4'),
    Filter(title: 'GMT + 5'),
    Filter(title: 'GMT + 6'),
    Filter(title: 'GMT + 7'),
    Filter(title: 'GMT + 8'),
    Filter(title: 'GMT + 9'),
    Filter(title: 'GMT + 10'),
  ]),
];
