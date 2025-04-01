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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(),
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
                                    "Operating System",
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                  SizedBox(height: 0.1.h),
                                  Text(
                                    "Round Robin Method",
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
                                              isLiked1
                                                  ? Colors.green
                                                  : Colors.grey,
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
                                              isDisliked1
                                                  ? Colors.red
                                                  : Colors.grey,
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
                      ),
                      SizedBox(width: 15.0),
                      Container(
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
                                  "DSA",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                SizedBox(height: 0.1.h),
                                Text(
                                  "Linked List",
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
                                            isLiked2
                                                ? Colors.green
                                                : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isLiked2 = !isLiked2;
                                          isDisliked2 = false;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color:
                                            isDisliked2
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isDisliked2 = !isDisliked2;
                                          isLiked2 = false;
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
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
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
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Operating System",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Round Robin Method",
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "It is a way to manage processes in a computer by giving each one a small, equal amount of time to run. Once a process finishes its time, it goes back to the end of the line, and the next process gets its turn. This keeps everything fair and ensures no process is left waiting too long. It's commonly used in systems where many tasks need to be handled at once.",
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
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
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
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Database Management System",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Normalization",
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "It is a database design process that organizes data to reduce redundancy and improve consistency. It involves dividing data into smaller, related tables and ensuring dependencies are logical. It follows steps called normal forms (1NF, 2NF, 3NF, etc.), each addressing specific redundancy and dependency issues for efficient storage and retrieval.",
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
          onTap: () {
            // pdf = true;
            // notes = false;
            // questions = false;
            // important = false;
            // setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                // color: icecream ? Colors.black : Colors.white,
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
          onTap: () {
            // pdf = false;
            // notes = true;
            // questions = false;
            // important = false;
            // setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                // color: pizza ? Colors.black : Colors.white,
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
          onTap: () {
            // pdf = false;
            // notes = false;
            // questions = true;
            // important = false;
            // setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                // color: salad ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/questions.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                // color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // pdf = false;
            // notes = false;
            // questions = false;
            // important = true;
            // setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
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
