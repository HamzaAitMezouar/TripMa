import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class Shimmerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 219, 219, 219),
          highlightColor: Color.fromARGB(255, 255, 255, 255),
          child: GridView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return ContainerShim();
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
          )),
    );
  }

  Widget ContainerShim() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(18)),
        height: 10,
        width: 100,
      ),
    );
  }
}
