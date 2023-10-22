// import 'package:e_commerce/shopTime_weekDays_class.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_project/shopTime_weekDays_class.dart';
//
// var open_time_controller = TextEditingController();
// var close_time_controller = TextEditingController();
//
// List<TextEditingController> other_open_time_controllers = [];
// List<TextEditingController> other_close_time_controllers = [];
//
// class SimpleCustomAlert extends StatefulWidget {
//   SimpleCustomAlert() : super();
//
//   @override
//   _SimpleCustomAlertState createState() => _SimpleCustomAlertState();
// }
//
// class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
//   int _expandedPanel = -1;
//   bool _isExpanded = false;
//
//   void _toggleExpanded() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }
//
//   List<String> selectedWeekdays = [];
//   List<String> selectedOffWeekdays = [];
//   List<List> otherSelectedWeekdays = [];
//
//   final _formKey = GlobalKey<FormState>();
//   bool hasErrors = false;
//
//   List<Widget> uiElements = [];
//
//   void addNewUIElement() {
//     var newOpenTimeController = TextEditingController();
//     var newCloseTimeController = TextEditingController();
//     other_open_time_controllers.add(newOpenTimeController);
//     other_close_time_controllers.add(newCloseTimeController);
//
//     setState(() {
//       uiElements.add(
//         Column(
//           children: [
//             Container(
//               child: Text(
//                 'Shop Timing',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Column(
//                     children: [
//                       Text("Open Timing"),
//                       Container(
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: TextFormField(
//                           readOnly: true,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (BuildContext context) {
//                                 return OtherOpenTimingPage(
//                                     openTimeController: newOpenTimeController);
//                               },
//                             );
//                           },
//                           textAlign: TextAlign.center,
//                           controller: newOpenTimeController,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 10.0,
//                             ),
//                             hintText: '  Click',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20.0),
//                   child: Column(
//                     children: [
//                       Text("Close Timing"),
//                       Container(
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: TextFormField(
//                           readOnly: true,
//                           textAlign: TextAlign.center,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (BuildContext context) {
//                                 return OtherCloseTimingPage(
//                                     closeTimeController:
//                                     newCloseTimeController);
//                               },
//                             );
//                           },
//                           controller: newCloseTimeController,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 10.0,
//                             ),
//                             hintText: '  Click',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "Select Weekdays",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 16.0),
//                   otherDaysSelectChipField(
//                     onSelectionChanged: (otherSelectedWeekdays) {
//                       setState(() {
//                         this.otherSelectedWeekdays.add(otherSelectedWeekdays);
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10.0),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               autovalidateMode: AutovalidateMode.always,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Select for Shop Off days",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         SizedBox(height: 16.0),
//                         shopOffSelectChipField(
//                           onSelectionChanged: (selectedOffWeekdays) {
//                             setState(() {
//                               this.selectedOffWeekdays = selectedOffWeekdays;
//                             });
//                           },
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(
//                             'Selected Off days: ${selectedOffWeekdays.join(', ')}'),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         child: Text(
//                           'Shop Timing',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: Column(
//                               children: [
//                                 Text("Open Timing"),
//                                 Container(
//                                   height: 40,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                   ),
//                                   child: TextFormField(
//                                     readOnly: true,
//                                     onTap: () {
//                                       showDialog(
//                                         context: context,
//                                         barrierDismissible: false,
//                                         builder: (BuildContext context) {
//                                           return openTimingPage();
//                                         },
//                                       );
//                                     },
//                                     textAlign: TextAlign.center,
//                                     controller: open_time_controller,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please select Time';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10.0,
//                                         horizontal: 10.0,
//                                       ),
//                                       hintText: '  Click',
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: 40,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 20.0),
//                             child: Column(
//                               children: [
//                                 Text("Close Timing"),
//                                 Container(
//                                   height: 40,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                   ),
//                                   child: TextFormField(
//                                     readOnly: true,
//                                     textAlign: TextAlign.center,
//                                     onTap: () {
//                                       showDialog(
//                                         context: context,
//                                         barrierDismissible: false,
//                                         builder: (BuildContext context) {
//                                           return closeTimingPage();
//                                         },
//                                       );
//                                     },
//                                     controller: close_time_controller,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please select Time';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10.0,
//                                         horizontal: 10.0,
//                                       ),
//                                       hintText: '  Click',
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Select Weekdays",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             SizedBox(height: 16.0),
//                             weekDaysChipField(
//                               onSelectionChanged: (selectedWeekdays) {
//                                 setState(() {
//                                   this.selectedWeekdays = selectedWeekdays;
//                                 });
//                               },
//                             ),
//                             SizedBox(height: 10.0),
//                           ],
//                         ),
//                       ),
//                       Column(children: uiElements),
//                       SizedBox(height: 20),
//                       Container(
//                         height: 40,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           border: Border.all(color: Colors.black, width: 1.0),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: addNewUIElement,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Add New UI Element ',
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               Icon(Icons.add_circle_outline_outlined)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: Colors.black, width: 1.0),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           hasErrors = !_formKey.currentState!.validate();
//                         });
//                         print(selectedOffWeekdays);
//                         print(selectedWeekdays);
//                         print(otherSelectedWeekdays);
//                         print(other_open_time_controllers
//                             .map((controller) => controller.text)
//                             .toList());
//                         print(other_close_time_controllers
//                             .map((controller) => controller.text)
//                             .toList());
//                         if (!hasErrors) {
//                           Navigator.pop(context);
//                         }
//                       },
//                       child: Text('Save', style: TextStyle(fontSize: 20)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             ),
//         );
//     }
// }


