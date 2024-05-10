class AudioBookUrlResponse {
  Data? data;
  bool? success;
  String? message;

  AudioBookUrlResponse({this.data, this.success, this.message});

  AudioBookUrlResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? voice;
  String? globalSpeed;
  bool? converted;
  double? audioDuration;
  String? audioUrl;
  String? message;

  Data(
      {this.voice,
      this.globalSpeed,
      this.converted,
      this.audioDuration,
      this.audioUrl,
      this.message});

  Data.fromJson(Map<String, dynamic> json) {
    voice = json['voice'];
    globalSpeed = json['globalSpeed'];
    converted = json['converted'];
    audioDuration = json['audioDuration'];
    audioUrl = json['audioUrl'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['voice'] = voice;
    data['globalSpeed'] = globalSpeed;
    data['converted'] = converted;
    data['audioDuration'] = audioDuration;
    data['audioUrl'] = audioUrl;
    data['message'] = message;
    return data;
  }
}
