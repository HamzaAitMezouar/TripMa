import 'package:flutter/material.dart';

import '../model/PlacesModel.dart';

class GridPage extends StatefulWidget {
  GridPage({
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<Places> places;
  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  bool isHover = false;
  @override
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: widget.places.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onExit: (event) {
              setState(() {
                isHover = false;
                print(isHover);
              });
            },
            onHover: (event) {
              setState(() {
                isHover = true;
                print(isHover);
              });
            },
            child: Stack(
              children: [
                Center(
                  child: Card(
                    elevation: 5,
                    child: Image.network(
                      widget.places[index].image,
                      fit: isHover ? BoxFit.fill : BoxFit.scaleDown,
                    ),
                  ),
                ),
                isHover
                    ? Text(
                        widget.places[index].name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    : Text(""),
              ],
            ),
          );
        });
  }
}
