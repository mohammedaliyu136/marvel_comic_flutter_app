import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'comics_page.dart';
import 'comics_issues_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin {
  TabController tabController;
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(tabController.index);
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _showAppbar ? 56.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: AppBar(
                leading: Icon(Icons.menu),
                title: Image.asset("assets/images/marvel_logo.png"),
                centerTitle: true,
                actions: [
                  Icon(FontAwesomeIcons.search,),
                  SizedBox(width: 10,),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: _selectedIndex==0?Column(children: [
                  Image.asset("assets/images/img.png", height: 340, fit: BoxFit.cover,),
                  Center(
                    child: CustomPaint(
                      painter: Chevron(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CAROL DANVERS", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.4)),
                              SizedBox(height: 5,),
                              Text("CAPTAIN MARVEL", style: TextStyle(fontSize: 26.0, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.4)),
                              SizedBox(height: 20,),
                              Text("Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
                                  style: TextStyle(fontSize: 15.0, color: Colors.white, letterSpacing: 1.4, wordSpacing: 1.2)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Text("Follow", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black38, letterSpacing: 1.2),),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.facebookSquare, color: Colors.black38),
                          SizedBox(width: 20,),
                          FaIcon(FontAwesomeIcons.twitter, color: Colors.black38),
                        ],),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 1,child: Container(color: Color.fromRGBO(229,229,229, 1),),),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 300,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 10,),
                          Text("ADVERTISEMENT", style: TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 1.4),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("LATEST NEWS", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1.4),)
                        ],),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("LATEST VIDEOS", style: TextStyle(fontSize: 26, color: Color.fromRGBO(32,32,32, 1), fontWeight: FontWeight.w800),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 180,
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(Icons.play_arrow, color: Colors.red, size: 30,),
                                      ), color: Colors.white,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("EARTH'S MIGHTIEST SHOW / S3 E59",
                            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w800, letterSpacing: 1.4),),
                          SizedBox(height: 8,),
                          Text("Captain Marvel's Looks:\nComics vs. MCU",
                            style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800, letterSpacing: 1.4),),
                          SizedBox(height: 16,),
                          Text("See Captain Marvel's looks shine from the comics to the screen!",
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400, letterSpacing: 1.4),),
                        ],),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80,),
                        Image.asset("assets/images/image_footer.jpg", width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
                        SizedBox(height: 20,),
                        Center(child:
                        Text("MARVEL HQ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold, letterSpacing: 1.4),)),
                        SizedBox(height: 15,),
                        Center(child:
                        Text("Play games and read",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold, letterSpacing: 1.4),)),
                        Center(child:
                        Text("comics on MarvelHQ.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold, letterSpacing: 1.4),)),
                        SizedBox(height: 25,),
                        Center(
                          child: RaisedButton(onPressed: (){}, child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("CHECK IT OUT",style: TextStyle(letterSpacing: 1.4),),
                          ),color: Colors.red,textColor: Colors.white,),
                        ),
                        SizedBox(height: 35,),
                        Center(child: Image.asset("assets/images/m.png", width: 40,)),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("ABOUT MARVEL", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("HELP/FAQS", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("CAREERS", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("INTERNSHIPS", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                                    ),
                                  ],),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("ADVERTISING", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400, letterSpacing: 1.2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("MARVELHQ.COM", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400, letterSpacing: 1.2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("REDEEM DIGITAL COMICS", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400, letterSpacing: 1.2),),
                                    ),
                                  ],),
                              ),
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 18),
                          child: SizedBox(height: 0.5,child: Container(color: Colors.grey,),),
                        ),
                        SizedBox(height: 20,),
                        ListTile(
                          leading: Container(
                            height: 200, width: 100,
                            decoration: BoxDecoration(
                              //color: Colors.green,
                                image:DecorationImage(
                                  fit:BoxFit.fitWidth,
                                  image: AssetImage("assets/images/marvel_insider.png"),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          title: Text("MARVEL INSIDER", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                          subtitle: Text("Get Rewarded for being a Marvel Fan", style: TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 1.2),),
                        ),
                        SizedBox(height: 30,),
                        ListTile(
                          leading: Container(height: 200, width: 100,
                            decoration: BoxDecoration(
                              //color: Colors.green,
                                image:DecorationImage(
                                  fit:BoxFit.fill,
                                  image: AssetImage("assets/images/captain-america-shield.jpg"),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          title: Text("MARVEL MASTERCARD®", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                          subtitle: Text("6 Card Designs-Unlimited Cashback", style: TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 1.2),),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 18),
                          child: SizedBox(height: 0.5,child: Container(color: Color.fromRGBO(229, 229, 229, 1),),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:40.0,left: 20, right: 20),
                          child: Text("FOLLOW MARVEL", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.2),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FaIcon(FontAwesomeIcons.facebookSquare, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.twitter, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.instagramSquare, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.tumblr, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.youtube, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.snapchatGhost, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                              FaIcon(FontAwesomeIcons.pinterest, color: Color.fromRGBO(153,153,153, 1), size: 20,),
                            ],),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 18),
                          child: SizedBox(height: 0.5,child: Container(color: Color.fromRGBO(229, 229, 229, 1),),),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Term of Use", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), fontSize: 12, letterSpacing: 1.2),), SizedBox(width: 20,),
                              Text("Privacy Policy", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), fontSize: 12, letterSpacing: 1.2),)
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(child: Text("Your California Privacy Rights", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(child: Text("Do Not Sell My Info ", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(child: Text("Children's Online Privacy Policy", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("License Agreement", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),), SizedBox(width: 20,),
                              Text("Interest-Based Ads", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),)
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Marvel Insider Terms", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),), SizedBox(width: 20,),
                              Text("© 2021 MARVEL", style: TextStyle(color: Color.fromRGBO(153,153,153, 1), letterSpacing: 1.2, fontSize: 12),)
                            ],),
                        ),
                        SizedBox(height: 60,),
                      ],),
                  ),
                ],):_selectedIndex==1?ComicScreen2():ComicsISSUES(),

              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Material(
          color: Colors.white,
          elevation: 10,
          child: BottomAppBar(
            notchMargin: 8,
            shape: CircularNotchedRectangle(),
            color: Color.fromRGBO(21,21,21, 1),

            child: TabBar(
              onTap: (index){
                _onItemTapped(index);
              },
              tabs: [
                Tab(
                    text: 'OVERVIEW',),
                Tab(
                  text: 'COMICS',
                ),
                Tab(
                  text: 'COMICS ISSUES',
                )
              ],
              labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Theme.of(context).primaryColor,
              controller: tabController,
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.5),
                borderSide:
                BorderSide(color: Color.fromRGBO(230,36,41, 1), width: 3),
              ),
            ),
          ),
        ),
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color.fromRGBO(32,32,32, 1),
      selectedLabelStyle: TextStyle(fontSize: 12),
      selectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(fontSize: 10.0),
      unselectedItemColor: Color.fromRGBO(153,153,153,1),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 0,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, ),
          label: 'OVERVIEW',
          backgroundColor: Colors.grey
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined,),
          label: 'IN COMICS PROFILE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline,),
          label: 'IN COMICS FULL REPORT',
        ),
      ],
    ),*/
    );
  }
}

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.orangeAccent, Colors.yellow],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()..color=Color.fromRGBO(21,21,21, 1);
      //..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    //path.lineTo(size.width / 2, size.height - size.height / 3);
    path.lineTo(size.width, size.height - size.height / 8);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}