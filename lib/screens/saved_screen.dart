import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/widget_support.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            "Saved Content",
            style: AppWidget.headlineTextFieldStyle(),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h, left: 20.0),
            child: Column(
              children: [
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
                                  "DBMS",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
