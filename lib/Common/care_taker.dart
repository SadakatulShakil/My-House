class CareTaker {
  String? name;
  String? nid;
  String? area;
  String? contact;

  CareTaker({
    this.name,
    this.nid,
    this.area,
    this.contact,
  });

  factory CareTaker.fromJson(Map<String, dynamic> json) => new CareTaker(
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