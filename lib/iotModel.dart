import 'dart:convert';

class IoT {
    String quatPhongNgu2;
    String denPhongKhach;
    String quatPhongNgu;
    String doAm;
    String denPhongNgu;
    String denPhongNgu2;
    String quatPhongKhach;
    String nhietDo;

    IoT({
        this.quatPhongNgu2,
        this.denPhongKhach,
        this.quatPhongNgu,
        this.doAm,
        this.denPhongNgu,
        this.denPhongNgu2,
        this.quatPhongKhach,
        this.nhietDo,
    });

    factory IoT.fromRawJson(String str) => IoT.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IoT.fromJson(Map<String, dynamic> json) => IoT(
        quatPhongNgu2: json["QUAT_PHONG_NGU_2"] == null ? null : json["QUAT_PHONG_NGU_2"],
        denPhongKhach: json["DEN_PHONG_KHACH"] == null ? null : json["DEN_PHONG_KHACH"],
        quatPhongNgu: json["QUAT_PHONG_NGU"] == null ? null : json["QUAT_PHONG_NGU"],
        doAm: json["DO_AM"] == null ? null : json["DO_AM"],
        denPhongNgu: json["DEN_PHONG_NGU"] == null ? null : json["DEN_PHONG_NGU"],
        denPhongNgu2: json["DEN_PHONG_NGU_2"] == null ? null : json["DEN_PHONG_NGU_2"],
        quatPhongKhach: json["QUAT_PHONG_KHACH"] == null ? null : json["QUAT_PHONG_KHACH"],
        nhietDo: json["NHIET_DO"] == null ? null : json["NHIET_DO"],
    );

    Map<String, dynamic> toJson() => {
        "QUAT_PHONG_NGU_2": quatPhongNgu2 == null ? null : quatPhongNgu2,
        "DEN_PHONG_KHACH": denPhongKhach == null ? null : denPhongKhach,
        "QUAT_PHONG_NGU": quatPhongNgu == null ? null : quatPhongNgu,
        "DO_AM": doAm == null ? null : doAm,
        "DEN_PHONG_NGU": denPhongNgu == null ? null : denPhongNgu,
        "DEN_PHONG_NGU_2": denPhongNgu2 == null ? null : denPhongNgu2,
        "QUAT_PHONG_KHACH": quatPhongKhach == null ? null : quatPhongKhach,
        "NHIET_DO": nhietDo == null ? null : nhietDo,
    };
}
