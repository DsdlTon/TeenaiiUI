import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              searchBar(),
              bannerSection(),
              allCategorySection(),
              recentPostSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        'Teenaii',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget bannerSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          image: AssetImage("assets/images/sample.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget subHeadTitleRow({title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ดูเพิ่มเติม',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget allCategorySection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          subHeadTitleRow(title: 'หมวดหมู่ทั้งหมด'),
          categoryList(),
        ],
      ),
    );
  }

  Widget categoryList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.38,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height * 0.65),
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return categoryItem();
        },
      ),
    );
  }

  Widget categoryItem() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage("assets/images/sample2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Image Description',
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget recentPostSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          subHeadTitleRow(title: 'โพสต์ล่าสุด'),
          recentPostList(),
        ],
      ),
    );
  }

  Widget recentPostList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width *
              0.67 /
              (MediaQuery.of(context).size.height * 0.35),
          crossAxisCount: 1,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return recentPostItem();
        },
      ),
    );
  }

  Widget recentPostItem() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recentPostImage(),
            recentPostInfoBox(),
          ],
        ),
      ),
    );
  }

  Widget recentPostInfoBox() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ratingStar(),
            userProfilePreview(),
            showLocation(),
          ],
        ),
      ),
    );
  }

  Widget recentPostImage() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage("assets/images/sample.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: -20,
          child: MaterialButton(
            color: Colors.white,
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(
              Icons.favorite_border,
            ),
          ),
        ),
      ],
    );
  }

  Widget ratingStar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SmoothStarRating(
        color: Colors.yellow,
        borderColor: Colors.yellow,
        rating: 4,
        size: 15,
        starCount: 5,
      ),
    );
  }

  Widget userProfilePreview() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/sample2'),
            radius: 8,
          ),
          SizedBox(width: 5),
          Text('Username'),
        ],
      ),
    );
  }

  Widget showLocation() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'กรุงเทพ',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                '|',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'วังทองหลาง',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 12,
                color: Colors.blue,
              ),
              Text(
                '3 กม.',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
