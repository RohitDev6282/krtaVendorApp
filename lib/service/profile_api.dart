import 'package:http/http.dart' as http;
import 'package:krta_vendor_app/model/vendor_profile/profile.dart';
import 'package:krta_vendor_app/service/api_cofig.dart';

class Profile {
  Future<List<VendorProfile>> UserfetchContent(String userid) async {
    var queryUri = Config.vendorUpdateApi;
    var request = queryUri + userid;
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      final contentResponse = response.body;
      return vendorProfileFromJson(contentResponse);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
