import 'package:exam_api_integration/controller/detailscreencontroller.dart';
import 'package:exam_api_integration/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key, required this.id});
  final String id;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<DetailsController>().getData(count: widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<DetailsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('detail screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(providerwatch.product!.name.toString()),
          Text(providerwatch.product!.data!.capacity.toString()),
          Text(providerwatch.product!.data!.color.toString()),
        ],
      ),
    );
  }
}
