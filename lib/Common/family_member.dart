class FamilyMember {
  String? name;
  String? age;
  String? occupation;
  String? contact;

  FamilyMember({
    this.name,
    this.age,
    this.occupation,
    this.contact,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => new FamilyMember(
    name: json["name"],
    age: json["age"],
    occupation: json["occupation"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "occupation": occupation,
    "contact": contact,
  };
}