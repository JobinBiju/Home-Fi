import 'dart:convert';

class AdafruitGET {
  AdafruitGET({
    this.username,
    this.owner,
    this.id,
    this.name,
    this.description,
    this.license,
    this.history,
    this.enabled,
    this.visibility,
    this.unitType,
    this.unitSymbol,
    this.lastValue,
    this.createdAt,
    this.updatedAt,
    this.statusNotify,
    this.statusTimeout,
    this.status,
    this.key,
    this.writable,
    this.group,
    this.groups,
    this.feedWebhookReceivers,
    this.feedStatusChanges,
  });

  String? username;
  Owner? owner;
  int? id;
  String? name;
  String? description;
  dynamic license;
  bool? history;
  bool? enabled;
  String? visibility;
  dynamic unitType;
  dynamic unitSymbol;
  String? lastValue;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? statusNotify;
  int? statusTimeout;
  String? status;
  String? key;
  bool? writable;
  Group? group;
  List<Group>? groups;
  List<dynamic>? feedWebhookReceivers;
  List<dynamic>? feedStatusChanges;

  factory AdafruitGET.fromRawJson(String str) =>
      AdafruitGET.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory AdafruitGET.fromJson(Map<String?, dynamic> json) => AdafruitGET(
        username: json["username"],
        owner: Owner.fromJson(json["owner"]),
        id: json["id"],
        name: json["name"],
        description: json["description"],
        license: json["license"],
        history: json["history"],
        enabled: json["enabled"],
        visibility: json["visibility"],
        unitType: json["unit_type"],
        unitSymbol: json["unit_symbol"],
        lastValue: json["last_value"],
        createdAt: DateTime?.parse(json["created_at"]),
        updatedAt: DateTime?.parse(json["updated_at"]),
        statusNotify: json["status_notify"],
        statusTimeout: json["status_timeout"],
        status: json["status"],
        key: json["key"],
        writable: json["writable"],
        group: Group.fromJson(json["group"]),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        feedWebhookReceivers:
            List<dynamic>.from(json["feed_webhook_receivers"].map((x) => x)),
        feedStatusChanges:
            List<dynamic>.from(json["feed_status_changes"].map((x) => x)),
      );

  Map<String?, dynamic> toJson() => {
        "username": username,
        "owner": owner?.toJson(),
        "id": id,
        "name": name,
        "description": description,
        "license": license,
        "history": history,
        "enabled": enabled,
        "visibility": visibility,
        "unit_type": unitType,
        "unit_symbol": unitSymbol,
        "last_value": lastValue,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status_notify": statusNotify,
        "status_timeout": statusTimeout,
        "status": status,
        "key": key,
        "writable": writable,
        "group": group?.toJson(),
        "groups": List<dynamic>.from(groups!.map((x) => x.toJson())),
        "feed_webhook_receivers":
            List<dynamic>.from(feedWebhookReceivers!.map((x) => x)),
        "feed_status_changes":
            List<dynamic>.from(feedStatusChanges!.map((x) => x)),
      };
}

class Group {
  Group({
    this.id,
    this.key,
    this.name,
    this.userId,
  });

  int? id;
  String? key;
  String? name;
  int? userId;

  factory Group.fromRawJson(String str) => Group.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "user_id": userId,
      };
}

class Owner {
  Owner({
    this.id,
    this.username,
  });

  int? id;
  String? username;

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}
