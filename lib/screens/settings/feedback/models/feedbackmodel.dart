class FeedbackResponse {
  bool success;
  String message;

  FeedbackResponse({required this.success, required this.message});

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) {
    return FeedbackResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
