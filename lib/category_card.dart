import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

import 'category_model.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  CategoryCard(this.category);

  @override
  _CategoryCardState createState() => _CategoryCardState(category);
}

class _CategoryCardState extends State<CategoryCard> {
  Category category;

  _CategoryCardState(this.category);
  
  Widget get categoryCard {
    return Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: 400,
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {print('TAP');},
          highlightColor: Colors.yellow,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  colors: [
                    //new Color(0xff1a2a6c),
                    new Color(0xffb21f1f),
                    new Color(0xfffdbb2d),
                  ],
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4),
                    child: Container(
                      child: Icon(
                        Icons.donut_small,
                        size: 80,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.category.name.length > 20 ?
                            widget.category.name.substring(0,20) : widget.category.name,
                          style: TextStyle(
                            fontSize: 20,
                          ), 
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      child: Stack(
        children: <Widget>[
          categoryCard,
        ],
      ),
    );
  }
}