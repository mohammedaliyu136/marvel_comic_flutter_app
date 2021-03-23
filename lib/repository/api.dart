import 'dart:convert';

import './../model/comic.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Repository{
  //var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
  //1010338
  Future<List<Comic>> fetchComics() async {
    final response = await http.get('https://gateway.marvel.com:443/v1/public/comics?titleStartsWith=captain%20marvel&orderBy=onsaleDate&apikey=c8b9d510651457fe9bdf967c5f236e05&ts=1&hash=f9043b2d99e5040d2c3423800acb2d1e');
    var url = Uri.https(
        'gateway.marvel.com:443','/v1/public/comics',
        {
          'titleStartsWith': 'captain%20marvel',
          'orderBy': 'onsaleDate',
          'apikey': 'c8b9d510651457fe9bdf967c5f236e05',
          'ts': '1',
          'hash': 'f9043b2d99e5040d2c3423800acb2d1e',
        });
    //final response = await http.get(url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      //print(json.decode(response.body) as List);
      //var res = (json.decode(response.body) as List);
      var res = json.decode(response.body);
      print(res["copyright"]);
      print(res["data"]["results"].length);


      List<Comic> comics = jsonOBJ(res);

      //Comic(result_1["id"]);

      print("------------------------------");
      print("------------------------------");
      print(response.statusCode);
      print(response.body);
      print(comics.length);
      return comics;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load restaurants');
    }
  }
  Future<List<Comic>> fetchComicsISSUES() async {
    final response = await http.get('https://gateway.marvel.com:443/v1/public/comics?characters=1010338&apikey=c8b9d510651457fe9bdf967c5f236e05&ts=1&hash=f9043b2d99e5040d2c3423800acb2d1e');
    print(response.statusCode);
    //final response = await http.get(url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      //print(json.decode(response.body) as List);
      //var res = (json.decode(response.body) as List);
      print(response.body);
      var res = json.decode(response.body);
      print(res);
      print(res["data"]["results"].length);

      List<Comic> comics = jsonOBJ(res);

      //Comic(result_1["id"]);

      print("------------------------------");
      print("------------------------------");
      print(response.statusCode);
      print(response.body);
      print(comics.length);
      return comics;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load restaurants');
    }
  }

  List<Comic> jsonOBJ(res) {
    List<Comic> comics = [];

    for( var count = 0 ; count < res["data"]["results"].length; count++ ){
      List<Urls> urls = [];
      print("urls");
      for( var i = 0 ; i < res["data"]["results"][count]["urls"].length; i++ ){
        urls.add(Urls(res["data"]["results"][count]["urls"][i]["url"], res["data"]["results"][count]["urls"][i]["type"]));
      }

      List<Collections> collections = [];
      for( var i = 0 ; i < res["data"]["results"][count]["collections"].length; i++ ){
        collections.add(Collections(res["data"]["results"][count]["collections"][i]["name"], res["data"]["results"][count]["collections"][i]["resourceURI"]));
      }

      //List<Dates>
      List<Dates> dates = [];
      for( var i = 0 ; i < res["data"]["results"][count]["dates"].length; i++ ){
        dates.add(Dates(res["data"]["results"][count]["dates"][i]["type"], res["data"]["results"][count]["dates"][i]["date"]));
      }

      Thumbnail thumbnail = Thumbnail(res["data"]["results"][count]["thumbnail"]["path"],res["data"]["results"][count]["thumbnail"]["extension"]);

      List<Thumbnail> images = [];
      for( var i = 0 ; i < res["data"]["results"][count]["images"].length; i++ ){
        images.add(Thumbnail(res["data"]["results"][count]["images"][i]["path"],res["data"]["results"][count]["images"][i]["extension"]));
      }

      //CreatorsItem(this.resourceURI,this.name,this.role)
      List<CreatorsItem> creatorsItem = [];
      for( var i = 0 ; i < res["data"]["results"][count]["creators"]["items"].length; i++ ){
        creatorsItem.add(
            CreatorsItem(
                res["data"]["results"][count]["creators"]["items"][i]["resourceURI"],
                res["data"]["results"][count]["creators"]["items"][i]["name"],
                res["data"]["results"][count]["creators"]["items"][i]["role"]
            ));
      }
      Creators creators = Creators(res["data"]["results"][count]["creators"]["available"],res["data"]["results"][count]["creators"]["collectionURI"],creatorsItem);

      List<Item> items = [];
      for( var i = 0 ; i < res["data"]["results"][count]["characters"]["items"].length; i++ ){
        print("^^^^^^^");
        print(res["data"]["results"][count]["characters"]["items"][i]["name"]);
        items.add(Item(res["data"]["results"][count]["characters"]["items"][i]["resourceURI"],
            res["data"]["results"][count]["characters"]["items"][i]["name"]));
      }
      Characters characters = Characters(res["data"]["results"][count]["characters"]["available"],res["data"]["results"][count]["characters"]["collectionURI"],items);

      List<StoryItem> storyItem = [];
      for( var i = 0 ; i < res["data"]["results"][count]["stories"]["items"].length; i++ ){
        storyItem.add(StoryItem(
            res["data"]["results"][count]["stories"]["items"][i]["resourceURI"],
            res["data"]["results"][count]["stories"]["items"][i]["name"],
            res["data"]["results"][count]["stories"]["items"][i]["type"]
        ));
      }
      Stories stories = Stories(res["data"]["results"][count]["stories"]["available"],res["data"]["results"][count]["stories"]["collectionURI"],storyItem);

      items = [];
      for( var i = 0 ; i < res["data"]["results"][count]["events"]["items"].length; i++ ){
        items.add(Item(res["data"]["results"][count]["events"]["items"]["resourceURI"],res["data"]["results"][count]["events"]["items"]["name"]));
      }
      Events events = Events(res["data"]["results"][count]["events"]["available"],res["data"]["results"][count]["events"]["collectionURI"],items);

      Series series = Series(res["data"]["results"][count]["series"]["resourceURI"], res["data"]["results"][count]["series"]["name"]);



      //Collections(this.name,this.resourceURI);
      var d = res["data"]["results"][count];

      Comic comic = Comic(
          d["id"],d["digitalId"],d["title"],d["issueNumber"],d["variantDescription"],
          d["description"],d["modified"],d["isbn"],d["upc"],d["diamondCode"],d["ean"],d["issn"],
          d["format"],d["pageCount"],d["resourceURI"],urls,series,collections,
          dates,d["price"],thumbnail,images,creators,characters,stories,events);

      print(comic);
      comics.add(comic);
    }
    return comics;
  }
}