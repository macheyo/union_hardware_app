import 'package:flutter/material.dart';

class CustomBottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabClicked;
  const CustomBottomTabs({Key key, this.selectedTab, this.tabClicked}) : super(key: key);
  @override
  _CustomBottomTabsState createState() => _CustomBottomTabsState();
}

class _CustomBottomTabsState extends State<CustomBottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab??0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.0,
              blurRadius: 30,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavigationButton(
            imagePath: "assets/images/tab_home.png",
            selected: _selectedTab==0?true:false,
            onPressed: (){
              widget.tabClicked(0);

            },
          ),
          BottomNavigationButton(
            imagePath: "assets/images/tab_search.png",
            selected: _selectedTab==1?true:false,
            onPressed: (){
              widget.tabClicked(1);

            },
          ),
          BottomNavigationButton(
            imagePath: "assets/images/tab_saved.png",
            selected: _selectedTab==2?true:false,
            onPressed: (){
              widget.tabClicked(2);

            },
          ),
          BottomNavigationButton(
            imagePath: "assets/images/tab_logout.png",
            selected: _selectedTab==3?true:false,
            onPressed: (){
              widget.tabClicked(3);

            },
          )
        ],
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  const BottomNavigationButton({Key key, this.imagePath, this.selected, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: _selected
                        ? Theme.of(context).accentColor
                        : Colors.transparent,
                    width: 2))),
        child: Image(
          image: AssetImage(imagePath ?? "assets/images/tab_home.png"),
          width: 22,
          height: 22,
          color: _selected?Theme.of(context).accentColor:Colors.black,
        ),
      ),
    );
  }
}
