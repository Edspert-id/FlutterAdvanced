class ExerciseResponse {
  int? status;
  String? message;
  List<ExerciseDataModel>? data;

  ExerciseResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ExerciseResponse.fromJson(Map<String, dynamic> json) =>
      ExerciseResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ExerciseDataModel>.from(
                json["data"]!.map((x) => ExerciseDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ExerciseDataModel {
  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  String? jumlahSoal;
  int? jumlahDone;

  ExerciseDataModel({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  factory ExerciseDataModel.fromJson(Map<String, dynamic> json) =>
      ExerciseDataModel(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
      };
}
