class FlatInformation {
  String? flatName;
  String? renterReferalCode;
  String? contact;

  FlatInformation({
    this.flatName,
    this.renterReferalCode,
    this.contact,
  });

  factory FlatInformation.fromJson(Map<String, dynamic> json) => new FlatInformation(
    flatName: json["flatName"],
    renterReferalCode: json["renterReferalCode"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "flatName": flatName,
    "renterReferalCode": renterReferalCode,
    "contact": contact,
  };
}