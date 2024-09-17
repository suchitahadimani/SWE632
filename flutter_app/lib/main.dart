import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decisions Decisions...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageOne()),
                );
              },
              child: Text('Create Room'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageTwo()),
                );
              },
              child: Text('Join Room'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageThree()),
                );
              },
              child: Text('Random Selector'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int? _randomNumber;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(100); // Generates a random number between 0 and 99
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Room',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('Generate Room Code'),
            ),
            SizedBox(height: 20),
            if (_randomNumber != null)
              Text(
                'Room Code: $_randomNumber',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SharePage()),
                );
              }, 
              child: Text('Share Code'))
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _controller = TextEditingController();
  String? _enteredCode;

  void _submitCode() {
    setState(() {
      _enteredCode = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Room',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Code',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitCode,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            if (_enteredCode != null)
              Text(
                'Joining Room...',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final TextEditingController _optionController = TextEditingController();
  List<String> _options = [];
  String? _selectedOption;

  void _addOption() {
    if (_optionController.text.isNotEmpty) {
      setState(() {
        _options.add(_optionController.text);
        _optionController.clear();
      });
    }
  }

  void _randomizeOption() {
    if (_options.length >= 2) {
      setState(() {
        _selectedOption = _options[Random().nextInt(_options.length)];
      });
    } else {
      setState(() {
        _selectedOption = 'Please enter at least two options.';
      });
    }
  }

  @override
  void dispose() {
    _optionController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Selector',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _optionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter an Option',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addOption,
              child: Text('Add Option'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _randomizeOption,
              child: Text('Randomize'),
            ),
            SizedBox(height: 20),
            if (_selectedOption != null)
              Text(
                'Selected Option: $_selectedOption',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_options[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('iMessage'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('WhatsApp'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Telegram'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Mail'),
            ),
          ],
        ),
      ),
    );
  }
}