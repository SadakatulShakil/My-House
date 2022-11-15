class HouseKeeper {
  String? name;
  String? nid;
  String? area;
  String? contact;

  HouseKeeper({
    this.name,
    this.nid,
    this.area,
    this.contact,
  });

  factory HouseKeeper.fromJson(Map<String, dynamic> json) => new HouseKeeper(
    name: json["name"],
    nid: json["nid"],
    area: json["area"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nid": nid,
    "area": area,
    "contact": contact,
  };
}