

import 'package:e_commerce/services/User_api.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:day_picker/day_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'apis/sellerModel.dart';
import 'bankDetails.dart';
import 'dropdown.dart';
import 'package:multiselect/multiselect.dart';

bool food_present=false;

//

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



  //   final List<DayInWeek> _days = [
  //   DayInWeek("Mon", dayKey: "monday"),
  //   DayInWeek("Tue", dayKey: "tuesday"),
  //   DayInWeek("Wed", dayKey: "wednesday"),
  //   DayInWeek("Thu", dayKey: "thursday"),
  //   DayInWeek("Fri", dayKey: "friday"),
  //   DayInWeek("Sat", dayKey: "saturday"),
  //   DayInWeek("Sun", dayKey: "sunday"),
  // ];
  //
  // bool isSelected;
  // ListView.builder(List<DayInWeek> _days, this.isSelected) :
// final List<DayInWeek> _day = _days.where((DayTnWeek) => isSelected == true).toList();


  late String lat, long;
  late String msg;
  Color customColor =  const Color(0xFFDEDC07);

  // static get isSelected => null;


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
    // print("seller shopname is printing wait.....");
    // print(seller.shopName);
    Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsForm(seller:seller, token:widget.token, id:widget.id)));

  }

  @override
  Widget build(BuildContext context) {

    // final customWidgetKey = GlobalKey<SelectWeekDaysState>();
    //
    // SelectWeekDays selectWeekDays = SelectWeekDays(
    //   key: customWidgetKey,
    //   fontSize: 10,
    //   fontWeight: FontWeight.w500,
    //   days: _days,
    //   border: false,
    //   width: MediaQuery.of(context).size.width / 1.4,
    //   boxDecoration: BoxDecoration(
    //     color: Colors.red,
    //     borderRadius: BorderRadius.circular(30.0),
    //   ),
    //   onSelect: (values) {
    //     print(values);
    //   },
    // );
    // Widget _buildWidgetBasedOnCondition(bool isFoodPresent) {
    //   if (isFoodPresent) {
    //     print(isFoodPresent);
    //     setState(() {
    //       // Update the UI based on the condition
    //       // Call setState only if food is present
    //     });
    //     return foodInformation();
    //   } else {
    //     return Container();
    //   }
    // }
    // bool isFood=false;
    // var initialValue;
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
                child: Padding(
                  padding: EdgeInsets.only(left:40.0),
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
                        width: 120,
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
                        width: 120,
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
}

var open_time_controller=TextEditingController();
var close_time_controller=TextEditingController();



List<TextEditingController> other_open_time_controllers = [];
List<TextEditingController> other_close_time_controllers = [];
var index = 0;
var other_open_time_controller=TextEditingController();
var other_close_time_controller=TextEditingController();
var open_select_weekdays_controller1=TextEditingController();
// var tt="iii";

class SimpleCustomAlert extends StatefulWidget{
  const SimpleCustomAlert({super.key});


  @override
  State<SimpleCustomAlert> createState() => _SimpleCustomAlertState();
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  // final title;
  int _expandedPanel = -1;

  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  List<String> selectedWeekdays = [];
  List<String> selectedOffWeekdays = [];
  List<String> otherSelectedWeekdays = [];


  final _formKey = GlobalKey<FormState>();
  bool hasErrors = false;

  // String _inputValue = '';

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  // String openTime = '';
  // String closeTime = '';
  // // List<String> selectedWeekdays = [];
  //
  // // Validation functions
  // String? validateTime(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please select a time';
  //   }
  //   return null;
  // }
  //
  // void _saveForm() {
  //   if (_formKey.currentState!.validate()) {
  //     // Form is valid, save your data or perform your actions
  //     // Here, you can access the form field values like openTime, closeTime, selectedWeekdays
  //     Navigator.pop(context);
  //   }
  // }

  List<Widget> uiElements = [];

  void addNewUIElement() {
    // index = index + 1;
    // other_open_time_controllers.add(other_open_time_controller);
    // other_close_time_controllers.add(other_open_time_controller);
    setState(() {
      // Add a new UI element to the list
      if(uiElements.length<1) {
        //
        //   var len = uiElements.length+1;
        uiElements.add(Column(
          children: [
            Container(
                child: Text('Shop Timing', style: TextStyle(fontSize: 20),)),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Text("Open Timing"),
                      Container(

                        height: 40,
                        width: 100,

                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: TextFormField(

                          readOnly: true,
                          onTap: () {
                            showDialog(context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  // if(len==1)
                                  //     return otherOpenTimingPage1();if(len==2)
                                  //     return otherOpenTimingPage2();if(len==3)
                                  //     return otherOpenTimingPage3();if(len==4)
                                  //     return otherOpenTimingPage4();if(len==5)
                                  //     return otherOpenTimingPage5();if(len==6)
                                  //     return otherOpenTimingPage6();
                                  return otherOpenTimingPage();
                                }
                            );
                          },
                          textAlign: TextAlign.center,

                          controller: other_open_time_controller,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            // labelText: 'Open Time',
                            hintText: '  Click',
                            // prefixIcon: Icon(Icons.access_time_sharp),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 40,),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Text("Close Timing"),
                      Container(
                        // padding: EdgeInsets.only(right: 20),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: TextFormField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          onTap: () {
                            showDialog(context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return otherCloseTimingPage();
                                }
                            );
                          },
                          controller: other_close_time_controller,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            // labelText: 'Close Time',
                            hintText: '  Click',
                            // prefixIcon: Icon(Icons.access_time_sharp),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Select Weekdays", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 16.0),
                  otherDaysSelectChipField(
                    onSelectionChanged: (otherSelectedWeekdays) {
                      setState(() {
                        this.otherSelectedWeekdays = otherSelectedWeekdays;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'Selected Weekdays: ${otherSelectedWeekdays.join(', ')}'),

                ],
              ),
            ),
          ],
        ),);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode:AutovalidateMode.always,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Select for Shop Off days",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 16.0),
                    shopOffSelectChipField(
                      onSelectionChanged: (selectedOffWeekdays) {
                        setState(() {
                          this.selectedOffWeekdays = selectedOffWeekdays;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text('Selected Off days: ${selectedOffWeekdays.join(', ')}'),

                  ],
                ),
              ),

              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(child: Text('Shop Timing',style: TextStyle(fontSize: 20),)),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            Text("Open Timing"),
                            Container(

                              height: 40,
                              width: 100,

                              decoration: BoxDecoration(
                                color: Colors.white,

                              ),
                              child: TextFormField(

                                readOnly: true,
                                onTap: (){
                                  showDialog(context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context){
                                        return openTimingPage();
                                      }
                                  );
                                },
                                textAlign: TextAlign.center,
                                controller: open_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null; // Return null if the input is valid
                                },
                                // onSaved: (value) {
                                //   _inputValue = value!;
                                // },
                                decoration: InputDecoration(
                                  contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  // labelText: 'Open Time',
                                  hintText: '  Click',
                                  // prefixIcon: Icon(Icons.access_time_sharp),
                                  border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 40,),

                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Text("Close Timing"),
                            Container(
                              // padding: EdgeInsets.only(right: 20),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,

                              ),
                              child: TextFormField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                onTap: (){
                                  showDialog(context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context){
                                        return closeTimingPage();
                                      }
                                  );
                                },
                                controller: close_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null; // Return null if the input is valid
                                },
                                // onSaved: (value) {
                                //   _inputValue = value!;
                                // },

                                decoration: InputDecoration(
                                  contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  // labelText: 'Close Time',
                                  hintText: '  Click',
                                  // prefixIcon: Icon(Icons.access_time_sharp),
                                  border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("Select Weekdays",style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16.0),
                        MultiSelectChipField(
                          onSelectionChanged: (selectedWeekdays) {
                            setState(() {
                              this.selectedWeekdays = selectedWeekdays;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),
                        Text('Selected Weekdays: ${selectedWeekdays.join(', ')}'),

                      ],
                    ),
                  ),

                  Column(children: uiElements),



                  SizedBox(height: 20),


                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: ElevatedButton(
                      onPressed: addNewUIElement,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Add New UI Element ',style: TextStyle(fontSize: 18),),
                          // SizedBox(width: 2,),
                          Icon(Icons.add_circle_outline_outlined)
                        ],
                      ),
                    ),
                  ),

                ],
              ),




              // ExpansionPanelList(
              //   elevation: 1,
              //   expandedHeaderPadding: EdgeInsets.zero,
              //   expansionCallback: (int index, bool isExpanded) {
              //     // Toggle the expansion state of the panel
              //     setState(() {
              //       _expandedPanel = isExpanded ? -1 : index;
              //     });
              //   },
              //   children: [
              //     ExpansionPanel(
              //       headerBuilder: (BuildContext context, bool isExpanded) {
              //         return ListTile(
              //           title: Text("Add Different Timing", style: TextStyle(fontSize: 18)),
              //         );
              //       },
              //       isExpanded: _expandedPanel == 0,
              //       body: Column(
              //         children: [
              //           Container(child: Text('Shop Timing',style: TextStyle(fontSize: 20),)),
              //
              //       SizedBox(height: 10,),
              //       Row(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 20.0),
              //             child: Column(
              //               children: [
              //                 Text("Open Timing"),
              //                 Container(
              //
              //                   height: 40,
              //                   width: 100,
              //
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //
              //                   ),
              //                   child: TextFormField(
              //
              //                     readOnly: true,
              //                     onTap: (){
              //                       showDialog(context: context,
              //                           barrierDismissible: false,
              //                           builder: (BuildContext context){
              //                             return otherOpenTimingPage();
              //                           }
              //                       );
              //                     },
              //                     textAlign: TextAlign.center,
              //                     controller: other_open_time_controller,
              //
              //                     decoration: InputDecoration(
              //                       contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              //                       // labelText: 'Open Time',
              //                       hintText: '  Click',
              //                       // prefixIcon: Icon(Icons.access_time_sharp),
              //                       border: OutlineInputBorder(
              //                         // borderRadius: BorderRadius.circular(10.0),
              //                       ),
              //
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //
              //           SizedBox(width: 40,),
              //
              //           Padding(
              //             padding: const EdgeInsets.only(right: 20.0),
              //             child: Column(
              //               children: [
              //                 Text("Close Timing"),
              //                 Container(
              //                   // padding: EdgeInsets.only(right: 20),
              //                   height: 40,
              //                   width: 100,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //
              //                   ),
              //                   child: TextFormField(
              //                     readOnly: true,
              //                     textAlign: TextAlign.center,
              //                     onTap: (){
              //                       showDialog(context: context,
              //                           barrierDismissible: false,
              //                           builder: (BuildContext context){
              //                             return otherCloseTimingPage();
              //                           }
              //                       );
              //                     },
              //                     controller: other_close_time_controller,
              //
              //                     decoration: InputDecoration(
              //                       contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              //                       // labelText: 'Close Time',
              //                       hintText: '  Click',
              //                       // prefixIcon: Icon(Icons.access_time_sharp),
              //                       border: OutlineInputBorder(
              //                         // borderRadius: BorderRadius.circular(10.0),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //
              //       SizedBox(height: 10,),
              //
              //       Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Column(
              //           children: [
              //             Text("Select Weekdays",style: TextStyle(fontSize: 20),),
              //             SizedBox(height: 16.0),
              //             MultiSelectChipField(
              //               onSelectionChanged: (otherSelectedWeekdays) {
              //                 setState(() {
              //                   this.otherSelectedWeekdays = otherSelectedWeekdays;
              //                 });
              //               },
              //             ),
              //             SizedBox(height: 10.0),
              //             Text('Selected Weekdays: ${otherSelectedWeekdays.join(', ')}'),
              //
              //           ],
              //         ),
              //       ),
              //         ],
              //     ),
              //
              //          ),
              //   ],
              // ),


              SizedBox(height: 20,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasErrors = !_formKey.currentState!.validate();
                      });

                      // Only pop the dialog if there are no errors
                      if (!hasErrors) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save',style: TextStyle(fontSize: 20))
                ),
              ),

              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );

  }
}






