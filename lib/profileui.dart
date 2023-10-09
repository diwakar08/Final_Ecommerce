
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo profile Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController(text: "initial_value");
  var phoneController = TextEditingController(text: "initial number");
  var emailController = TextEditingController(text: "initial email");
  var addressController = TextEditingController(text: "initial address");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text("Edit profile page"),
        ),
        body:  SingleChildScrollView(
          child: Container(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height:20
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/dark.jpg'),
                  ),
                  const SizedBox(
                    height:40
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'username',
                        hintText: '  enter username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if(value==null) {
                          return "enter email";
                        } else {
                          return null;
                        }
                      },
                      decoration:  InputDecoration(
                        labelText: 'email',
                        hintText: 'enter email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      decoration:  InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile number',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter a mobile number';
                        } else if (value.length != 10) {
                          return "number must be 10 digit long";
                        }
                        return null;
                      }
                    ),
                  ),
                  const SizedBox(
                      height: 30
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                        controller: addressController,
                        decoration:  InputDecoration(
                          labelText: 'saved address here',
                          hintText: 'Enter your mobile number',
                          prefixIcon: const Icon(Icons.location_city),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a mobile number';
                          } else if (value.length != 10) {
                            return "number must be 10 digit long";
                          }
                          return null;
                        }
                    ),
                  ),
                  SizedBox(height:40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        child: Text('Save Profile'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
