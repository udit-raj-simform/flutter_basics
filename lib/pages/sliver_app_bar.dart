import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  List myWidgets = <Widget>[
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            height: 300,
            color: Colors.black38,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(double.maxFinite),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/images/my_dog.jpeg"),
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
              ),
            ),
            myWidgets.elementAt(0),
            myWidgets.elementAt(0),
            myWidgets.elementAt(0),
            myWidgets.elementAt(0),
            myWidgets.elementAt(0),
            myWidgets.elementAt(0),
          ],
        ),
      ),
    );
  }
}
