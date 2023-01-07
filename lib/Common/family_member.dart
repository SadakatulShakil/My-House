class FamilyMember {
  bool? isBangladeshi;
  String? name;
  String? age;
  String? nid;
  String? passport;
  String? religion;
  String? occupation;
  String? contact;

  FamilyMember({
    this.isBangladeshi,
    this.name,
    this.age,
    this.nid,
    this.passport,
    this.religion,
    this.occupation,
    this.contact,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => new FamilyMember(
    isBangladeshi: json["isBangladesi"],
    name: json["name"],
    age: json["age"],
    nid: json["nid"],
    passport: json["passport"],
    religion: json["religion"],
    occupation: json["occupation"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "isBangladesi": isBangladeshi,
    "name": name,
    "age": age,
    "nid": nid,
    "passport": passport,
    "religion": religion,
    "occupation": occupation,
    "contact": contact,
  };
}