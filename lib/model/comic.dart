class Comic{
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  var textObjects;
  String resourceURI;
  List<Urls> urls;
  Series series;
  List<Collections> collections;
  List<Dates> dates;
  double price;
  Thumbnail thumbnail;
  List<Thumbnail> images;
  Creators creators;
  Characters characters;
  Stories stories;
  Events events;
  Comic(this.id,this.digitalId,this.title,this.issueNumber,this.variantDescription,this.description,
        this.modified,this.isbn,this.upc,this.diamondCode,this.ean,this.issn,this.format,this.pageCount,
        this.resourceURI,this.urls,this.series,this.collections,this.dates,this.price,this.thumbnail,
        this.images,this.creators,this.characters,this.stories,this.events);
}

class Urls{
  String type;
  String url;
  Urls(this.url, this.type);
}

class Series{
  String resourceURI;
  String name;
  Series(this.resourceURI, this.name);
}

class Collections{
  String resourceURI;
  String name;
  Collections(this.name,this.resourceURI);
}

class Dates{
  String type;
  String date;
  Dates(this.type, this.date);
}

class Thumbnail{
  String path;
  String extension;
  Thumbnail(this.path,this.extension);

  getUrl(){
    return path+"."+extension;
  }
}

class Creators{
  int available;
  String collectionURI;
  List<CreatorsItem> items;
  Creators(this.available,this.collectionURI,this.items);
}
class CreatorsItem{
  String resourceURI;
  String name;
  String role;
  CreatorsItem(this.resourceURI,this.name,this.role);
}

class Item{
  var resourceURI;
  String name;
  Item(this.resourceURI,this.name);
}

class Characters{
  int available;
  String collectionURI;
  List<Item> items;
  Characters(this.available,this.collectionURI,this.items);
}

class Stories{
  int available;
  String collectionURI;
  List<StoryItem> items;
  Stories(this.available, this.collectionURI, this.items);
}

class StoryItem{
  String resourceURI;
  String name;
  String type;
  StoryItem(this.resourceURI,this.name,this.type);
}

class Events{
  int available;
  String collectionURI;
  List<Item> items;
  Events(this.available, this.collectionURI, this.items);
}
