import "package:flutter/material.dart";
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/completelead/complete_lead.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Complete extends StatefulWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  bool waiting = true;
  List<CompleteLead> completeLead = [];
  @override
  void initState() {
    super.initState();
    _workingLead().then((getWorking) => setState(() {
          waiting = false;
          completeLead = getWorking;
        }));
  }

  Future _workingLead() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var getVendorId = preferences.getString("userId");
    var response = await http.get(Uri.parse(
        "https://kartaa.in/api/working-leads.php?vendor_id=$getVendorId"));
    if (response.statusCode == 200) {
      final getCompleted = completeLeadFromJson(response.body);

      return getCompleted;
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: completeLead.length,
        itemBuilder: (context, index) {
          return Card(
            color: index % 2 == 0 ? kPrimaryColor : kLightOrangeColor,
            shadowColor: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 10, 15),
              child: ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     (MaterialPageRoute(
                  //         builder: (context) => ViewDetail(
                  //               customerDetail: completeLead[index],
                  //             ))));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: Text(completeLead[index].name.toUpperCase(),
                          style: TextStyle(
                              color: index % 2 == 0 ? kWhiteColor : kBlClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: Text(completeLead[index].completeAddress,
                          style: TextStyle(
                            color: index % 2 == 0 ? kWhiteColor : kBlClr,
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: Text("Looking For " "completeLead[index].",
                      style: kBMdmTextStyle),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(2)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 1, 12, 1),
                    child: Text(
                      "GET",
                      style: kBLrgTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
          //  : const CircularProgressIndicator(backgroundColor: Colors.white),
          ),
    );
  }
}
