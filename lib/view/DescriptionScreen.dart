import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
class DescriptionScreen extends StatefulWidget {
  var id;
  var description;
  var title;
  var date;
  var done;


  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();

  DescriptionScreen({
    required this.id,
    required this.description,
    required this.title,
    required this.date,
    required this.done,
  });
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        title: const Text("Description",style: TextStyle(
          color: textcolor,
          fontSize: fontLarge,
        )),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(RadiusCircular),
              bottomLeft: Radius.circular(RadiusCircular),

            )
        ),
        backgroundColor:primarydarkcolor ,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.title}",style: TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            Text("${widget.date}",style: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),),
            Text("${widget.description}",style: TextStyle(
                color: green,
                fontSize: 16
            ),),

          ],
          ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {


      },
          child: const Icon(Icons.share,color: textcolor,)),
      );
  }
}
