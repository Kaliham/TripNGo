class Trip {
  String title;
  String imageUrl;
  String date;
  String time;
  String phoneNumber;
  String groupID;
  String groupName;
  bool active;
  double budget;
  String location;
  String link;
  List<Item> items;
  Trip({
    this.title,
    this.active,
    this.budget,
    this.date,
    this.groupID,
    this.time,
    this.groupName,
    this.imageUrl,
    this.link,
    this.location,
    this.phoneNumber,
    this.items,
  });
}

class Offer {
  String offerId;
  String title;
  String description;
  String imageUrl;
  String callNumber;
  int avaibleQuantity;
  String date;
  String time;
  bool active;
  double price;
  Offer({
    this.offerId,
    this.title,
    this.description,
    this.imageUrl,
    this.callNumber,
    this.avaibleQuantity,
    this.date,
    this.time,
    this.active,
    this.price,
  });
}

class Item {
  String title;
  String imageUrl;
  String assignedTo;
  String price;
  int tripId;
}
