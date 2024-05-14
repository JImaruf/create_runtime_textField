import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countTextField = 1;
  Map<int, TextEditingController> controller = {};
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: ScreenSize.height,
          width: ScreenSize.width,
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  width: ScreenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Text Field",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            if (countTextField > 0 &&
                                controller.values
                                    .toList()[countTextField - 1]
                                    .text
                                    .isNotEmpty) {
                              countTextField++;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      "Empty TextFields Plsease put something ")));
                            }
                            setState(() {});
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            if (countTextField > 1) {
                              countTextField--;
                              controller[countTextField]?.clear();
                            }
                            setState(() {});
                          },
                          child: Icon(Icons.indeterminate_check_box_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: countTextField,
                itemBuilder: (context, index) {
                  if (!controller.containsKey(index)) {
                    controller[index] = TextEditingController();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller[index],
                      decoration: InputDecoration(hintText: "Enter Data"),
                    ),
                  );
                },
              )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            teController: controller
                          ),
                        ));

                    // controller.forEach((key, value) {
                    //
                    //
                    //   print(value.text.toString());
                    // });
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
