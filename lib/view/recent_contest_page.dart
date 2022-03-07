import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentContestPage extends StatefulWidget {
  const RecentContestPage({Key? key}) : super(key: key);

  @override
  State<RecentContestPage> createState() => _RecentContestPageState();
}

class _RecentContestPageState extends State<RecentContestPage> {
  List recentList = [];
  List detailList = [];

  _readJsonData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/recent.json')
        .then((response) {
      setState(() {
        recentList = json.decode(response);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString('json/detail.json')
        .then((response) {
      setState(() {
        detailList = json.decode(response);
      });
    });
  }

  @override
  void initState() {
    _readJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        backgroundColor: Colors.teal,
        title: Text(
          'Recent Contest',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //list
                  for (int i = 0; i < recentList.length; i++)
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      height: 220,
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/detail/', arguments: {
                          'info': recentList[i],
                          'detail': detailList[i],
                        }),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          height: 220,
                          width: MediaQuery.of(context).size.width - 20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: i.isEven
                                  ? Color(0xFF69c5df)
                                  : Color(0xFF9294cc)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      detailList[i]['title'],
                                      style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: width,
                                child: Text(
                                  detailList[i]['text'],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16, color: Color(0xFFb8eefc)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 1.0,
                              ),
                              Row(children: [
                                for (int i = 0; i < 4; i++)
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                recentList[i]['img']),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
