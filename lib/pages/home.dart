import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/pages/app_bar.dart';
import 'package:flutter_basics/pages/sliver_app_bar.dart';
import 'package:flutter_basics/tabs/messages_tab.dart';
import 'package:flutter_basics/tabs/stories.dart';

enum MyItems { sliverAppbar, appBar, itemThree }

class Home extends StatefulWidget with PreferredSizeWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _HomeState extends State<Home> {
  MyItems? selectedItem;
  bool isSearchActive = false;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> myScaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        key: myScaffoldKey,
        drawer: const Drawer(),
        appBar: AppBar(
            toolbarHeight: 56.0,
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.white,
            shadowColor: Colors.red,
            surfaceTintColor: Colors.yellowAccent,
            scrolledUnderElevation: 5.0,
            // best used with notificationPredicate
            primary: true,
            // works the same as safeArea widget
            excludeHeaderSemantics: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            // leading: IconButton(
            //     onPressed: () {
            //       myScaffoldKey.currentState!.openDrawer();
            //     },
            //     icon: const Icon(Icons.restaurant_menu_rounded)),
            leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.restaurant_menu_rounded))),
            // will override Scaffold.drawer
            title: (isSearchActive)
                ? mySearchWidget(_controller)
                : myTitleWidget(),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  setState(() {
                    isSearchActive = (!isSearchActive);
                    debugPrint("isSearchActive: ${isSearchActive.toString()}");
                  });
                },
              ),
              PopupMenuButton<MyItems>(
                initialValue: selectedItem,
                splashRadius: 10.0,
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
                      case MyItems.appBar:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppBarPage(),
                          ),
                        );
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
                    value: MyItems.appBar,
                    child: Text('AppBar'),
                  ),
                  const PopupMenuItem<MyItems>(
                    value: MyItems.itemThree,
                    child: Text('Item 3'),
                  ),
                ],
              )
            ],
            bottom: TabBar(
                indicatorColor: Colors.white,
                splashFactory: NoSplash.splashFactory,
                // removes inkHighlight
                indicatorWeight: 3.0,
                enableFeedback: true,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                splashBorderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(screenWidth, 100)),
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.red,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
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
            MyMessagesTab(),
            MyStoriesTab(),
            Icon(
              Icons.call_end_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

doNothing() {
  return;
}

Widget mySearchWidget(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.transparent,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: controller,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontFamily: 'monospace')),
            ),
            const Icon(Icons.search_rounded),
          ],
        ),
      ),
    ),
  );
}

Widget myTitleWidget() {
  return const Text(
    "Basic Widgets and Layout",
    style: TextStyle(fontSize: 15),
  );
}
