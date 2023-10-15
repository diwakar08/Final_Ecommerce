// import 'package:flutter/material.dart';
// import 'package:e_commerce/registeration.dart';
// import 'package:multiselect/multiselect.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:day_picker/day_picker.dart';
//
// import 'dialog_of_registration.dart';
// import 'package:e_commerce/dialog_of_registration.dart';
//
//
//
// class weekDaysChipField extends StatefulWidget {
//   final Function(List<String>) onSelectionChanged;
//
//   weekDaysChipField({
//     required this.onSelectionChanged,
//   });
//
//   @override
//   _weekDaysChipFieldState createState() => _weekDaysChipFieldState();
// }
//
// class _weekDaysChipFieldState extends State<weekDaysChipField> {
//   List<String> weekdays = [
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//     'Fri',
//     'Sat',
//     'Sun'
//   ];
//   List<String> selectedWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (selectedWeekdays.contains(weekday)) {
//         selectedWeekdays.remove(weekday);
//       } else {
//         selectedWeekdays.add(weekday);
//       }
//       // tt = selectedWeekdays.join(', ');
//       widget.onSelectionChanged(selectedWeekdays);
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
//           selected: selectedWeekdays.contains(weekday),
//           onSelected: (_) => _onChipSelected(weekday),
//         );
//       }).toList(),
//     );
//   }
//
// }
//
//
//
// class shopOffSelectChipField extends StatefulWidget {
//   final Function(List<String>) onSelectionChanged;
//
//   shopOffSelectChipField({
//     required this.onSelectionChanged,
//   });
//
//   @override
//   _shopOffSelectChipFieldState createState() => _shopOffSelectChipFieldState();
// }
//
// class _shopOffSelectChipFieldState extends State<shopOffSelectChipField> {
//   List<String> weekdays = [
//     'None',
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//     'Fri',
//     'Sat',
//     'Sun'
//   ];
//   List<String> selectedOffWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (selectedOffWeekdays.contains(weekday)) {
//         selectedOffWeekdays.remove(weekday);
//       } else {
//         selectedOffWeekdays.add(weekday);
//       }
//       // tt = selectedWeekdays.join(', ');
//       widget.onSelectionChanged(selectedOffWeekdays);
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
//           selected: selectedOffWeekdays.contains(weekday),
//           onSelected: (_) => _onChipSelected(weekday),
//         );
//       }).toList(),
//     );
//   }
//
// }
//
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
//
//
//
// class openTimingPage extends StatefulWidget {
//   const openTimingPage({super.key});
//
//   @override
//   State<openTimingPage> createState() => _openTimingPageState();
// }
//
// class _openTimingPageState extends State<openTimingPage> {
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
//
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
//                       open_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
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
//
// class otherOpenTimingPage extends StatefulWidget {
//   const otherOpenTimingPage({super.key});
//
//   @override
//   State<otherOpenTimingPage> createState() => _otherOpenTimingPageState();
// }
//
// class _otherOpenTimingPageState extends State<otherOpenTimingPage> {
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
//                       other_open_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
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
//
//
// class closeTimingPage extends StatefulWidget {
//   const closeTimingPage({super.key});
//
//   @override
//   State<closeTimingPage> createState() => _closeTimingPageState();
// }
//
// class _closeTimingPageState extends State<closeTimingPage> {
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
//                       close_time_controller.text =("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
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
//
// class otherCloseTimingPage extends StatefulWidget {
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
//                       other_close_time_controller.text = ("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
//                       // other_close_time_controllers[index],
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



import 'package:flutter/material.dart';
// import 'package:e_commerce/registeration.dart';
import 'package:multiselect/multiselect.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:day_picker/day_picker.dart';
import 'package:e_commerce/dialog_of_registration.dart';

class weekDaysChipField extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  weekDaysChipField({
    required this.onSelectionChanged,
  });

  @override
  _weekDaysChipFieldState createState() => _weekDaysChipFieldState();
}

class _weekDaysChipFieldState extends State<weekDaysChipField> {
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
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
  _otherDaysSelectChipFieldState createState() =>
      _otherDaysSelectChipFieldState();
}

class _otherDaysSelectChipFieldState extends State<otherDaysSelectChipField> {
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              style:
                              TextStyle(color: Colors.white, fontSize: 25),
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
                              style:
                              TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(
                    onPressed: () => {
                      open_time_controller.text =
                      ("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      Navigator.pop(context)
                    },
                    child: Text('Ok', style: TextStyle(fontSize: 20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherOpenTimingPage extends StatefulWidget {
  final TextEditingController openTimeController;

  const OtherOpenTimingPage({required this.openTimeController, Key? key})
      : super(key: key);

  @override
  _OtherOpenTimingPageState createState() => _OtherOpenTimingPageState();
}

class _OtherOpenTimingPageState extends State<OtherOpenTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
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
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                        ),
                        bottom: BorderSide(color: Colors.white),
                      ),
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
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                        ),
                        bottom: BorderSide(color: Colors.white),
                      ),
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
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: timeFormat == "AM"
                                ? Colors.grey.shade800
                                : Colors.grey.shade700,
                            border: Border.all(
                              color: timeFormat == "AM"
                                  ? Colors.grey
                                  : Colors.grey.shade700,
                            ),
                          ),
                          child: const Text(
                            "AM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
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
                            horizontal: 20,
                            vertical: 10,
                          ),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.openTimeController.text =
                  "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $timeFormat";
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              style:
                              TextStyle(color: Colors.white, fontSize: 25),
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
                              style:
                              TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(
                    onPressed: () => {
                      close_time_controller.text =
                      ("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}"),
                      Navigator.pop(context)
                    },
                    child: Text('Ok', style: TextStyle(fontSize: 20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherCloseTimingPage extends StatefulWidget {
  final TextEditingController closeTimeController;

  const OtherCloseTimingPage({required this.closeTimeController, Key? key})
      : super(key: key);

  @override
  _OtherCloseTimingPageState createState() => _OtherCloseTimingPageState();
}

class _OtherCloseTimingPageState extends State<OtherCloseTimingPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} $timeFormat",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
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
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                        ),
                        bottom: BorderSide(color: Colors.white),
                      ),
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
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                        ),
                        bottom: BorderSide(color: Colors.white),
                      ),
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
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: timeFormat == "AM"
                                ? Colors.grey.shade800
                                : Colors.grey.shade700,
                            border: Border.all(
                              color: timeFormat == "AM"
                                  ? Colors.grey
                                  : Colors.grey.shade700,
                            ),
                          ),
                          child: const Text(
                            "AM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
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
                            horizontal: 20,
                            vertical: 10,
                          ),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.closeTimeController.text =
                  "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $timeFormat";
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}