import 'package:flutter/material.dart';

import 'package:tripma/services/FirebasePlaces.dart';
import 'package:tripma/widgets/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../model/PlacesModel.dart';
import '../widgets/GridPage.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text('Trip', style: TextStyle(fontSize: 18)),
            Text(
              'Ma',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<Places>>(
          initialData: const <Places>[],
          stream: FirebasePlaces().getPlaces(),
          builder: (context, snapshots) {
            if (!snapshots.hasData) {
              return Shimmerpage();
            } else if (snapshots.hasError) {
              return Shimmerpage();
            } else if (snapshots.hasData) {
              List<Places> places = snapshots.data!;
              return GridPage(places: places);
            } else {
              return Shimmerpage();
            }
          }),
    );
  }
}
