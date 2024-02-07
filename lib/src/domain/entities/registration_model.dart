import 'dart:convert';

class RegistrationModel {
  final String namaLengkap;
  final String email;
  final String namaSekolah;
  final String kelas;
  final String gender;
  final String? foto;
  final String jenjang;

  RegistrationModel({
    required this.namaLengkap,
    required this.email,
    required this.namaSekolah,
    required this.kelas,
    required this.gender,
    this.foto,
    required this.jenjang,
  });

  RegistrationModel copyWith({
    String? namaLengkap,
    String? email,
    String? namaSekolah,
    String? kelas,
    String? gender,
    String? foto,
    String? jenjang,
  }) {
    return RegistrationModel(
      namaLengkap: namaLengkap ?? this.namaLengkap,
      email: email ?? this.email,
      namaSekolah: namaSekolah ?? this.namaSekolah,
      kelas: kelas ?? this.kelas,
      gender: gender ?? this.gender,
      foto: foto ?? this.foto,
      jenjang: jenjang ?? this.jenjang,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama_lengkap': namaLengkap,
      'email': email,
      'nama_sekolah': namaSekolah,
      'kelas': kelas,
      'gender': gender,
      'foto': foto,
      'jenjang': jenjang,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      namaLengkap: map['nama_lengkap'] ?? '',
      email: map['email'] ?? '',
      namaSekolah: map['nama_sekolah'] ?? '',
      kelas: map['kelas'] ?? '',
      gender: map['gender'] ?? '',
      foto: map['foto'] ?? '',
      jenjang: map['jenjang'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegistrationModel(namaLengkap: $namaLengkap, email: $email, namaSekolah: $namaSekolah, kelas: $kelas, gender: $gender, foto: $foto, jenjang: $jenjang)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegistrationModel &&
        other.namaLengkap == namaLengkap &&
        other.email == email &&
        other.namaSekolah == namaSekolah &&
        other.kelas == kelas &&
        other.gender == gender &&
        other.foto == foto &&
        other.jenjang == jenjang;
  }

  @override
  int get hashCode {
    return namaLengkap.hashCode ^
        email.hashCode ^
        namaSekolah.hashCode ^
        kelas.hashCode ^
        gender.hashCode ^
        foto.hashCode ^
        jenjang.hashCode;
  }
}
