class CareTaker {
  String? name;
  String? nid;
  String? age;
  String? religion;
  String? area;
  String? contact;

  CareTaker({
    this.name,
    this.nid,
    this.age,
    this.religion,
    this.area,
    this.contact,
  });

  factory CareTaker.fromJson(Map<String, dynamic> json) => new CareTaker(
    name: json["name"],
    nid: json["nid"],
    age: json["age"],
    religion: json["religion"],
    area: json["area"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nid": nid,
    "age": age,
    "religion": religion,
    "area": area,
    "contact": contact,
  };
}