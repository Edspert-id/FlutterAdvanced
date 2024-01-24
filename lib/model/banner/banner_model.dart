class BannerResponse {
  final int? status;
  final String? message;
  final List<BannerModel>? data;

  BannerResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BannerModel>.from(
                json["data"]!.map((x) => BannerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BannerModel {
  final String? eventId;
  final String? eventTitle;
  final String? eventDescription;
  final String? eventImage;
  final String? eventUrl;

  BannerModel({
    this.eventId,
    this.eventTitle,
    this.eventDescription,
    this.eventImage,
    this.eventUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        eventId: json["event_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        eventImage: json["event_image"],
        eventUrl: json["event_url"],
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "event_title": eventTitle,
        "event_description": eventDescription,
        "event_image": eventImage,
        "event_url": eventUrl,
      };
}
