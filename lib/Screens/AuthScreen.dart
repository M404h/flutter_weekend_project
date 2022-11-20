import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../Components/rounded_button.dart';
import '../Models/user_data.dart';
import 'HomeScreen.dart';
import 'package:flutter_weekend_project/constants.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//This is a comment

class AuthScreen extends StatefulWidget {
  static const String id = 'auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
//IF User didn't enter the right number of phone num next should be disappled

//for sign in i will collect this infoV But for login we will provide to way --> by phone number or normal way
//so first we rigist some one with his emai & passward & then w/ phone then linkthem
class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestoreUsers = FirebaseFirestore.instance.collection('users');
  var _countryDialCode = '+966';

  bool showSpinner = false;
  String _userName = '';
  String _userPhoneNumber = '';
  String smsCode = "";
  TextEditingController TextFieldController = TextEditingController();

  void _submitAuthForms(
    String name,
    String phoneNumber,
  ) async {
    UserCredential emailCredential;
    try {} on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials';
      if (err.message != null) {
        message = err.message!;
      }
      print('\n\n$err');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor));
    } catch (err) {
      print(err);
    }
  }

  void _authScreenNavigator() async {
    print('_authScreenNavigator -----');
    //check #1 V is this user id exists already?
    var thisUserId = _auth.currentUser!.uid;
    // OLD WAY :so here we search wither this userAuthId exist already(Not new user) or not (New User)
    // NEW WAY :check wither there is document(id) in user collection with same AuthId
    _firestoreUsers.doc(thisUserId).get().then((doc) {
      if (doc.exists) {
        print("Not NEW USER!--------------------------");
        print(doc.data()!.values);
        UserData.create(
            userID: thisUserId,
            userName: 'Test#1',
            userPhoneNumber: _auth.currentUser!.phoneNumber!);
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      } else {
        print("NEW USER ----------------------------");
        _firestoreUsers.doc(thisUserId).set({
          'phoneNumber': _countryDialCode + _userPhoneNumber,
          'name': "Unknown Name",
        });
        UserData.create(
            userID: thisUserId,
            userName: 'Test#1',
            userPhoneNumber: _auth.currentUser!.phoneNumber!);
        Navigator.pushReplacementNamed(context, HomeScreen.id,
            arguments: _auth);
      }
    }, onError: (e) {
      //is not exists (new User)
      print(e);
    });
  }

  Future loginUser(String mobile, BuildContext context) async {
    print(
        "$_countryDialCode ${mobile.substring(0, 2)} ${mobile.substring(2, 5)} ${mobile.substring(5, 9)}");
    _auth.verifyPhoneNumber(
        phoneNumber:
            "$_countryDialCode ${mobile.substring(0, 2)} ${mobile.substring(2, 5)} ${mobile.substring(5, 9)}",
        timeout: const Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('\n \n ------------here1-------------');
        },
        verificationFailed: (FirebaseAuthException authException) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('verification failed'),
          ));
          print(authException.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          // await Navigator.pushNamed(context, OTPScreen.id);
          await showDialog(
              // barrierColor: Color.fromARGB(255, 215, 215, 226),
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  content: Container(
                    color: Colors.white,
                    height: 220,
                    width: 320,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sms,
                                  color: lightColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "SMS Code",
                                  style: TextStyle(
                                    color: lightColor,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(color: lightColor),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6)
                              ],
                              onChanged: (value) {
                                setState(() {
                                  smsCode = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter SMS code here',
                                hintStyle: TextStyle(color: kSecondaryColor),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: lightColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: lightColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (smsCode.length == 6) Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 90,
                              height: 40,
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 10, top: 10, bottom: 10),
                              child: Center(
                                child: Text(
                                  "Verify",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
          //back

          print('smsCode: ${smsCode}');
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await _auth
              .signInWithCredential(credential)
              .then((UserCredential result) {
            print('\n\n--------------here3--------------');
            print(_auth.currentUser!.phoneNumber);
            _authScreenNavigator();
          }).catchError((e) {
            print(e);
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('\n\n---------here4----------------');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Time Out'),
          ));
          print(verificationId);
        });
  }

  void _trySubmit() {
    //always show us & en V
    // Locale myLocale = Localizations.localeOf(context);
    // print(myLocale.countryCode);
    // print(myLocale.languageCode);
    FocusScope.of(context).unfocus();
    // final isValid = _formKey.currentState!.validate();
    // if (isValid) {
    _formKey.currentState!.save();
    print('TRY SUBMIT:' + _userPhoneNumber);
    loginUser(_userPhoneNumber.trim(), context);
    // }
  }

  String? nameValidator(String value) {
    if (value.length >= 12) {
      return 'Name has to be less than 12 characters';
    }
    return null;
  }

  String? phoneValidator(String value) {
    // if (value.length < 9 || value.length > 10) {
    //   //not sure about non saudis numbers
    //   return 'Please enter a valid phone number';
    // }
    return null;
  }

  final countryPicker = FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    // print('reBuilded');
    // print('CountryDialCode' + _countryDialCode);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 130,
                ),
                Text(
                  'Safrati',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: lightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Text(
                  'Mobile:',
                  style: TextStyle(color: lightColor, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    setState(() {
                      _userPhoneNumber = value;
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: lightColor),
                  decoration: InputDecoration(
                    // prefixStyle: ,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        print('country code gesture');
                        final code =
                            await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        color: kSecColor,
                        child: Text(
                          countryCode?.dialCode != null
                              ? countryCode!.dialCode
                              : '+966',
                          style: TextStyle(color: kSecondaryColor),
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: kSecColor,
                    hintText: 'XXXXXXXXX',
                    hintStyle: TextStyle(color: lightColor),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 22.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: lightColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: lightColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: kMainColor),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(
                      //         10.0,
                      //       ),
                      //     )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _trySubmit();
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightColor,
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
