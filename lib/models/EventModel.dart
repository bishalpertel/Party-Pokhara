class EventModel{
  String id, title, fee, description, tags, userId, imageLocation, location_lat, location_long, address;
  int start, end;
  bool isFeatured;
  EventModel(
      this.id,
      this.title,
      this.start,
      this.end,
      this.fee,
      this.description,
      this.tags,
      this.userId,
      this.imageLocation,
      this.location_lat,
      this.location_long,
      this.address,
      this.isFeatured);
}