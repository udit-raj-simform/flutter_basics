import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/sliver_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Basics",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
    );
  }
}

enum MyItems { sliverAppbar, itemTwo, itemThree }

class Home extends StatefulWidget with PreferredSizeWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _HomeState extends State<Home> {
  MyItems? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text(
              "Basic Widgets and Layout",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            actions: [
              const Icon(Icons.search),
              PopupMenuButton<MyItems>(
                initialValue: selectedItem,
                onSelected: (MyItems item) {
                  setState(() {
                    selectedItem = item;
                    switch (selectedItem) {
                      case MyItems.sliverAppbar:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SliverAppBarPage(),
                          ),
                        );

                        break;
                      case MyItems.itemTwo:
                        debugPrint("item 2 called");
                        break;
                      case MyItems.itemThree:
                        debugPrint("item 3 called");
                        break;
                      default:
                        return;
                    }
                  });
                },
                itemBuilder: (BuildContext buildContext) =>
                <PopupMenuEntry<MyItems>>[
                  const PopupMenuItem<MyItems>(
                    value: MyItems.sliverAppbar,
                    child: Text('Sliver'),
                  ),
                  const PopupMenuItem<MyItems>(
                    value: MyItems.itemTwo,
                    child: Text('Item 2'),
                  ),
                  const PopupMenuItem<MyItems>(
                    value: MyItems.itemThree,
                    child: Text('Item 3'),
                  ),
                ],
              )
            ],
            bottom: const TabBar(tabs: [
              Tab(
                text: "Messages",
              ),
              Tab(
                text: "Stories",
              ),
              Tab(
                text: "Calls",
              ),
            ])),
        body: const TabBarView(
          children: [
            Icon(Icons.home_filled),
            Icon(Icons.location_history_rounded),
            Icon(Icons.call_end_rounded)
          ],
        ),
      ),
    );
  }
}

doNothing() {
  return;
}
