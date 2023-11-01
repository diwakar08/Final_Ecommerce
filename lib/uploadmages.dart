
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main_dashboard.dart';

void main() {
  runApp(BankDetailsApp1());
}

class BankDetailsApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: UploadImages(token: '', id: '',),
    );
  }
}

class UploadImages extends StatefulWidget {
  final token;

  final id;

  UploadImages({Key? key, required  this.token, required this.id}) : super(key: key); // Constructor

  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  XFile? ownerPhoto;
  XFile? gstImage;
  XFile? fssaiImage;
  XFile? cancelledCheckImage;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        ownerPhoto = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }


  Future<void> _getGSTImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        gstImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }


  Future<void> _getFSSAIImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        fssaiImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }



  Future<void> _getCancelledCheque() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        cancelledCheckImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }

  // Similarly, create functions for other image types and update their respective variables.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Upload Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Your progress indicators here

              const SizedBox(height: 30),
              // const Text('Upload Images', style: TextStyle(fontSize: 18)),
              // const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (ownerPhoto != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload Owner Photo'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getGSTImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (gstImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload GST Image'),

                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getFSSAIImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if ( fssaiImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload FSSAI Image'),

                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getCancelledCheque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (cancelledCheckImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload Cancelled Cheque Image'),

                  ],
                ),
              ),
              const SizedBox(height: 70),
              Center(
                child: Container(

                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDashboard(token: widget.token, id: widget.id, pageIndex: 2,sortt:"created_at"),
                        ),
                            (route) => false, // This line clears the navigator stack
                      );
                      // Process the form data and perform submission
                      // Process the form data and perform submission

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Set this to 0 for a square button
                      ),
                      backgroundColor: Colors.blue, // Change this to the color you want
                    ),
                    child: const Text('Finish',style: TextStyle(color: Colors.white),),
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