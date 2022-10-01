import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/new_lead/new_lead.dart';
import 'package:krta_vendor_app/view/homepage/homepage.dart';

class ViewDetail extends StatelessWidget {
  final NewLeadModel customerDetail;
  const ViewDetail({
    Key? key,
    required this.customerDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(
        children: [
          CustomPaint(size: const Size(400, 50), painter: DrawTriangle()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kWhiteColor,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerDetail.name,
                      style: kWtXtaTstSte,
                    ),
                    const SizedBox(height: 5),
                    Text(customerDetail.email, style: kWhiteLrgTextStyle),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),

              const userDetailField(
                  text: "432424",
                  //  customerDetail.complaintNo,
                  hinttext: 'Complaint No.',
                  icon: Icon(
                    Icons.document_scanner,
                    size: 30,
                    color: kWhiteColor,
                  )),
              const SizedBox(
                height: 10,
              ),

              userDetailField(
                  text: customerDetail.name,
                  hinttext: 'Name',
                  icon: Icon(
                    Icons.document_scanner,
                    size: 30,
                    color: kWhiteColor,
                  )),
              const SizedBox(
                height: 10,
              ),
              const userDetailField(
                text: "",
                // customerDetail.contactNo,
                hinttext: 'Contact No.',
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const userDetailField(
                text: " customerDetail.leadType,",
                hinttext: 'Service Requirement',
                icon: Icon(
                  Icons.mobile_friendly,
                  size: 30,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const userDetailField(
                  text: " customerDetail.location,",
                  hinttext: "Address",
                  icon: Icon(
                    Icons.location_city,
                    size: 30,
                    color: kWhiteColor,
                  )),

              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                    // if (_formkey.currentState!.validate()) {
                    // _otpVerify(_otpController.text);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 6, 18, 6),
                    child: Text(
                      'CONFIRM THE SERVICE',
                      style: kWhiteLrgTextStyle,
                    ),
                  ),
                ),
              ),

              // userDetailField(
              //   text: _getUserData[index].location +
              //       ", " +
              //       _getUserData[index].city +
              //       ", " +
              //       _getUserData[index].address,
              //   hinttext: "Address",
              // ),
              const SizedBox(height: 10),

              // const SettingPage(),
            ],
          ),
        ],
      ),
    )
            // }
            //           );
            //     } else if (snapshot.hasError) {
            //       return const Center(
            //         child: Text("User first Loggin"),
            //       );
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //   }),
            // ),
            // })
            ));
  }
}

// ignore: camel_case_types
class userDetailField extends StatelessWidget {
  final String hinttext;
  final String text;
  final Widget icon;
  const userDetailField({
    Key,
    required this.hinttext,
    key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              hinttext,
              style: kBlackSmlTextStyle,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              text,
              style: kBLrgTextStyle,
            ),
          ),
          leading: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(32))),
          ),
        ));
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var path = Path();
    path.moveTo(size.width * 2, 0);

    path.lineTo(0, size.height * 0);
    path.lineTo(0, size.width * 0.35);

    path.lineTo(0, 250);
    path.close();
    canvas.drawPath(path, Paint()..color = kPrimaryColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Lead Detail",
//           style: kWhiteLrgTextStyle,
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.95,
//                   child: const Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: SizedBox(
//                         child: Text(
//                           "Complain No.:34543xx343",
//                           style: TextStyle(fontSize: 20, color: Colors.blue),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Card(
//                     child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.95,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       "Customer Name :" " " + customerDetail.name,
//                       style: TextStyle(color: Colors.blue, fontSize: 20),
//                     ),
//                   ),
//                 )),
//                 const SizedBox(height: 10),
//                 Card(
//                     child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.95,
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       "Contact no. : 934343232*",
//                       style: TextStyle(color: Colors.blue, fontSize: 18),
//                     ),
//                   ),
//                 )),
//                 const SizedBox(height: 10),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: Text(
//                         "Service is requirement" " : " +
//                             customerDetail.leadType,
//                         style: TextStyle(color: Colors.blue, fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: const Text(
//                         "Address:- Sector 35,Noida, U.P-201301",
//                         style: TextStyle(color: Colors.blue, fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: ElevatedButton(
//                         child: const Text('Confirm the Services',
//                             style: kLargeTextStyle),
//                         onPressed: () {
//                           // _selectDate(context);
//                         }),
//                   ),
//                 ),
//               ])),
//     );
//   }
// }
