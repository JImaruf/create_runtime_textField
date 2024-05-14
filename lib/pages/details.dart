

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<int,TextEditingController> teController;

   DetailsPage({super.key, required this.teController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: teController.length,
          itemBuilder:(context, index) {
          if(teController[index]!.value.text.toString()!="")
            {
              return Card(
                color: Colors.blueAccent,
                  child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(teController[index]!.value.text.toString(),style: TextStyle(color: Colors.white),),
              )));
            }

          }, ),
    );
  }
}