class MultiSelectChipField extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  MultiSelectChipField({
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectChipFieldState createState() => _MultiSelectChipFieldState();
}

class _MultiSelectChipFieldState extends State<MultiSelectChipField> {
  List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  List<String> selectedWeekdays = [];

  void _onChipSelected(String weekday) {
    setState(() {
      if (selectedWeekdays.contains(weekday)) {
        selectedWeekdays.remove(weekday);
      } else {
        selectedWeekdays.add(weekday);
      }
      // tt = selectedWeekdays.join(', ');
      widget.onSelectionChanged(selectedWeekdays);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: weekdays.map((weekday) {
        return ChoiceChip(
          label: Text(weekday),
          selected: selectedWeekdays.contains(weekday),
          onSelected: (_) => _onChipSelected(weekday),
        );
      }).toList(),
    );
  }

}



class shopOffSelectChipField extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  shopOffSelectChipField({
    required this.onSelectionChanged,
  });

  @override
  _shopOffSelectChipFieldState createState() => _shopOffSelectChipFieldState();
}

class _shopOffSelectChipFieldState extends State<shopOffSelectChipField> {
  List<String> weekdays = [
    'None',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  List<String> selectedOffWeekdays = [];

  void _onChipSelected(String weekday) {
    setState(() {
      if (selectedOffWeekdays.contains(weekday)) {
        selectedOffWeekdays.remove(weekday);
      } else {
        selectedOffWeekdays.add(weekday);
      }
      // tt = selectedWeekdays.join(', ');
      widget.onSelectionChanged(selectedOffWeekdays);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: weekdays.map((weekday) {
        return ChoiceChip(
          label: Text(weekday),
          selected: selectedOffWeekdays.contains(weekday),
          onSelected: (_) => _onChipSelected(weekday),
        );
      }).toList(),
    );
  }

}



class otherDaysSelectChipField extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  otherDaysSelectChipField({
    required this.onSelectionChanged,
  });

  @override
  _otherDaysSelectChipFieldState createState() => _otherDaysSelectChipFieldState();
}

class _otherDaysSelectChipFieldState extends State<otherDaysSelectChipField> {
  List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  List<String> otherSelectedWeekdays = [];

  void _onChipSelected(String weekday) {
    setState(() {
      if (otherSelectedWeekdays.contains(weekday)) {
        otherSelectedWeekdays.remove(weekday);
      } else {
        otherSelectedWeekdays.add(weekday);
      }
      // tt = selectedWeekdays.join(', ');
      widget.onSelectionChanged(otherSelectedWeekdays);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: weekdays.map((weekday) {
        return ChoiceChip(
          label: Text(weekday),
          selected: otherSelectedWeekdays.contains(weekday),
          onSelected: (_) => _onChipSelected(weekday),
        );
      }).toList(),
    );
  }

}

// class WeekdaySelectionScreen extends StatefulWidget {
//   const WeekdaySelectionScreen({super.key});
//
//   @override
//   _WeekdaySelectionScreenState createState() => _WeekdaySelectionScreenState();
// }
//
// class _WeekdaySelectionScreenState extends State<WeekdaySelectionScreen> {
//   List<String> selectedWeekdays = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//
//       child: Container(
//         height: 350,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Text("Select Weekdays",style: TextStyle(fontSize: 20),),
//               SizedBox(height: 16.0),
//               MultiSelectChipField(
//                 onSelectionChanged: (selectedWeekdays) {
//                   setState(() {
//                     this.selectedWeekdays = selectedWeekdays;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Text('Selected Weekdays: ${selectedWeekdays.join(', ')}'),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context, 'Selected Weekdays: ${selectedWeekdays.join(', ')}');
//                 },
//                 child: Text('OK'),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



class openTimingPage extends StatefulWidget {
  const openTimingPage({super.key});

  @override
  State<openTimingPage> createState() => _openTimingPageState();
}

class _openTimingPageState extends State<openTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "AM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: timeFormat == "AM"
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700,
                                border: Border.all(
                                  color: timeFormat == "AM"
                                      ? Colors.grey
                                      : Colors.grey.shade700,
                                )),
                            child: const Text(
                              "AM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "PM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: timeFormat == "PM"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "PM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              "PM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),



              SizedBox(height: 5,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(

                    onPressed: () => {
                      open_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      Navigator.pop(context)
                    },
                    child: Text('Ok',style: TextStyle(fontSize: 20))),
              ),
            ],


          ),


        ),
      ),
    );
  }
}


