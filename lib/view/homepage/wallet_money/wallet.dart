import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/widget/appBar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  TextEditingController textEditingController = TextEditingController();
  var _razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              title: "Wallet Page",
              left: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: kWhiteColor,
                  ))),
        ),

        // child: Container(
        //   color: kPrimaryColor,
        //   child: Padding(
        //     padding: const EdgeInsets.all(4.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [

        //         TextButton(
        //             onPressed: () {
        //               // Navigator.push(
        //               //     context,
        //               //     MaterialPageRoute(
        //               //         builder: (context) =>
        //               //             const NotificationPage()));
        //             },
        //             child: Row(
        //               children: [
        //                 Text("Help", style: kWhiteLrgTextStyle),
        //                 const SizedBox(
        //                   width: 10,
        //                 ),
        //                 Icon(
        //                   Icons.help,
        //                   color: kWhiteColor,
        //                 ),
        //               ],
        //             )),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body:
          // appBar: AppBar(actions: [
          //   IconButton(
          //       onPressed: () {
          //         // Navigator.push(
          //         //     context,
          //         //     MaterialPageRoute(
          //         //         builder: (context) => const ProfilePage()));
          //       },
          //       icon: const Icon(
          //         Icons.help,
          //         color: kWhiteColor,
          //         size: 30,
          //       )),
          // ]),
          ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Wallet Balance",
                            style: kBLrgTextStyle,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '\u{20B9} ' "350",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kLightGreyColor, width: 2),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Add Money to',
                              style: kBLrgTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Krta Wallet',
                                    style: kBLrgTextStyle),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: false,
                              // validator: validator,
                              // onChanged: onChanged,
                              keyboardType: TextInputType.number,
                              // textInputAction: textInputAction,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '\u{20B9} ',
                                    style: kBLrgTextStyle,
                                  ),
                                ),

                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                hintText: "Enter the Amount",
                                // fillColor: Theme.of(context).backgroundColor,
                                filled: true,
                                errorStyle: const TextStyle(
                                    height: 0, color: Colors.transparent),
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: kBlClr, width: .3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070), width: .5)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070), width: .5)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: .5),
                                ),
                              ),
                              style: kBLrgTextStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () async {
                                // setState(() {
                                //   _isLoading = true;
                                // });
                                // if (_mobileController.text.isEmpty) {
                                //   scaffoldMessenger.showSnackBar(const SnackBar(
                                //       content: Text("Please Fill all fileds")));
                                //   return;
                                // }
                                // _login(
                                //   _mobileController.text,
                                // );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                child: Text("Proceed TO CheckOut",
                                    style: kWhiteLrgTextStyle),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kLightGreyColor, width: 2),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: ((BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.wallet_giftcard),
                            ),
                            title: Text(
                              'Added The Wallet',
                              style: kXBtXtaTstSte,
                            ),
                            trailing: Text(
                              '\u{20B9} ' "50",
                              style: kBLrgTextStyle,
                            ),
                            subtitle: const Text('This is subtitle'),
                            selected: true,
                            onTap: () {
                              setState(() {
                                // txt='List Tile pressed';
                              });
                            },
                          ),
                        );
                        // Text(txt,textScaleFactor: 2,);
                      })),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 200,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9999181009', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
