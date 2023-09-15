// api connection
class ApiEndpoints {
  static const Duration connectionTimeout = Duration(seconds: 2000);
  static const Duration receiveTimeout = Duration(seconds: 2000);

// for android
  static const String baseUrl = "http://10.0.2.2:3004";

  // for android  mobile--> ip address win
  // static const String baseUrl = "http://192.168.1.65:3004";




  // ----------------- Auth Routes = 1 -----------------
  static const String login = "/users/login";
  static const String register = "/users/register";
 

  // ----------------- Upload Image Routes = 2  -----------------
  static const String uploadImage = "/uploads";
  static const String imageUrl = "$baseUrl/uploads/";
}
