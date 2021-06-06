import 'package:flutter/material.dart';

class HirePage extends StatefulWidget {
  @override
  _HirePageState createState() => _HirePageState();
}

class _HirePageState extends State<HirePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'หมวดหมู่ทั้งหมด',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height * 0.48),
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return itemContainer();
          },
        ),
      ),
    );
  }

  Widget itemContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: [
          //Show Image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/sample.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Show Title
          Text('Title')
        ],
      ),
    );
  }
}
