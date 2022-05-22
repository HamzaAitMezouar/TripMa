import 'package:flutter/material.dart';

import 'package:tripma/services/FirebasePlaces.dart';
import 'package:tripma/widgets/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../model/PlacesModel.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return StaggeredGridView(
                  physics: const ScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                        places[index].image,
                        fit: BoxFit.scaleDown,
                      ),
                    );
                  });
            } else {
              return Shimmerpage();
            }
          }),
    );
  }
}
