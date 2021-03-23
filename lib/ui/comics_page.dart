import 'package:flutter/material.dart';
import 'package:marvel_comic/model/comic.dart';
import 'package:marvel_comic/repository/api.dart';

import 'detail_page.dart';

class ComicScreen2 extends StatefulWidget {
  ComicScreen2({Key key}) : super(key: key);

  @override
  _ComicScreen2State createState() {
    return _ComicScreen2State();
  }
}

class _ComicScreen2State extends State<ComicScreen2> {
  List<Comic> comics = [];
  bool loading = false;
  @override
  void initState() {
    getComics();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getComics()async{
    setState(() {
      loading=true;
    });
    await Repository().fetchComics().then(
            (value){
          setState(() {
            comics=value;
          });
        });
    setState(() {
      loading=false;
    });
    //return comics;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final theme = Theme.of(context);
    return loading?Container(
      height: MediaQuery.of(context).size.height-150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [Text("Loading...", style: theme.textTheme.headline5,)],
      ),
    ):
    ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.  MediaQuery.of(context).size.width/200
            crossAxisCount: (MediaQuery.of(context).size.width/200).ceil(),
            childAspectRatio: 0.74,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(comics.length, (index) {
              return Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(comics[index])),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                //color: Colors.green,
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              height: 180,
                              width: 140,
                              child: Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                //color: Colors.green,
                                  image:DecorationImage(
                                    fit:BoxFit.fill,
                                    image: NetworkImage(comics[index].thumbnail.getUrl()),
                                  ),
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              height: 180,
                              width: 140,
                              child: Text(""),
                            ),
                          ],
                        ),
                      ),
                      Text(comics[index].title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),),
                      SizedBox(height: 2,),
                      //Text(DateTime.parse(comics[index].dates[0].date).day.toString()+"/"+
                      //   DateTime.parse(comics[index].dates[0].date).month.toString()+"/"+
                      //   DateTime.parse(comics[index].dates[0].date).year.toString(),
                      // style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),),
                      Text(DateTime.parse(comics[index].dates[0].date).year.toString(),style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 11),),
                    ],
                  ),
                ),
              );
            }))
      ],);
    /*
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:18.0, vertical: 8),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.  MediaQuery.of(context).size.width/200
          crossAxisCount: (MediaQuery.of(context).size.width/200).ceil(),
          childAspectRatio: 0.74,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(comics.length, (index) {
            print(DateTime.parse(comics[index].dates[0].date).day.toString()+"/"+DateTime.parse(comics[index].dates[0].date).month.toString()+"/"+DateTime.parse(comics[index].dates[0].date).year.toString());
            return Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage2(comics[index])),
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.green,
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            height: 180,
                            width: 140,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.green,
                                image:DecorationImage(
                                  fit:BoxFit.fill,
                                  image: NetworkImage(comics[index].thumbnail.getUrl()),
                                ),
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            height: 180,
                            width: 140,
                            child: Text(""),
                          ),
                        ],
                      ),
                    ),
                    Text(comics[index].title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),),
                    SizedBox(height: 2,),
                    //Text(DateTime.parse(comics[index].dates[0].date).day.toString()+"/"+
                      //   DateTime.parse(comics[index].dates[0].date).month.toString()+"/"+
                      //   DateTime.parse(comics[index].dates[0].date).year.toString(),
                      // style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),),
                    Text(DateTime.parse(comics[index].dates[0].date).year.toString(),style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 11),),
                  ],
                ),
              ),
            );
          })
        ),
      ),
    );
    */
  }
}