import 'package:http/http.dart' as http;
import 'package:krta_vendor_app/model/new_lead/new_lead.dart';
import 'package:krta_vendor_app/service/api_cofig.dart';

class NewLeadService {
  Future<List<NewLeadModel>> fetchNewLead(String vendorid) async {
    var queryUri = Config.newleadApi;
    var request = queryUri + vendorid;
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      final newLead = response.body;
      return newLeadModelFromJson(newLead);
      print(newLead);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
