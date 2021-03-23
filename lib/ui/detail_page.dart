import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_comic/model/comic.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.comic);
  Comic comic;

  @override
  _DetailPageState createState() {
    return _DetailPageState(comic);
  }
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState(this.comic);
  Comic comic;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:18.0),
        child: ListView(children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                //color: Colors.green,
                  image:DecorationImage(
                    fit:BoxFit.fill,
                    image: NetworkImage(comic.images[0].getUrl()),
                  ),
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              height: 300,
              width: 200,
              child: Text(""),
            ),
          ],),
          SizedBox(height: 15,),
          Center(child: Text(comic.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.4),)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text(comic.pageCount.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                Text("PAGES", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
              ],),
              Column(children: [
                Text(comic.creators.available.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                Text("CREATORS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
              ],),
              Column(children: [
                Text(comic.characters.items.length.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                Text("CHARACTERS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
              ],),
            ],),
          SizedBox(height: 20,),
          RaisedButton(onPressed: (){}, child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Purchase Comic", style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1.4),),
          ), color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(height: 40,),
          Center(child: Text("About Comic", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1.4),)),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 10.0),
            child: Text("Creators", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 12.0),
            child: SizedBox(height: 0.45,child: Container(color: Colors.black,),),
          ),
          Column(
            children: List.generate(comic.creators.items.length, (index) =>
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 14.0),
                      child: Row(
                        children: [
                          Text(comic.creators.items[index].name+" ",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.2, wordSpacing: 1.4),),
                          Text(comic.creators.items[index].role.toUpperCase(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,),),
                        ],
                      ),
                    ),
                  ],
                )),),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 10.0),
            child: Text("Stories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 12.0),
            child: SizedBox(height: 0.45,child: Container(color: Colors.black,),),
          ),
          Column(
            children: List.generate(comic.stories.items.length, (index) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 14.0),
                        child: Text(comic.stories.items[index].name+" "+comic.stories.items[index].type,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ],
                )),),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 10.0),
            child: Text("Characters", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.4),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 12.0),
            child: SizedBox(height: 0.45,child: Container(color: Colors.black,),),
          ),
          Column(
            children: List.generate(comic.characters.items.length, (index) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 14.0),
                        child: Text(comic.characters.items[index].name,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ],
                )),),
          SizedBox(height: 30,),
          //Column(children: List.generate(comic.stories.items.length, (index) => Text(comic.stories.items[index].name+" "+comic.stories.items[index].type)),),
        ],),
      ),
    );
  }
}