import 'package:e_commerce/services/User_api.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/shopTime_weekDays_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_project/shopTime_weekDays_class.dart';

var open_time_controller = TextEditingController();
var close_time_controller = TextEditingController();

List<TextEditingController> other_open_time_controllers = [];
List<TextEditingController> other_close_time_controllers = [];

class SimpleCustomAlert extends StatefulWidget {
  SimpleCustomAlert() : super();

  @override
  _SimpleCustomAlertState createState() => _SimpleCustomAlertState();
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  int _expandedPanel = -1;
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  List<String> selectedWeekdays = [];
  List<String> selectedOffWeekdays = [];
  List<List<String>> otherSelectedWeekdays = [];
  List<String> newSelectedWeekdays = [];
  List<String> newOtherSelectedWeekdays = [];

  final _formKey = GlobalKey<FormState>();
  bool hasErrors = false;

  List<Widget> uiElements = [];

  void addNewUIElement() {
    var newOpenTimeController = TextEditingController();
    var newCloseTimeController = TextEditingController();
    other_open_time_controllers.add(newOpenTimeController);
    other_close_time_controllers.add(newCloseTimeController);

    setState(() {
      uiElements.add(
        Column(
          children: [
            Container(
              child: Text(
                'Shop Timing',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return OtherOpenTimingPage(
                                    openTimeController: newOpenTimeController);
                              },
                            );
                          },
                          textAlign: TextAlign.center,
                          controller: newOpenTimeController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            hintText: '  Click',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Text("Close Timing"),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return OtherCloseTimingPage(
                                    closeTimeController:
                                    newCloseTimeController);
                              },
                            );
                          },
                          controller: newCloseTimeController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            hintText: '  Click',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Select Weekdays",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16.0),
                  otherDaysSelectChipField(
                    onSelectionChanged: (value) {
                      setState(() {
                        this.newOtherSelectedWeekdays = value;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      );
      otherSelectedWeekdays.add(List.from(newOtherSelectedWeekdays));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Select for Shop Off days",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    shopOffSelectChipField(
                      onSelectionChanged: (selectedOffWeekdays) {
                        setState(() {
                          this.selectedOffWeekdays = selectedOffWeekdays;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        'Selected Off days: ${selectedOffWeekdays.join(', ')}'),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      'Shop Timing',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return openTimingPage();
                                    },
                                  );
                                },
                                textAlign: TextAlign.center,
                                controller: open_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 10.0,
                                  ),
                                  hintText: '  Click',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Text("Close Timing"),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return closeTimingPage();
                                    },
                                  );
                                },
                                controller: close_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 10.0,
                                  ),
                                  hintText: '  Click',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "Select Weekdays",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 16.0),
                        weekDaysChipField(
                          onSelectionChanged: (selectedWeekdays) {
                            setState(() {
                              this.selectedWeekdays = selectedWeekdays;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),
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
                          Text(
                            'Add New UI Element ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.add_circle_outline_outlined)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    otherSelectedWeekdays.add(newOtherSelectedWeekdays);
                    setState(() {
                      hasErrors = !_formKey.currentState!.validate();
                    });
                    print(selectedOffWeekdays);
                    print(selectedWeekdays);
                    print(otherSelectedWeekdays);
                    print(other_open_time_controllers);
                    print(other_close_time_controllers);
                    print(open_time_controller);
                    print(close_time_controller);
                    postShopTime(selectedOffWeekdays, selectedWeekdays,
                        otherSelectedWeekdays, other_open_time_controllers,
                        other_close_time_controllers, open_time_controller, close_time_controller);
                    if (!hasErrors) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String timeToIso(String timee) {
    try {
      // print("isoFormatasdfasdfadsfasdfasdfadsfadsfasdfasdfasdfadsfadsfasdfasdfafasdfasdfasfdasf");
      String staticDate = "2023-10-20";

      // Your time string
      String timeString = timee;

      // Combine the static date and time string
      String dateTimeString = "$staticDate $timeString";

      // Parse the combined string and format it to ISO 8601
      DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm a").parse(dateTimeString);
      String isoFormat = dateTime.toIso8601String();

      // print(isoFormat); // Print the ISO 8601 date and time
      // print("isoFormatasdfasdfadsfasdfasdfadsfadsfasdfasdfasdfadsfadsfasdfasdfafasdfasdfasfdasf"); // Print the ISO 8601 date and time
      return isoFormat;
    } catch (e) {
      print("Error: $e");
      return "null"; // Return null in case of an error
    }
  }




  Future<void> postShopTime (List<String> selectedOffWeekdays, List<String> selectedWeekdays,
      List<List<String>> otherSelectedWeekdays, List<TextEditingController> other_open_time_controllers,
      List<TextEditingController> other_close_time_controllers, TextEditingController open_time_controller,
      TextEditingController close_time_controller) async {
    final token=TokenId.token;
    final id=TokenId.id;
    Map<String, dynamic> updatedFields = {
        "shopTimings":[{
          'day': selectedWeekdays[0],
          'openingTime': timeToIso(open_time_controller.text),
          'closingTime': timeToIso(close_time_controller.text),
        }]
    };
    for(int i=1;i<selectedWeekdays.length;i++) {
      updatedFields['shopTimings'].add({
        'day': selectedWeekdays[i],
        'openingTime': timeToIso(open_time_controller.text),
        'closingTime': timeToIso(close_time_controller.text),
      });
    }
    // List<Map<String, dynamic>> shopTimings;
    updatedFields['offDays']=selectedOffWeekdays;
    for(int i=1;i<otherSelectedWeekdays.length;i++) {
        for(int j=0;j<otherSelectedWeekdays[i].length;j++) {
          updatedFields['shopTimings'].add({
            'day': otherSelectedWeekdays[i][j],
            'openingTime': timeToIso(other_open_time_controllers[i].text),
            'closingTime': timeToIso(other_close_time_controllers[i].text),
          });
        }
    }
// print(updatedFields);
// print("updatedFields");
    await UserApi.updateSeller(token, id, updatedFields);
  }
}