import 'package:exam_api_integration/controller/detailscreencontroller.dart';
import 'package:exam_api_integration/controller/homescreencontroller.dart';
import 'package:exam_api_integration/detailscreen/detailscreen.dart';
import 'package:exam_api_integration/model/objectmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<Homescreencontroller>().getData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Homescreencontroller>();

    if (provider.product.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: GridView.builder(
        itemCount: provider.product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var product = provider.product[index];
          var data = product.data;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detailscreen(id: provider.product.toString()),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ID: ${product.id}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Device: ${provider.product[index].name.toString()}"),
                  SizedBox(height: 8),
                  Text("Capacity: ${data?.capacity}"),
                  Text("Capacity: ${data?.color}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
