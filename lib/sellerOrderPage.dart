import 'package:flutter/material.dart';
import 'apis/orderModel.dart';
void main() {
  runApp( BankDetailsApp());
}


class BankDetailsApp extends StatefulWidget {

  @override
  State<BankDetailsApp> createState() => _BankDetailsAppState();
}


class _BankDetailsAppState extends State<BankDetailsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: sellerFrontPage(),
    );
  }
}


class sellerFrontPage extends StatefulWidget {
  @override
  _BankDetailsFormState createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<sellerFrontPage> {

  Color color1 = const Color(0xFF08FFC8);
  Color color2 = const Color(0xFFFFF7F7);
  Color color3 = const Color(0xFFDADADA);
  Color color4 = const Color(0xFF204969);
  bool isNewOrders = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFFFFF7F7),
        appBar: AppBar(
          backgroundColor: color1,
          toolbarHeight: 80,
          title: const Text('Order Details',
            style: TextStyle(
                color: Colors.black),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorWeight: 5,
            indicatorColor: Color(0xFF204969) ,
            labelColor: Color(0xFF204969),
            // Change the selected tab text color.
            unselectedLabelColor: Colors.black,
            // Change the unselected tab text color.
            tabs: [
              Tab(text: 'New',),
              Tab(text: 'Preparing',),
              Tab(text: 'Ready',),
              Tab(text: 'Completed',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildPage2('New Orders'),
            buildPage1('Preparing'),
            buildPage3('Ready'),
            buildPage4('PickedUp'),
          ],
        ),
      ),
    );
  }

  Widget buildPage1(String s) {
    final List<Map<String, String>> orders = [
      {
        'name': 'Abhishek',
        'amount': '₹50',
        'id': '123',
        'order': 'Item 1',
        'time': '10:00 AM',
      },
      {
        'name': 'Sahil',
        'amount': '\$30',
        'id': '124',
        'order': 'Item 2',
        'time': '11:30 AM',
      },
      {
        'name': 'Rohan',
        'amount': '\$70',
        'id': '125',
        'order': 'Item 3',
        'time': '1:45 PM',
      },
      {
        'name': 'Rishi',
        'amount': '\$40',
        'id': '126',
        'order': 'Item 4',
        'time': '3:15 PM',
      },
    ];
    final List<String> product = ["sugar", "rice", "soap", "flour"];
    final List<String> amount = ["1 kg", "2 kg", "2 Dozen", "5 kg"];
    final List<String> price = ["₹50", "₹70", "₹200", "₹150"];
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7F7),
        body: Column(
          children: [
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  final order = orders[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 10.0),

                    child: Card(
                      elevation: 5, // Add elevation to make it appear as a card
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(
                              height: 25,
                              width: double.infinity,
                              color: const Color(0xFFDADADA),
                              child: const Center(
                                child: Text('Preparing',),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Order ID: ${order['id']}'),
                                const Spacer(),
                                Text(order['time']!),
                                PopupMenuButton<String>(
                                  // onSelected: _selectOption,
                                  itemBuilder: (BuildContext context) {
                                    return {'See order Details'}.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [

                                Text('${order['name']}\'s Order',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                const Spacer(),
                                const Text('Takeaway',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Visibility(
                                child: Row(
                                  children: [
                                    Text('${amount[index]} ${product[index]}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    const Spacer(),
                                    Text(price[index],
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                  ],
                                )
                            ),
                            const SizedBox(height: 10),
                            //
                            // const SizedBox(height: 10,),
                            Row(
                              children: [
                                Container(
                                  height: 38,
                                  color: Color(0xFF204969),
                                  width: 170,
                                  child: ElevatedButton(onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF204969),
                                        // elevation: 3, // Remove button elevation if not needed
                                      ),
                                      child: const Center(
                                          child: Text('Make Order Ready'))
                                  ),
                                ),
                                Spacer(),
                                Text('Total Bill: ${price[index]} ',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )


    );
  }


  Widget buildPage2(String s) {
    final List<Map<String, String>> orders = [
      {
        'name': 'Abhishek',
        'amount': '₹300',
        'id': '123',
        'order': 'Item 1',
        'time': '10:00 AM',
      },
      {
        'name': 'Sahil',
        'amount': '₹300',
        'id': '124',
        'order': 'Item 2',
        'time': '11:30 AM',
      },
      {
        'name': 'Rohan',
        'amount': '₹100',
        'id': '125',
        'order': 'Item 3',
        'time': '1:45 PM',
      },
      {
        'name': 'Rishi',
        'amount': '₹250',
        'id': '126',
        'order': 'Item 4',
        'time': '3:15 PM',
      },
    ];

    final List<List<List<String>>> data = [
      [
        ["5 kg", "sugar", "Rs 100.00"],
        ["3 kg", "rice", "Rs 150.00"],
        ["2 unit", "soap", "Rs 50"],
      ],
      [
        ["4 kg", "rice", "Rs 150.00"],
        ["3 kg", "sugar", "Rs 100.00"],
        ["2 unit", "soap", "Rs 50"],
      ],
      [
        ["5 kg", "sugar", "Rs 100.00"],
      ],[
        ["5 kg", "sugar", "Rs 100.00"],
        ["3 kg", "rice", "Rs 150.00"],
      ]];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F7),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 10.0,
                  ),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Column(
                        children: [
                          Container(
                            height: 25,
                            width: double.infinity,
                            color: const Color(0xFFDADADA),
                            child: const Center(
                              child: Text(
                                'New Order',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text('Order ID: ${order['id']}'),
                              const Spacer(),
                              Text(order['time']!),
                              PopupMenuButton<String>(
                                itemBuilder: (BuildContext context) {
                                  return {'See order Details'}.map(
                                        (String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    },
                                  ).toList();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${order['name']}'s Order",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'Takeaway',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: data[index].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, dataIndex) {
                              final rowData = data[index][dataIndex];
                              final String amount = rowData[0];
                              final String product = rowData[1];
                              final String price = rowData[2];

                              return Row(
                                children: [
                                  Text('$amount $product',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 38,
                                color: Color(0xFF204969),
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF204969),
                                    elevation: 3,
                                  ),
                                  child: const Center(
                                    child: Text('Prepare Order'),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Total Bill: ${order['amount']}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage3(String s) {
    final List<Map<String, dynamic>> orders = [
      {
        'name': 'Abhishek',
        'amount': '₹50',
        'id': '123',
        'order': 'Item 1',
        'time': '10:00 AM',
      },
      {
        'name': 'Sahil',
        'amount': '\$30',
        'id': '124',
        'order': 'Item 2',
        'time': '11:30 AM',
      },
      {
        'name': 'Rohan',
        'amount': '\$70',
        'id': '125',
        'order': 'Item 3',
        'time': '1:45 PM',
      },
      {
        'name': 'Rishi',
        'amount': '\$40',
        'id': '126',
        'order': 'Item 4',
        'time': '3:15 PM',
      },
    ];
    final List<String> product = ["sugar", "rice", "soap", "flour"];
    final List<String> amount = ["1 kg", "2 kg", "2 Dozen", "5 kg"];
    final List<String> price = ["₹50", "₹70", "₹200", "₹150"];
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7F7),
        body: Column(
          children: [
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  final order = orders[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 10.0),

                    child: Card(
                      elevation: 5, // Add elevation to make it appear as a card
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(
                              height: 25,
                              width: double.infinity,
                              color: const Color(0xFFDADADA),
                              child: const Center(
                                child: Text('Ready Order',),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Order ID: ${order['id']}'),
                                const Spacer(),
                                Text(order['time']!),
                                PopupMenuButton<String>(
                                  // onSelected: _selectOption,
                                  itemBuilder: (BuildContext context) {
                                    return {'a', 'b'}.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [

                                Text('  ${order['name']}\'s Order',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                const Spacer(),
                                const Text('Takeaway',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Visibility(
                                child: Row(
                                  children: [
                                    Text('${amount[index]} ${product[index]}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    const Spacer(),
                                    Text(price[index],
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                  ],
                                )
                            ),
                            const SizedBox(height: 10),
                            //
                            // const SizedBox(height: 10,),
                            Text('Total Bill: ${price[index]} ',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )


    );
  }
  Widget buildPage4(String s) {
    final List<Map<String, String>> orders = [
      {
        'name': 'Abhishek',
        'amount': '₹50',
        'id': '123',
        'order': 'Item 1',
        'time': '10:00 AM',
      },
      {
        'name': 'Sahil',
        'amount': '\$30',
        'id': '124',
        'order': 'Item 2',
        'time': '11:30 AM',
      },
      {
        'name': 'Rohan',
        'amount': '\$70',
        'id': '125',
        'order': 'Item 3',
        'time': '1:45 PM',
      },
      {
        'name': 'Rishi',
        'amount': '\$40',
        'id': '126',
        'order': 'Item 4',
        'time': '3:15 PM',
      },
    ];
    final List<String> product = ["sugar", "rice", "soap", "flour"];
    final List<String> amount = ["1 kg", "2 kg", "2 Dozen", "5 kg"];
    final List<String> price = ["₹50", "₹70", "₹200", "₹150"];
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7F7),
        body: Column(
          children: [
            const SizedBox(height: 10,),

            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  final order = orders[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 10.0),

                    child: Card(
                      elevation: 5, // Add elevation to make it appear as a card
                      child: ListTile(
                        title: Column(
                          children: [
                            Container(
                              height: 25,
                              width: double.infinity,
                              color: const Color(0xFFDADADA),
                              child: const Center(
                                child: Text('Completed',),
                              ),),
                            Row(
                              children: [
                                Text('Order ID: ${order['id']}'),
                                const Spacer(),
                                Text(order['time']!),
                                PopupMenuButton<String>(
                                  // onSelected: _selectOption,
                                  itemBuilder: (BuildContext context) {
                                    return {'a', 'b'}.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [

                                Text('${order['name']}\'s Order',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                const Spacer(),
                                const Text('Takeaway',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Visibility(
                                child: Row(
                                  children: [
                                    Text('${amount[index]} ${product[index]}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    const Spacer(),
                                    Text(price[index],
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                  ],
                                )
                            ),
                            const SizedBox(height: 10),
                            //
                            // const SizedBox(height: 10,),
                            Text('Total Amount: ${price[index]} ',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )


    );
  }



}