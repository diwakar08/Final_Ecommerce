import 'package:e_commerce/services/User_api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:day_picker/day_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'apis/sellerModel.dart';
import 'bankDetails.dart';
// import 'current_location_screen.dart';
import 'dialog_of_registration.dart';
import 'dropdown.dart';
import 'package:multiselect/multiselect.dart';
// import 'package:flutter_project/shopTime_weekDays_class.dart';
// import 'package:flutter_project/dialog_of_registration.dart';
// import 'package:flutter_project/current_location_screen.dart';

bool food_present=false;


class Regest extends StatefulWidget {
  final String token, id;
  const Regest({super.key, required this.token, required this.id});

  @override
  _SellerRegistrationPageState createState() => _SellerRegistrationPageState();
}

class _SellerRegistrationPageState extends State<Regest> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController landlineNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopTimingController = TextEditingController();


  late String lat, long;
  late String msg;
  Color customColor =  const Color(0xFFDEDC07);

  // static get isSelected => null;

  // CurrentLocationScreen currentLocationScreen = CurrentLocationScreen();


  Future<Position?> _getCurrentLocation() async {
    print("sdfsdfsd");
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle accordingly
      print("dfdfd");
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {// Permission is still denied, handle accordingly
        return null;
      }
    }
    // Get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, // Set desired accuracy
      );
      return position;
    } catch (e) {
      // Handle errors that may occur while fetching the location
      return null;
    }
  }
  Future<void> postPersonalDetails() async {


    UpdateSeller seller = UpdateSeller(
      shopName: shopNameController.text,
      ownerName: ownerNameController.text,
      phone: mobileNoController.text,
      landlineNumber: landlineNoController.text,
      addressOfShop: addressController.text,
    );
    Map<String, dynamic> updatedFields = {
      "shopName": shopNameController.text,
      "ownerName": ownerNameController.text,
      "phone": mobileNoController.text,
      "landlineNumber": landlineNoController.text,
      "addressOfShop": addressController.text
    };
    await UserApi.updateSeller(widget.token, widget.id, updatedFields);

    Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsForm(seller:seller, token:widget.token, id:widget.id)));

  }
  bool dia = false;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Basic Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.arrow_back),
        ),

        elevation: 20,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          border: Border.all(
                            color: Colors.cyanAccent,
                            width: 2.0, // Adjust border width as needed
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text('1',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: 90,
                      decoration:  BoxDecoration(
                        color: customColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                          color: customColor,
                          border: Border.all(
                            color: customColor,
                            width: 2.0, // Adjust border width as needed
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text('2',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: 90,
                      decoration:  BoxDecoration(
                        color: customColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                          color: customColor,
                          border: Border.all(
                            color: customColor,
                            width: 2.0, // Adjust border width as needed
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text('3',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Shop Name',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: shopNameController,
                decoration: const InputDecoration(
                  hintText: ' Enter shop name',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Owner Name',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: ownerNameController,
                decoration: const InputDecoration(
                  hintText: ' Enter owner name',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mobile No.',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: mobileNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: ' Enter mobile number',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Landline No.',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: landlineNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: ' Enter landline number (optional)',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: addressController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: ' Enter address',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(onPressed: () async {
                _getCurrentLocation().then((value) {
                  lat = '${value?.latitude}';
                  long = '${value?.longitude}';
                  setState(() {
                    msg = 'lat:$lat, long:$long';
                    print(msg);
                  });
                });
              },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
                ),
                child: const Text('Save my current location',
                ),
              ),


              const SizedBox(height: 32),
              //
              // Container(
              //   child: ElevatedButton(
              //     child: Text('current location'),
              //     onPressed: ()=> CurrentLocationScreen(),
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
              //     ),
              //   ),
              // ),

              ElevatedButton(onPressed: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                //   return const CurrentLocationScreen();
                // }));
              }, child: const Text("User current location")),


              //
              // const SizedBox(height: 32),
              // ElevatedButton(
              //   onPressed: () async {
              //     try {
              //       await CurrentLocationScreen().;
              //     } catch (e) {
              //       print('Error: $e');
              //       CurrentLocationScreen._showLocationServiceDisabledDialog(context);
              //     }
              //   },
              //   style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       const Icon(Icons.location_history),
              //       const SizedBox(width: 8.0),
              //       const Text("Current Location"),
              //     ],
              //   ),
              // ),



              ElevatedButton(
                onPressed: () async {
                  // Request location permission

                  _showLocationServiceDisabledDialog(context);

                  // LocationPermission permission =  await _showLocationServiceDisabledDialog(context);
                  // LocationPermission permission = await _requestLocationPermission();


                  // if (permission == LocationPermission.always ||
                  //     permission == LocationPermission.whileInUse)
                  if(dia == true)
                  {
                    // If permission granted, navigate to the map screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => CurrentLocationScreen()),
                    // );
                  } else {
                    // Handle case when permission is not granted
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Location permission denied.'),
                      ),
                    );
                  }
                },
                child: const Text('Request Location Permission'),
              ),



              const SizedBox(height: 32),
              Container(
                child: ElevatedButton(
                  child: Text('Shop Time'),
                  onPressed: (){
                    showDialog(context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context){
                          return SimpleCustomAlert();
                        }
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
                  ),
                ),
              ),

              const SizedBox(height: 32),
              dropDown(initialValue:food_present,
                  updateInitialValue: (value) {
                    setState(() {
                      food_present = value;
                    });
                  }),
              const SizedBox(height: 32),
              dropDown2(),
              const SizedBox(height: 32),
              // if(food_present)
              //   { foodInformation() };


              food_present ? foodInformation() : Container(),


              // foodInformation(),


              Container(
                width: double.infinity,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)

                    ),
                    onPressed: postPersonalDetails,
                    child: const Text('Register'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );



  }


  Future<LocationPermission> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  void _showLocationServiceDisabledDialog(BuildContext context) async {
    // ... (existing code)
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Location Services Disabled'),
            content: const Text(
                'Please enable location services to use this feature.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Open location settings to allow the user to enable location services
                  bool isOpened = await Geolocator.openLocationSettings();
                  dia = true;
                  if (isOpened) {
                    Navigator.of(context).pop(); // Close the dialog
                  } else {
                    // Location settings couldn't be opened
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            'Unable to open location settings. Please enable location services manually.'),
                      ),
                    );
                  }
                },
                child: const Text('Enable Location'),
              ),
            ],
          ),
    );
  }


}