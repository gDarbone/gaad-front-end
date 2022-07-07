import 'package:flutter/material.dart';

class CategoryBottomBar extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.2),
                offset: Offset.zero
            ),
          ]
      ),
      height: 100,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.file_copy, color: Color.fromRGBO(35, 100, 128, 1)),
                onPressed: (){},
              ),
            ),
          ),

          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.emergency, color: Color.fromRGBO(35, 100, 128, 1)),
                onPressed: (){},
              ),
            ),
          ),

          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.contact_page_sharp, color: Color.fromRGBO(35, 100, 128, 1)),
                onPressed: (){},
              ),
            ),
          ),

          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.settings, color: Color.fromRGBO(35, 100, 128, 1)),
                onPressed: (){},
              ),
            ),
          ),

        ],
      ),
    );
  }
}