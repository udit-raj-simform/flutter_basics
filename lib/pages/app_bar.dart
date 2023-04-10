import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/main.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset("assets/images/my_dog.jpeg"),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text("Return to Menu"),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          excludeHeaderSemantics: true,
          toolbarHeight: 100,
          leadingWidth: 50,
          toolbarOpacity: 1,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                debugPrint("leading button working");
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/my_dog.jpeg'),
            fit: BoxFit.cover,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: const Text(
                "Custom Widget",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          )),
      body: CupertinoActionSheet(
        title: const Text(
          "Cupertino Widget",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        message: const Text(
          "This is a cupertino widget used in material scaffold which is returned by materialApp",
        ),
        actions: [
          CupertinoButton(
            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
          CupertinoButton(
            child: const Text("Dismiss"),
            onPressed: () {},
          ),
          // CupertinoActionSheetAction(
          //     onPressed: () {}, child: const Text("Dismiss"))
        ],
        cancelButton: CupertinoButton(
          child: const Icon(
            Icons.close_rounded,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
