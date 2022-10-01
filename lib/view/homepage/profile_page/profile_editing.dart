import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/widget/textform.dart';
import 'package:http/http.dart' as http;

class ProfileEditingPage extends StatefulWidget {
  const ProfileEditingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEditingPage> createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  String finalId = "";

  // List<XFile>? _imageFileList;

  // set _imageFile(XFile? value) {
  //   _imageFileList = value == null ? null : [value];
  // }

  // dynamic _pickImageError;

  // void _onImageButtonPressed(ImageSource source,
  //     {BuildContext? context, bool isMultiImage = false}) async {
  //   if (isMultiImage) {
  //     await _displayPickImageDialog(context!,
  //         (double? maxWidth, double? maxHeight, int? quality) async {
  //       try {
  //         final pickedFileList = await _picker.pickMultiImage(
  //           maxWidth: maxWidth,
  //           maxHeight: maxHeight,
  //           imageQuality: quality,
  //         );
  //         setState(() {
  //           _imageFileList = pickedFileList;
  //         });
  //       } catch (e) {
  //         setState(() {
  //           _pickImageError = e;
  //         });
  //       }
  //     });
  //   }
  // }

  // Widget _previewImages() {
  //   final Text? retrieveError = _getRetrieveErrorWidget();
  //   if (retrieveError != null) {
  //     return retrieveError;
  //   }
  //   if (_imageFileList != null) {
  //     return Semantics(
  //         child: ListView.builder(
  //           key: UniqueKey(),
  //           itemBuilder: (context, index) {
  //             // Why network for web?
  //             // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
  //             return Semantics(
  //               label: 'image_picker_example_picked_image',
  //               child: kIsWeb
  //                   ? Image.network(_imageFileList![index].path)
  //                   : Image.file(File(_imageFileList![index].path)),
  //             );
  //           },
  //           itemCount: _imageFileList!.length,
  //         ),
  //         label: 'image_picker_example_picked_images');
  //   } else if (_pickImageError != null) {
  //     return Text(
  //       'Pick image error: $_pickImageError',
  //       textAlign: TextAlign.center,
  //     );
  //   } else {
  //     return const Text(
  //       'You have not yet picked an image.',
  //       textAlign: TextAlign.center,
  //     );
  //   }
  // }

  bool _isLoading = false;
  var _selectState;
  var _selectCity;
  bool waiting = true;

  @override
  void initState() {
    super.initState();
    _getStateList();
  }

  List state = [];
  List city = [];

