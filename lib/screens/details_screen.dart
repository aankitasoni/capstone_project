import 'package:capstone/screens/saved_screen.dart';
import 'package:capstone/services/database.dart';
import 'package:capstone/services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/widget_support.dart';

class DetailsScreen extends StatefulWidget {
  final String title, subtitle, content;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int a = 1;

  bool isSaved = false;

  String? id;

  getTheSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTheSharedPref();
  }

  ontheload() async {
    await getTheSharedPref();
    setState(() {
      // ontheload();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              "assets/books.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    Text(
                      widget.subtitle,
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    a = (a == 1) ? 0 : 1;
                    setState(() {});
                  },
                  child: Container(
                    height: 4.h,
                    width: 9.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      a == 1 ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                      size: 3.5.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(widget.content, style: AppWidget.lightTextFieldStyle()),
            SizedBox(height: 3.h),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 3.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addSavedContent = {
                        "Title": widget.title,
                        "Subtitle": widget.subtitle,
                        "Content": widget.content,
                      };

                      await DatabaseMethods().addSavedContent(
                        addSavedContent,
                        id!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Item Saved",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.yellow[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.bookmark, color: Colors.black),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.share_rounded, color: Colors.black),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