class otherOpenTimingPage extends StatefulWidget {
  const otherOpenTimingPage({super.key});

  @override
  State<otherOpenTimingPage> createState() => _otherOpenTimingPageState();
}

class _otherOpenTimingPageState extends State<otherOpenTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "AM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: timeFormat == "AM"
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700,
                                border: Border.all(
                                  color: timeFormat == "AM"
                                      ? Colors.grey
                                      : Colors.grey.shade700,
                                )),
                            child: const Text(
                              "AM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "PM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: timeFormat == "PM"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "PM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              "PM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(

                    onPressed: () => {
                      other_open_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      Navigator.pop(context)
                    },
                    child: Text('Ok',style: TextStyle(fontSize: 20))),
              ),
            ],


          ),


        ),
      ),
    );
  }
}



class closeTimingPage extends StatefulWidget {
  const closeTimingPage({super.key});

  @override
  State<closeTimingPage> createState() => _closeTimingPageState();
}

class _closeTimingPageState extends State<closeTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "AM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: timeFormat == "AM"
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700,
                                border: Border.all(
                                  color: timeFormat == "AM"
                                      ? Colors.grey
                                      : Colors.grey.shade700,
                                )),
                            child: const Text(
                              "AM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "PM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: timeFormat == "PM"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "PM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              "PM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(

                    onPressed: () => {
                      close_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      Navigator.pop(context)
                    },
                    child: Text('Ok',style: TextStyle(fontSize: 20))),
              ),
            ],


          ),


        ),
      ),
    );
  }
}


