import 'package:flutter/material.dart';
import 'package:school_management_system/models/get_classes_model.dart';

class GetClassWidget extends StatelessWidget {
  GetClass classes;

  GetClassWidget({required this.classes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pinkAccent,
            ),
            child: Icon(Icons.event_note_outlined),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            classes.name!.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Container(
            height: 30,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.pinkAccent,
              ),
              child: TextButton(onPressed: () {}, child: Text("Edit",style: TextStyle(color: Colors.white),)))
        ],
      ),
    );
  }
}
