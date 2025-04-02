import 'package:capstone/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/widget_support.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pdf = false, notes = false, questions = false, important = false;

  Stream? contentTypeStream;

  ontheload() async {
    contentTypeStream = await DatabaseMethods().getFoodItem("Pdf");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: contentTypeStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailsScreen(
                              title: ds["Branch"],
                              subtitle: ds["Subject"],
                              content: ds["Content"],
                            ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/books.jpg",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 1.h),

                            Text(
                              ds["Branch"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(height: 0.1.h),
                            Text(
                              ds["Subject"],
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color:
                                        isLiked1 ? Colors.green : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLiked1 = !isLiked1;
                                      isDisliked1 = false;
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.thumb_down,
                                    color:
                                        isDisliked1 ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isDisliked1 = !isDisliked1;
                                      isLiked1 = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
            : CircularProgressIndicator();
      },
    );
  }

  Widget allItemsVertically() {
    return StreamBuilder(
      stream: contentTypeStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailsScreen(
                              title: ds["Branch"],
                              subtitle: ds["Subject"],
                              content: ds["Content"],
                            ),
                      ),
                    );
                  },
                  child: Container(
                    // todo
                    margin: EdgeInsets.only(right: 20.0, bottom: 20),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/books.jpg",
                              height: 120,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Branch"],
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Subject"],
                                    style: AppWidget.lightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Content"],
                                    maxLines: 3,
                                    style: AppWidget.subjectExplain(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
            : CircularProgressIndicator();
      },
    );
  }

  bool isLiked1 = false;
  bool isLiked2 = false;
  bool isDisliked1 = false;
  bool isDisliked2 = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 2.h, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Team - 86', style: AppWidget.boldTextFieldStyle()),
                SizedBox(height: 20.0),
                Text("UniShare", style: AppWidget.headlineTextFieldStyle()),
                Text(
                  "A place to learn & collaborate",
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem(),
                ),
                SizedBox(height: 25.0),

                SizedBox(height: 37.6.h, child: allItems()),

                SizedBox(height: 30.0),

                SingleChildScrollView(child: allItemsVertically()),
                SizedBox(height: 30.0),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            pdf = true;
            notes = false;
            questions = false;
            important = false;
            contentTypeStream = await DatabaseMethods().getFoodItem("Pdf");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: pdf ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/pdf_notes.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                // color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            pdf = false;
            notes = true;
            questions = false;
            important = false;

            contentTypeStream = await DatabaseMethods().getFoodItem("Notes");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: notes ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/notes.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                // color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            pdf = false;
            notes = false;
            questions = true;
            important = false;

            contentTypeStream = await DatabaseMethods().getFoodItem(
              "Questions",
            );
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: questions ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/questions.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            pdf = false;
            notes = false;
            questions = false;
            important = true;

            contentTypeStream = await DatabaseMethods().getFoodItem(
              "Important",
            );
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: important ? Color(0xFFff5c10) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/important.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
