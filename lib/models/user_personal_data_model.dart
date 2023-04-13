
import 'dart:convert';

//UserPersonalDataModel UserPersonalDataModelFromJson(String str) => UserPersonalDataModel.fromJson(json.decode(str));

List<UserPersonalDataModel> userPersonalDataModelFromJson(String str) =>     List<UserPersonalDataModel>.from(json.decode(str).map((x) => UserPersonalDataModel.fromJson(x)));

String userPersonalDataModelToJson(UserPersonalDataModel data) => json.encode(data.toJson());

class UserPersonalDataModel {
  UserPersonalDataModel({
    required this.id,
    required this.fullName,
    required this.cpf,
    required this.rg,
    required this.coren,
    required this.crm,
    required this.birthdate,
    required this.sex,
    required this.nationality,
    required this.bloodType,
    required this.sicks,
    required this.vehicles,
  });

  int id;
  String fullName;
  String cpf;
  String rg;
  String coren;
  String crm;
  String birthdate;
  String sex;
  String nationality;
  String bloodType;
  List<Sick> sicks;
  List<Vehicle> vehicles;

  factory UserPersonalDataModel.fromJson(Map<String, dynamic> json) => UserPersonalDataModel(
    id: json["id"],
    fullName: json["fullName"],
    cpf: json["cpf"],
    rg: json["rg"],
    coren: json["coren"],
    crm: json["crm"],
    birthdate: json["birthdate"],
    sex: json["sex"],
    nationality: json["nationality"],
    bloodType: json["bloodType"],
    sicks: List<Sick>.from(json["sicks"].map((x) => Sick.fromJson(x))),
    vehicles: List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "cpf": cpf,
    "rg": rg,
    "coren": coren,
    "crm": crm,
    "birthdate": birthdate,
    "sex": sex,
    "nationality": nationality,
    "bloodType": bloodType,
    "sicks": List<dynamic>.from(sicks.map((x) => x.toJson())),
    "vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
  };
}

class Sick {
  Sick({
    required this.id,
    required this.name,
    required this.type,
    required this.obs,
  });

  int id;
  String name;
  String type;
  String obs;

  factory Sick.fromJson(Map<String, dynamic> json) => Sick(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    obs: json["obs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "obs": obs,
  };
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.year,
    required this.color,
    required this.plate,
  });

  int id;
  String manufacturer;
  String model;
  String year;
  String color;
  String plate;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    manufacturer: json["manufacturer"],
    model: json["model"],
    year: json["year"],
    color: json["color"],
    plate: json["plate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "manufacturer": manufacturer,
    "model": model,
    "year": year,
    "color": color,
    "plate": plate,
  };
}