  Future<String> _getStateList() async {
    String url = "https://quickplayers.com/api/state.php";
    var response = await http.get(Uri.parse(url));
    final getState = jsonDecode(response.body);
    setState(() {
      state = getState;
    });
    if (getState["success"] == 0) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(getState["message"].toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      return "success";
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<String> _getCityList() async {
    var queryuri = "https://quickplayers.com/api/city.php";
    final queryParams = {"state_id": _selectState};

    var queryStrings = Uri(queryParameters: queryParams).query;
    var request = queryuri + '?' + queryStrings;
    print(request);

    // String url2 = "https://quickplayers.com/api/city.php?state_id=5";
    var response = await http.get(Uri.parse(request));
    final getCity = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        city = getCity;
      });
      // print(statesList);

    } else if (getCity["success"] == 0) {
      throw Exception('Failed to load data from API');
    }
    return "success";
  }

  final _formKey = GlobalKey<FormState>();
  late ScaffoldMessengerState scaffoldMessenger;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: kBlClr,
                          size: 25,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Profile Editing", style: kBLrgTextStyle),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: NetworkImage(finalPic),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              onPressed: () {
                                // _onImageButtonPressed(
                                //   ImageSource.gallery,
                                //   context: context,
                                //   isMultiImage: true,
                                // );
                              },
                              icon: const Icon(Icons.file_upload,
                                  color: Colors.white, size: 22),
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget(
                          hinttest: "Enter the name",
                          controller: _nameController,
                          label: 'Name',
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          validiate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Email Address ';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                          hinttest: "Enter the email",
                          controller: _emailController,
                          label: 'Email',
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hinttest: "Enter the Mobile no.",
                          controller: _mobileController,
                          label: 'Mobile',
                        ),

                        // spaceBetweenDetail,
                        const SizedBox(
                          height: 10,
                        ),

                        TextFieldWidget(
                          hinttest: "Enter the street address",
                          controller: _addressController,
                          label: 'Address',
                        ),

                        // spaceBetweenDetail,
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hinttest: "Enter the Pin Code",
                          controller: _pinCodeController,
                          label: 'Pincode',
                        ),

                        // spaceBetweenDetail,
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hinttest: "Enter the location",
                          controller: _locationController,
                          label: 'Enter the Location',
                        ),

                        // spaceBetweenDetail,

                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.89,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(width: 1, color: kGreyColor),
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(12)),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 10.0),
                        //     child: DropdownButton(
                        //       hint: const Text(
                        //         "Select the State",
                        //         style: kLargeTextStyle,
                        //       ),
                        //       underline: DropdownButtonHideUnderline(
                        //           child: Container()),
                        //       isExpanded: true,
                        //       items: state.map((val) {
                        //         return DropdownMenuItem(
                        //           child: Text(
                        //             val['state_name'],
                        //             style: kLargeTextStyle,
                        //           ),
                        //           value: val['id'],
                        //         );
                        //       }).toList(),
                        //       onChanged: (value) {
                        //         setState(() {
                        //           _selectState = value;
                        //           _getCityList();
                        //         });
                        //       },
                        //       value: _selectState,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.89,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(width: 1, color: kGreyColor),
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(12)),
                        //   ),
                        //   child: Padding(
                        //       padding: const EdgeInsets.only(left: 10.0),
                        //       child: DropdownButton(
                        //         hint: const Text(
                        //           "Select the city",
                        //           style: kLargeTextStyle,
                        //         ),
                        //         underline: DropdownButtonHideUnderline(
                        //             child: Container()),
                        //         isExpanded: true,
                        //         items: city
                        //             .map((item) => DropdownMenuItem(
                        //                   child: Text(
                        //                     item['city_name'] + item["id"],
                        //                     style: kLargeTextStyle,
                        //                   ),
                        //                   value: item['id'],
                        //                 ))
                        //             .toList(),
                        //         onChanged: (value) {
                        //           setState(() {
                        //             this._selectCity = value;
                        //           });
                        //         },
                        //         value: _selectCity,
                        //       )),
                        // ),
                        const SizedBox(height: 10),
                      ]),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      side: const BorderSide(width: 2.5, color: Colors.white),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      final form = _formKey.currentState!;
                      setState(() {
                        _isLoading = true;
                      });
                      if (_emailController.text.isEmpty ||
                          _nameController.text.isEmpty ||
                          _mobileController.text.isEmpty ||
                          _addressController.text.isEmpty ||
                          _pinCodeController.text.isEmpty ||
                          _locationController.text.isEmpty) {
                        scaffoldMessenger.showSnackBar(
                            SnackBar(content: Text("Please Fill all fileds")));
                        return;
                      }
                      // userUpdate(
                      //     _nameController.text,
                      //     _emailController.text,
                      //     _mobileController.text,
                      //     _addressController.text,
                      //     _pinCodeController.text,
                      //     _locationController.text);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Profile Update", style: kLargeTextStyle),
                    ),
                  ),
                ),
              ]),
            )),
      )),
    );
  }

  // TextField buildTextField(String labelText, String placeholder) {
  //   return TextField(
  //       decoration: InputDecoration(
  //     contentPadding: const EdgeInsets.only(bottom: 3),
  //     labelText: labelText,
  //     floatingLabelBehavior: FloatingLabelBehavior.always,
  //     hintText: placeholder,
  //     hintStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ));
  // }

  // Future<UserUpdateModel?> userUpdate(String name, String email, String mobile,
  //     String address, String pinCode, String location) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var getUserId = preferences.getString("userId");

  //   Map data = {
  //     'user_id': getUserId,
  //     'name': name,
  //     'email': email,
  //     'mobile': mobile,
  //     'address': address,
  //     'state_id': _selectState,
  //     'city_id': _selectCity,
  //     "location": location,
  //     'pincode': pinCode,
  //   };

  //   var response = await http.post(Uri.parse(Config.userUpdateAPi), body: data);
  //   var updateResponse = json.decode(response.body);
  //   if (updateResponse["success"] == 1) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text(updateResponse["message"].toString()),
  //             actions: <Widget>[
  //               ElevatedButton(
  //                 child: Text("OK"),
  //                 onPressed: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => ProfilePage()));
  //                 },
  //               ),
  //             ],
  //           );
  //         });
  //   } else if (updateResponse["success"] == 0) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text(updateResponse["message"].toString()),
  //             actions: <Widget>[
  //               ElevatedButton(
  //                 child: Text("OK"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           );
  //         });
  //   }
  // }

  Text? _getRetrieveErrorWidget() {}

  _displayPickImageDialog(
      BuildContext buildContext,
      Future<Null> Function(double? maxWidth, double? maxHeight, int? quality)
          param1) {}
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _dropDownValue = "Select the Gender";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: kGreyColor,
          ),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.grey.withOpacity(0.0),
                spreadRadius: 3,
                blurRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
        ),
        child: DropdownButton(
          hint: Text(
            _dropDownValue,
            style: kLargeTextStyle,
          ),
          underline: DropdownButtonHideUnderline(child: Container()),
          isExpanded: true,
          style: kLargeTextStyle,
          items: ['Male', 'Female', 'Others'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (String? val) {
            setState(
              () {
                _dropDownValue = val!;
              },
            );
          },
        ),
      ),
    );
  }
}
