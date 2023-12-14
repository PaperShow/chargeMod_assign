import 'dart:convert';

LocationResponse locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse data) =>
    json.encode(data.toJson());

class LocationResponse {
  final int? statusCode;
  final bool? feasibilityStatus;
  final String? message;
  final Data? data;

  LocationResponse({
    this.statusCode,
    this.feasibilityStatus,
    this.message,
    this.data,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
        statusCode: json["statusCode"],
        feasibilityStatus: json["feasibilityStatus"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "feasibilityStatus": feasibilityStatus,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Result>? result;
  final Pagination? pagination;

  Data({
    this.result,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  final int? totalRecord;
  final int? currentPage;
  final int? totalPages;
  final int? perPage;

  Pagination({
    this.totalRecord,
    this.currentPage,
    this.totalPages,
    this.perPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalRecord: json["totalRecord"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        perPage: json["perPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalRecord": totalRecord,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "perPage": perPage,
      };
}

class Result {
  final String? id;
  final int? locationId;
  final String? name;
  final String? parkingType;
  final String? email;
  final int? phone;
  final String? image;
  final GeoLocation? geoLocation;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? country;
  final String? zip;
  final String? status;
  final bool? isListed;
  final ConnectionDetails? connectionDetails;
  final OpeningHours? openingHours;
  final String? organizationId;
  final String? projectId;
  final List<ChargerDetail>? chargerDetails;
  final List<dynamic>? amenities;

  Result({
    this.id,
    this.locationId,
    this.name,
    this.parkingType,
    this.email,
    this.phone,
    this.image,
    this.geoLocation,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.status,
    this.isListed,
    this.connectionDetails,
    this.openingHours,
    this.organizationId,
    this.projectId,
    this.chargerDetails,
    this.amenities,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        locationId: json["locationId"],
        name: json["name"],
        parkingType: json["parkingType"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        geoLocation: json["geoLocation"] == null
            ? null
            : GeoLocation.fromJson(json["geoLocation"]),
        street1: json["street1"],
        street2: json["street2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zip: json["zip"],
        status: json["status"],
        isListed: json["isListed"],
        connectionDetails: json["connectionDetails"] == null
            ? null
            : ConnectionDetails.fromJson(json["connectionDetails"]),
        openingHours: json["openingHours"] == null
            ? null
            : OpeningHours.fromJson(json["openingHours"]),
        organizationId: json["organizationId"],
        projectId: json["projectId"],
        chargerDetails: json["chargerDetails"] == null
            ? []
            : List<ChargerDetail>.from(
                json["chargerDetails"]!.map((x) => ChargerDetail.fromJson(x))),
        amenities: json["amenities"] == null
            ? []
            : List<dynamic>.from(json["amenities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "locationId": locationId,
        "name": name,
        "parkingType": parkingType,
        "email": email,
        "phone": phone,
        "image": image,
        "geoLocation": geoLocation?.toJson(),
        "street1": street1,
        "street2": street2,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "status": status,
        "isListed": isListed,
        "connectionDetails": connectionDetails?.toJson(),
        "openingHours": openingHours?.toJson(),
        "organizationId": organizationId,
        "projectId": projectId,
        "chargerDetails": chargerDetails == null
            ? []
            : List<dynamic>.from(chargerDetails!.map((x) => x.toJson())),
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x)),
      };
}

class ChargerDetail {
  final String? id;
  final String? identity;
  final int? locationId;
  final String? chargerName;
  final String? chargePointOem;
  final String? chargePointDevice;
  final String? tarif;
  final String? chargePointConnectionProtocol;
  final List<String>? evse;
  final String? floorLevel;
  final bool? delStatus;
  final String? organizationId;
  final String? projectId;
  final String? stationType;
  final String? chargerType;
  final String? chargerId;
  final String? qrCode;
  final String? maintenanceStatus;
  final List<dynamic>? fields;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<EvsesDetail>? evsesDetails;
  final bool? chargerStatus;

  ChargerDetail({
    this.id,
    this.identity,
    this.locationId,
    this.chargerName,
    this.chargePointOem,
    this.chargePointDevice,
    this.tarif,
    this.chargePointConnectionProtocol,
    this.evse,
    this.floorLevel,
    this.delStatus,
    this.organizationId,
    this.projectId,
    this.stationType,
    this.chargerType,
    this.chargerId,
    this.qrCode,
    this.maintenanceStatus,
    this.fields,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.evsesDetails,
    this.chargerStatus,
  });

  factory ChargerDetail.fromJson(Map<String, dynamic> json) => ChargerDetail(
        id: json["_id"],
        identity: json["identity"],
        locationId: json["locationId"],
        chargerName: json["chargerName"],
        chargePointOem: json["chargePointOem"],
        chargePointDevice: json["chargePointDevice"],
        tarif: json["tarif"],
        chargePointConnectionProtocol: json["chargePointConnectionProtocol"],
        evse: json["evse"] == null
            ? []
            : List<String>.from(json["evse"]!.map((x) => x)),
        floorLevel: json["floorLevel"],
        delStatus: json["delStatus"],
        organizationId: json["organizationId"],
        projectId: json["projectId"],
        stationType: json["stationType"],
        chargerType: json["chargerType"],
        chargerId: json["chargerId"],
        qrCode: json["qrCode"],
        maintenanceStatus: json["maintenanceStatus"],
        fields: json["fields"] == null
            ? []
            : List<dynamic>.from(json["fields"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        evsesDetails: json["evsesDetails"] == null
            ? []
            : List<EvsesDetail>.from(
                json["evsesDetails"]!.map((x) => EvsesDetail.fromJson(x))),
        chargerStatus: json["chargerStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "identity": identity,
        "locationId": locationId,
        "chargerName": chargerName,
        "chargePointOem": chargePointOem,
        "chargePointDevice": chargePointDevice,
        "tarif": tarif,
        "chargePointConnectionProtocol": chargePointConnectionProtocol,
        "evse": evse == null ? [] : List<dynamic>.from(evse!.map((x) => x)),
        "floorLevel": floorLevel,
        "delStatus": delStatus,
        "organizationId": organizationId,
        "projectId": projectId,
        "stationType": stationType,
        "chargerType": chargerType,
        "chargerId": chargerId,
        "qrCode": qrCode,
        "maintenanceStatus": maintenanceStatus,
        "fields":
            fields == null ? [] : List<dynamic>.from(fields!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "evsesDetails": evsesDetails == null
            ? []
            : List<dynamic>.from(evsesDetails!.map((x) => x.toJson())),
        "chargerStatus": chargerStatus,
      };
}

class EvsesDetail {
  final String? id;
  final String? physicalReference;
  final String? uid;
  final int? maxOutputPower;
  final List<String>? capability;
  final String? status;
  final int? connectorId;
  final List<String>? connector;
  final String? organizationId;
  final String? projectId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? connectorStatus;
  final String? errorCode;
  final String? availability;
  final List<ConnectorDetail>? connectorDetails;

  EvsesDetail({
    this.id,
    this.physicalReference,
    this.uid,
    this.maxOutputPower,
    this.capability,
    this.status,
    this.connectorId,
    this.connector,
    this.organizationId,
    this.projectId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.connectorStatus,
    this.errorCode,
    this.availability,
    this.connectorDetails,
  });

  factory EvsesDetail.fromJson(Map<String, dynamic> json) => EvsesDetail(
        id: json["_id"],
        physicalReference: json["physicalReference"],
        uid: json["uid"],
        maxOutputPower: json["maxOutputPower"],
        capability: json["capability"] == null
            ? []
            : List<String>.from(json["capability"]!.map((x) => x)),
        status: json["status"],
        connectorId: json["connectorId"],
        connector: json["connector"] == null
            ? []
            : List<String>.from(json["connector"]!.map((x) => x)),
        organizationId: json["organizationId"],
        projectId: json["projectId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        connectorStatus: json["connectorStatus"],
        errorCode: json["errorCode"],
        availability: json["Availability"],
        connectorDetails: json["connectorDetails"] == null
            ? []
            : List<ConnectorDetail>.from(json["connectorDetails"]!
                .map((x) => ConnectorDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "physicalReference": physicalReference,
        "uid": uid,
        "maxOutputPower": maxOutputPower,
        "capability": capability == null
            ? []
            : List<dynamic>.from(capability!.map((x) => x)),
        "status": status,
        "connectorId": connectorId,
        "connector": connector == null
            ? []
            : List<dynamic>.from(connector!.map((x) => x)),
        "organizationId": organizationId,
        "projectId": projectId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "connectorStatus": connectorStatus,
        "errorCode": errorCode,
        "Availability": availability,
        "connectorDetails": connectorDetails == null
            ? []
            : List<dynamic>.from(connectorDetails!.map((x) => x.toJson())),
      };
}

class ConnectorDetail {
  final String? id;
  final String? name;
  final Standard? standard;
  final Format? format;
  final PowerType? powerType;
  final String? cmsId;
  final int? maxVoltage;
  final int? maxAmperage;
  final int? maxElectricPower;
  final String? termsConditionUrl;
  final String? connectorImage;
  final String? organizationId;
  final String? projectId;

  ConnectorDetail({
    this.id,
    this.name,
    this.standard,
    this.format,
    this.powerType,
    this.cmsId,
    this.maxVoltage,
    this.maxAmperage,
    this.maxElectricPower,
    this.termsConditionUrl,
    this.connectorImage,
    this.organizationId,
    this.projectId,
  });

  factory ConnectorDetail.fromJson(Map<String, dynamic> json) =>
      ConnectorDetail(
        id: json["_id"],
        name: json["name"],
        standard: json["standard"] == null
            ? null
            : Standard.fromJson(json["standard"]),
        format: json["format"] == null ? null : Format.fromJson(json["format"]),
        powerType: json["powerType"] == null
            ? null
            : PowerType.fromJson(json["powerType"]),
        cmsId: json["cmsId"],
        maxVoltage: json["maxVoltage"],
        maxAmperage: json["maxAmperage"],
        maxElectricPower: json["maxElectricPower"],
        termsConditionUrl: json["termsConditionUrl"],
        connectorImage: json["connectorImage"],
        organizationId: json["organizationId"],
        projectId: json["projectId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "standard": standard?.toJson(),
        "format": format?.toJson(),
        "powerType": powerType?.toJson(),
        "cmsId": cmsId,
        "maxVoltage": maxVoltage,
        "maxAmperage": maxAmperage,
        "maxElectricPower": maxElectricPower,
        "termsConditionUrl": termsConditionUrl,
        "connectorImage": connectorImage,
        "organizationId": organizationId,
        "projectId": projectId,
      };
}

class Format {
  final String? formatName;

  Format({
    this.formatName,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        formatName: json["formatName"],
      );

  Map<String, dynamic> toJson() => {
        "formatName": formatName,
      };
}

class PowerType {
  final String? powerType;

  PowerType({
    this.powerType,
  });

  factory PowerType.fromJson(Map<String, dynamic> json) => PowerType(
        powerType: json["powerType"],
      );

  Map<String, dynamic> toJson() => {
        "powerType": powerType,
      };
}

class Standard {
  final String? standardName;

  Standard({
    this.standardName,
  });

  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
        standardName: json["standardName"],
      );

  Map<String, dynamic> toJson() => {
        "standardName": standardName,
      };
}

class ConnectionDetails {
  final String? totalSanctionLoad;
  final String? accountNumber;
  final bool? isGreenEnergy;
  final EnergySource? energySource;
  final String? supplierType;
  final String? id;

  ConnectionDetails({
    this.totalSanctionLoad,
    this.accountNumber,
    this.isGreenEnergy,
    this.energySource,
    this.supplierType,
    this.id,
  });

  factory ConnectionDetails.fromJson(Map<String, dynamic> json) =>
      ConnectionDetails(
        totalSanctionLoad: json["totalSanctionLoad"],
        accountNumber: json["accountNumber"],
        isGreenEnergy: json["isGreenEnergy"],
        energySource: json["energySource"] == null
            ? null
            : EnergySource.fromJson(json["energySource"]),
        supplierType: json["supplierType"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "totalSanctionLoad": totalSanctionLoad,
        "accountNumber": accountNumber,
        "isGreenEnergy": isGreenEnergy,
        "energySource": energySource?.toJson(),
        "supplierType": supplierType,
        "_id": id,
      };
}

class EnergySource {
  final String? source;
  final int? percentage;

  EnergySource({
    this.source,
    this.percentage,
  });

  factory EnergySource.fromJson(Map<String, dynamic> json) => EnergySource(
        source: json["source"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "percentage": percentage,
      };
}

class GeoLocation {
  final String? type;
  final List<double>? coordinates;

  GeoLocation({
    this.type,
    this.coordinates,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

class OpeningHours {
  final bool? isTwentyFourHours;
  final List<dynamic>? regularHours;
  final String? id;

  OpeningHours({
    this.isTwentyFourHours,
    this.regularHours,
    this.id,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        isTwentyFourHours: json["isTwentyFourHours"],
        regularHours: json["regularHours"] == null
            ? []
            : List<dynamic>.from(json["regularHours"]!.map((x) => x)),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "isTwentyFourHours": isTwentyFourHours,
        "regularHours": regularHours == null
            ? []
            : List<dynamic>.from(regularHours!.map((x) => x)),
        "_id": id,
      };
}
