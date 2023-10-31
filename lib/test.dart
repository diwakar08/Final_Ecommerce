import 'package:flutter/material.dart';

class ScrollPositionExample extends StatefulWidget {
  @override
  _ScrollPositionExampleState createState() => _ScrollPositionExampleState();
}

class _ScrollPositionExampleState extends State<ScrollPositionExample> {
  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0.0;

  void refreshContent() {
    // Store the current scroll position
    scrollPosition = _scrollController.offset;

    // Simulate a refresh (replace this with your actual refresh logic)
    Future.delayed(Duration(seconds: 10), () {
      // Restore the scroll position after the refresh
      if (_scrollController.hasClients) {
        setState(() {
          _scrollController.jumpTo(scrollPosition);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Position Example'),
      ),
      body: ListView.builder(
        // controller: _scrollController, // Attach the ScrollController
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshContent,
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(home: ScrollPositionExample()));
}
