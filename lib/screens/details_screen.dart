import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/widget_support.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int a = 1;

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
                      "Computer Science",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    Text("DBMS", style: AppWidget.boldTextFieldStyle()),
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
            Text(
              "Normalization is a database design process that organizes data to reduce redundancy and improve consistency. It involves dividing data into smaller, related tables and ensuring dependencies are logical. It follows steps called normal forms (1NF, 2NF, 3NF, etc.), each addressing specific redundancy and dependency issues for efficient storage and retrieval.",
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(height: 3.h),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 3.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10.0),
                      ],
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
                          child: Icon(
                            Icons.share_rounded,
                            color: Colors.black,
                          ),
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