class otherCloseTimingPage extends StatefulWidget {
  const otherCloseTimingPage({super.key});

  @override
  State<otherCloseTimingPage> createState() => _otherCloseTimingPageState();
}

class _otherCloseTimingPageState extends State<otherCloseTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20),
                      selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "AM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: timeFormat == "AM"
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700,
                                border: Border.all(
                                  color: timeFormat == "AM"
                                      ? Colors.grey
                                      : Colors.grey.shade700,
                                )),
                            child: const Text(
                              "AM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "PM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: timeFormat == "PM"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "PM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              "PM",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(

                    onPressed: () => {
                      other_close_time_controller.text = ("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      // other_close_time_controllers[index],
                      Navigator.pop(context)
                    },
                    child: Text('Ok',style: TextStyle(fontSize: 20))),
              ),
            ],


          ),


        ),
      ),
    );
  }
}




//
// class otherOpenTimingPage1 extends StatefulWidget {
//   const otherOpenTimingPage1({super.key});
//
//   @override
//   State<otherOpenTimingPage1> createState() => _otherOpenTimingPage1State();
// }

// class _otherOpenTimingPage1State extends State<otherOpenTimingPage1> {
//   var hour = 0;
//   var minute = 0;
//   var timeFormat = "AM";
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0),
//         child: Container(
//           height: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                   "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
//                   style:
//                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.black87,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     NumberPicker(
//                       minValue: 0,
//                       maxValue: 12,
//                       value: hour,
//                       zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 80,
//                       itemHeight: 60,
//                       onChanged: (value) {
//                         setState(() {
//                           hour = value;
//                         });
//                       },
//                       textStyle:
//                       const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                       const TextStyle(color: Colors.white, fontSize: 30),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                             top: BorderSide(
//                               color: Colors.white,
//                             ),
//                             bottom: BorderSide(color: Colors.white)),
//                       ),
//                     ),
//                     NumberPicker(
//                       minValue: 0,
//                       maxValue: 59,
//                       value: minute,
//                       zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 80,
//                       itemHeight: 60,
//                       onChanged: (value) {
//                         setState(() {
//                           minute = value;
//                         });
//                       },
//                       textStyle:
//                       const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                       const TextStyle(color: Colors.white, fontSize: 30),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                             top: BorderSide(
//                               color: Colors.white,
//                             ),
//                             bottom: BorderSide(color: Colors.white)),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               timeFormat = "AM";
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             decoration: BoxDecoration(
//                                 color: timeFormat == "AM"
//                                     ? Colors.grey.shade800
//                                     : Colors.grey.shade700,
//                                 border: Border.all(
//                                   color: timeFormat == "AM"
//                                       ? Colors.grey
//                                       : Colors.grey.shade700,
//                                 )),
//                             child: const Text(
//                               "AM",
//                               style: TextStyle(color: Colors.white, fontSize: 25),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               timeFormat = "PM";
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: timeFormat == "PM"
//                                   ? Colors.grey.shade800
//                                   : Colors.grey.shade700,
//                               border: Border.all(
//                                 color: timeFormat == "PM"
//                                     ? Colors.grey
//                                     : Colors.grey.shade700,
//                               ),
//                             ),
//                             child: const Text(
//                               "PM",
//                               style: TextStyle(color: Colors.white, fontSize: 25),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 5,),
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: Colors.black, width: 1.0),
//                 ),
//                 child: ElevatedButton(
//
//                     onPressed: () => {
//                       other_open_time1_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
//                       Navigator.pop(context)
//                     },
//                     child: Text('Ok',style: TextStyle(fontSize: 20))),
//               ),
//             ],
//
//
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }
//
// class otherCloseTimingPage1 extends StatefulWidget {
//   const otherCloseTimingPage({super.key});
//
//   @override
//   State<otherCloseTimingPage> createState() => _otherCloseTimingPageState();
// }
//
// class _otherCloseTimingPageState extends State<otherCloseTimingPage> {
//   var hour = 0;
//   var minute = 0;
//   var timeFormat = "AM";
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0),
//         child: Container(
//           height: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                   "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
//                   style:
//                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.black87,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     NumberPicker(
//                       minValue: 0,
//                       maxValue: 12,
//                       value: hour,
//                       zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 80,
//                       itemHeight: 60,
//                       onChanged: (value) {
//                         setState(() {
//                           hour = value;
//                         });
//                       },
//                       textStyle:
//                       const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                       const TextStyle(color: Colors.white, fontSize: 30),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                             top: BorderSide(
//                               color: Colors.white,
//                             ),
//                             bottom: BorderSide(color: Colors.white)),
//                       ),
//                     ),
//                     NumberPicker(
//                       minValue: 0,
//                       maxValue: 59,
//                       value: minute,
//                       zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 80,
//                       itemHeight: 60,
//                       onChanged: (value) {
//                         setState(() {
//                           minute = value;
//                         });
//                       },
//                       textStyle:
//                       const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                       const TextStyle(color: Colors.white, fontSize: 30),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                             top: BorderSide(
//                               color: Colors.white,
//                             ),
//                             bottom: BorderSide(color: Colors.white)),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               timeFormat = "AM";
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             decoration: BoxDecoration(
//                                 color: timeFormat == "AM"
//                                     ? Colors.grey.shade800
//                                     : Colors.grey.shade700,
//                                 border: Border.all(
//                                   color: timeFormat == "AM"
//                                       ? Colors.grey
//                                       : Colors.grey.shade700,
//                                 )),
//                             child: const Text(
//                               "AM",
//                               style: TextStyle(color: Colors.white, fontSize: 25),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               timeFormat = "PM";
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: timeFormat == "PM"
//                                   ? Colors.grey.shade800
//                                   : Colors.grey.shade700,
//                               border: Border.all(
//                                 color: timeFormat == "PM"
//                                     ? Colors.grey
//                                     : Colors.grey.shade700,
//                               ),
//                             ),
//                             child: const Text(
//                               "PM",
//                               style: TextStyle(color: Colors.white, fontSize: 25),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 5,),
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: Colors.black, width: 1.0),
//                 ),
//                 child: ElevatedButton(
//
//                     onPressed: () => {
//                       other_close_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
//                       Navigator.pop(context)
//                     },
//                     child: Text('Ok',style: TextStyle(fontSize: 20))),
//               ),
//             ],
//
//
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }
//
// class otherDaysSelectChipField extends StatefulWidget {
//   final Function(List<String>) onSelectionChanged;
//
//   otherDaysSelectChipField({
//     required this.onSelectionChanged,
//   });
//
//   @override
//   _otherDaysSelectChipFieldState createState() => _otherDaysSelectChipFieldState();
// }
//
// class _otherDaysSelectChipFieldState extends State<otherDaysSelectChipField> {
//   List<String> weekdays = [
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//     'Fri',
//     'Sat',
//     'Sun'
//   ];
//   List<String> otherSelectedWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (otherSelectedWeekdays.contains(weekday)) {
//         otherSelectedWeekdays.remove(weekday);
//       } else {
//         otherSelectedWeekdays.add(weekday);
//       }
//       // tt = selectedWeekdays.join(', ');
//       widget.onSelectionChanged(otherSelectedWeekdays);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: weekdays.map((weekday) {
//         return ChoiceChip(
//           label: Text(weekday),
//           selected: otherSelectedWeekdays.contains(weekday),
//           onSelected: (_) => _onChipSelected(weekday),
//         );
//       }).toList(),
//     );
//   }
//
// }