class Trip {
  String title;
  String imageUrl;
  String date;
  String time;
  String phoneNumber;
  int groupID;
  String groupName;
  bool active;
  double budget;
  String location;
  String link;
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
    this.title,
    this.active,
    this.avaibleQuantity,
    this.callNumber,
    this.date,
    this.time,
    this.description,
    this.imageUrl,
    this.offerId,
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
