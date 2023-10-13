import 'dart:io';
import 'package:e_commerce/add_product.dart';
import 'package:e_commerce/seller_dashboard.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class SuccessfulAdd extends StatefulWidget {
  final String token, id;
  const SuccessfulAdd({Key? key, required this.token, required this.id}) : super(key: key);

  @override
  _SuccessfulAddState createState() => _SuccessfulAddState();
}

class _SuccessfulAddState extends State<SuccessfulAdd> {

  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    String id = widget.id;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Listed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            Expanded(child: Icon(Icons.notifications,color: Colors.white,)),
            CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade900,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      backgroundColor: Colors.white,

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height: 45,

                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade900,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    Text('-----------',style: TextStyle(color: Colors.white),),
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    Text('-----------',style: TextStyle(color: Colors.white),),
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
                  ],
                )),
              ),

              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 30,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Successfully Listed',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              CircleAvatar(
                backgroundImage: AssetImage('assets/images/done.webp'),
                backgroundColor: Colors.lightBlue.shade100,
                radius: 50,

              ),
              Container(
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),


              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(token:token, id:id,category: '',subCategory1: '',subCategory2: '',),));
                }, child: Text('+ Add more product',style: TextStyle(color: Colors.white,fontSize: 18),)
                  ,color: Colors.lightBlue.shade700,
                  height: 40,
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),

                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SellerDashboard(token:token,id:id),));
                }, child: Text('Go To Dashboard',style: TextStyle(color: Colors.white,fontSize: 18),)
                  ,color: Colors.lightBlue.shade500,
                  height: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );


  }


}









































// import 'dart:io';
// import 'package:e_commerce/add_product.dart';
// import 'package:e_commerce/main_dashboard.dart';
// import 'package:e_commerce/seller_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'main.dart';
//
//
// class SuccessfulAdd extends StatefulWidget {
//   const SuccessfulAdd({Key? key}) : super(key: key);
//
//   @override
//   _SuccessfulAddState createState() => _SuccessfulAddState();
// }
//
// class _SuccessfulAddState extends State<SuccessfulAdd> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 "Listed",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//
//             Expanded(child: Icon(Icons.notifications,color: Colors.white,)),
//             CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.lightBlue.shade900,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//
//       backgroundColor: Colors.white,
//
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               Container(
//                 height: 45,
//
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlue.shade900,
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
//                 ),
//                 child: Center(child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     Text('-----------',style: TextStyle(color: Colors.white),),
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     Text('-----------',style: TextStyle(color: Colors.white),),
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
//                   ],
//                 )),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(right: 20, left: 20, top: 30,bottom: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         'Successfully Listed',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontFamily: 'Poppins',
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/done.webp'),
//                 backgroundColor: Colors.lightBlue.shade100,
//                 radius: 50,
//
//               ),
//               Container(
//                 child: Text(
//                   'Done',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontFamily: 'Poppins',
//                     color: Colors.black87,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//
//
//               Container(
//                 width: double.maxFinite,
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
//                 child: MaterialButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(),));
//                 }, child: Text('+ Add more product',style: TextStyle(color: Colors.white,fontSize: 18),)
//                   ,color: Colors.lightBlue.shade700,
//                   height: 40,
//                 ),
//               ),
//               Container(
//                 width: double.maxFinite,
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
//
//                 child: MaterialButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => MainDashboard(token: '', id: ''),));
//                 }, child: Text('Go To Dashboard',style: TextStyle(color: Colors.white,fontSize: 18),)
//                   ,color: Colors.lightBlue.shade500,
//                   height: 40,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }