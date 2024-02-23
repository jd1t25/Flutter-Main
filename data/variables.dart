void main() {
  final List<String> code = [
    '2M085',
    '2M086',
    '2M087',
    '2M088',
    '2M089',
    '2M090',
    '2M091',
    '2M092',
    '2M093',
    '2M094',
    '2M095',
  ];

  final List<double> ucl = [
    44.708,
    133.710,
    51.228,
    55.708,
    51.728,
    44.725,
    50.628,
    44.708,
    35.208,
    32.708,
    33.618
  ];

  final List<double> lcl = [
    44.692,
    133.690,
    51.212,
    55.692,
    51.712,
    44.709,
    52.612,
    44.692,
    35.192,
    32.692,
    33.602
  ];

  final List<double> basis = [
    44.700,
    133.700,
    51.220,
    55.700,
    51.720,
    44.717,
    50.620,
    44.700,
    35.200,
    32.700,
    33.610
  ];
  final List<List<double>> dimensionList = [];
  for (int i = 0; i < ucl.length; i++) {
    dimensionList.add([ucl[i], lcl[i], basis[i]]);
  }

  Map<String, dynamic> getValue() {
    final Map<String, List> mainList = Map.fromIterables(code, dimensionList);
    return mainList;
  }
//   print(lists['2M085']);
// //   final Map<List,List> lists = Map.fromIterables(ucl, lcl);

// //   final Map<String, List> z = Map.fromIterables(code, lists);

// //   print(z['2M085']);
// //   for (int i = 0; i < 10; i++) {
// //     print('hello ${i + 1}');
// //   }
}
