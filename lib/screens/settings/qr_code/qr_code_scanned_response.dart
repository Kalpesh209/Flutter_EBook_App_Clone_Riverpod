class QRCodeScannedResponse {
  QRCodeScannedData? data;
  bool? success;
  String? message;

  QRCodeScannedResponse({this.data, this.success, this.message});

  QRCodeScannedResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? QRCodeScannedData.fromJson(json['data']) : null;
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

class QRCodeScannedData {
  String? id;
  String? userName;
  String? message;
  String? bookId;
  String? orderId;
  String? newOrderId;
  String? orderNumber;
  String? returnDate;
  String? returnTime;
  String? qrCode;
  String? bookImage;
  String? createdAt;
  String? updatedAt;

  QRCodeScannedData(
      {this.id,
      this.userName,
      this.message,
      this.bookId,
      this.orderId,
      this.newOrderId,
      this.orderNumber,
      this.returnDate,
      this.returnTime,
      this.qrCode,
      this.bookImage,
      this.createdAt,
      this.updatedAt});

  QRCodeScannedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    message = json['message'];
    bookId = json['book_id'];
    orderId = json['order_id'];
    newOrderId = json['new_order_id'];
    orderNumber = json['order_number'];
    returnDate = json['retur_date'];
    returnTime = json['return_time'];
    qrCode = json['qr_code'];
    bookImage = json['book_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['message'] = message;
    data['book_id'] = bookId;
    data['order_id'] = orderId;
    data['new_order_id'] = newOrderId;
    data['order_number'] = orderNumber;
    data['retur_date'] = returnDate;
    data['return_time'] = returnTime;
    data['qr_code'] = qrCode;
    data['book_image'] = bookImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
