import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:union_hardware_app/constants.dart';
import 'package:union_hardware_app/widgets/bottom_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabsPageController;
  int _tabSelected = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (number){
                  setState(() {
                    _tabSelected = number;
                  });
              },
              children: [
                Container(
                  child: Center(
                    child: Text("Home page"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Search page"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Saved page"),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomTabs(
            selectedTab: _tabSelected,
            tabClicked: (page){
              setState(() {
                _tabsPageController.animateToPage(page,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              });
            },
          ),
        ],
      ),
    );
  }
}
