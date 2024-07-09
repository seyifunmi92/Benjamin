class ApiResponse {
  int? code;
  String? body;

  ApiResponse({this.code, this.body});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(code: json["code"], body: json["body"]);

  Map<String, dynamic> toJson() => {
        "code": code,
        "body": body,
      };
}
