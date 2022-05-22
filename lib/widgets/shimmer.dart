import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class Shimmerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 219, 219, 219),
        highlightColor: Color.fromARGB(255, 255, 255, 255),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GridView.count(
                crossAxisCount: 2,
                children: [
                  Container(
                    height: 200,
                    width: 100,
                  ),
                  Container(
                    height: 200,
                    width: 100,
                  ),
                  Container(
                    height: 200,
                    width: 100,
                  ),
                  Container(
                    height: 200,
                    width: 100,
                  )
                ],
              );
            }));
  }
}
