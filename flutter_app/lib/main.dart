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
      home: OnboardingPage1(),
    );
  }
}

//Main Menu

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/title.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Individual User Box
              Container(
                width: 200,
                height: 210,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Individual',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: const Color.fromARGB(255, 211, 153, 250),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageThree(
                                      roomCode: "Individual Mode",
                                      breadcrumbPath: [
                                        'Home',
                                        'Random Generator'
                                      ],
                                    )),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'Random Selector',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Group User Box
              Container(
                width: 200,
                height: 210,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Group',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: const Color.fromARGB(255, 211, 153, 250),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageOne()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'Create Room',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: const Color.fromARGB(255, 211, 153, 250),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageTwo()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'Join Room',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//CREATE ROOM PAGE

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/create_room2.png'), // Update with your file path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          // Foreground Content
          Center(
            child: Container(
              width: 500,
              child: Stack(
                children: [
                  Card(
                    color: const Color.fromARGB(255, 211, 153, 250),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Choose an Option to Create Room:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RoomCreationPage(isRandom: true),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.purple,
                              backgroundColor: Colors.white,
                              minimumSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Generate Random Code'),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RoomCreationPage(isRandom: false),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.purple,
                              backgroundColor: Colors.white,
                              minimumSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Create Custom Code'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      'Step 1/2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ROOM CREATION PAGE (Handles Random/Custom Code Creation & Sharing)

class RoomCreationPage extends StatefulWidget {
  final bool isRandom; // True for random code, false for custom code

  RoomCreationPage({required this.isRandom});

  @override
  _RoomCreationPageState createState() => _RoomCreationPageState();
}

class _RoomCreationPageState extends State<RoomCreationPage> {
  int? _randomNumber;
  String? _customCode;
  String? _errorMessage;

  // Method to generate a random number
  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(10000); // Generate random code
      _customCode = null; // Reset custom code
      _errorMessage = null; // Reset error message
    });
  }

  // Show success dialog (e.g., after sharing code)
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(
              'Code successfully shared. (Pretend it shares because we don\'t have a backend for this project)'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Validate custom room code input
  void _validateCustomCode(String value) {
    if (value.length > 4 || !RegExp(r'^[0-9]*$').hasMatch(value)) {
      setState(() {
        _errorMessage = 'Please enter up to 4 digits (0-9).';
        _customCode = null; // Invalidate custom code if input is invalid
      });
    } else {
      setState(() {
        _customCode = value; // Set valid custom code
        _errorMessage = null; // Clear error message if input is valid
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isRandom) {
      _generateRandomNumber(); // Auto-generate random code on page load if `isRandom` is true
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/create_room2.png'), // Replace with your image path
                fit: BoxFit
                    .cover, // This will make the image cover the entire background
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          // Main content
          Center(
            child: Container(
              width: 600,
              child: Stack(
                children: [
                  // Card with content
                  Card(
                    color: const Color.fromARGB(255, 211, 153, 250),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (widget.isRandom && _randomNumber != null) ...[
                            // Display random generated room code
                            Text(
                              'Generated Room Code: $_randomNumber',
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed:
                                  _generateRandomNumber, // Regenerate random code
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purple,
                                backgroundColor: Colors.white,
                                minimumSize: Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Regenerate Code'),
                            ),
                          ] else if (!widget.isRandom) ...[
                            // Custom code input field
                            Text(
                              'Please enter up to four digits (0-9):',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Custom Room Code',
                                errorText: _errorMessage,
                              ),
                              onChanged:
                                  _validateCustomCode, // Validate as user types
                            ),
                          ],
                          SizedBox(height: 20),
                          // Show "Go to Room" button only when a code is valid
                          if (_randomNumber != null ||
                              (_customCode != null &&
                                  _customCode!.length > 0)) ...[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageThree(
                                      roomCode: _customCode ??
                                          _randomNumber.toString(),
                                      breadcrumbPath: [
                                        'Home',
                                        'Create Room',
                                        'Random Generator'
                                      ],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purple,
                                backgroundColor: Colors.white,
                                minimumSize: Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Go to Room'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Share the code with friends.',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            // Row of sharing options
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _showSuccessDialog();
                                  },
                                  icon: Image.asset(
                                    'assets/imessage.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: Text('iMessage'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _showSuccessDialog();
                                  },
                                  icon: Image.asset(
                                    'assets/WhatsApp_icon.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: Text('WhatsApp'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _showSuccessDialog();
                                  },
                                  icon: Image.asset(
                                    'assets/Telegram_icon.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: Text('Telegram'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.lightBlueAccent,
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _showSuccessDialog();
                                  },
                                  icon: Image.asset(
                                    'assets/mail.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: Text('Mail'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      'Step 2/2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//JOIN ROOM PAGE

class PageTwo extends StatefulWidget {
  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage; // Variable to store error message

  void _submitCode() {
    String enteredCode = _controller.text;

    // Validate input: Allow up to 4 digits (0-9)
    if (enteredCode.isEmpty || !RegExp(r'^[0-9]{1,4}$').hasMatch(enteredCode)) {
      setState(() {
        _errorMessage = 'Please enter up to four digits (0-9).';
      });
    } else {
      setState(() {
        _errorMessage = null; // Clear error if input is valid
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageThree(
                  roomCode: enteredCode,
                  breadcrumbPath: ['Home', 'Join Room', 'Random Generator'],
                )),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/join_room2.png'), // Replace with your image path
                fit: BoxFit
                    .cover, // Ensure the image covers the entire background
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          // Main content
          Center(
            child: Container(
              width: 300,
              height: 300,
              child: Card(
                color: const Color.fromARGB(255, 211, 153, 250),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _controller,
                        keyboardType: TextInputType
                            .number, // Set keyboard to number input
                        maxLength: 4, // Limit the input to four digits
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Room Code',
                          errorText:
                              _errorMessage, // Show error message if input is invalid
                        ),
                        onSubmitted: (_) =>
                            _submitCode(), // Submit when Enter is pressed
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitCode,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Color.fromARGB(255, 244, 240, 246),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// RANDOM GENERATOR

class PageThree extends StatefulWidget {
  final String roomCode; // Room code to display
  final List<String> breadcrumbPath; // List of breadcrumbs to display

  // Constructor that accepts roomCode and breadcrumbPath
  PageThree({required this.roomCode, required this.breadcrumbPath});

  @override
  PageThreeState createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {
  final TextEditingController _optionController = TextEditingController();
  List<String> _options = [];
  String? _selectedOption;
  int? _editingIndex;
  final FocusNode _focusNode = FocusNode();

  // Add or edit option in the list
  void _addOrEditOption() {
    if (_editingIndex != null) {
      // Editing an existing option
      setState(() {
        _options[_editingIndex!] = _optionController.text;
        _editingIndex = null;
      });
    } else {
      // Adding a new option
      if (_optionController.text.isNotEmpty) {
        setState(() {
          _options.add(_optionController.text);
        });
      }
    }
    _optionController
        .clear(); // Optionally clear the text field after submission.
    _focusNode.requestFocus(); // Ensure the text field is focused again
  }

  // Edit the option at the given index
  void _editOption(int index) {
    setState(() {
      _optionController.text = _options[index];
      _editingIndex = index;
    });
    _focusNode
        .requestFocus(); // Ensure focus stays on the text field while editing.
  }

  // Delete the option at the given index
  void _deleteOption(int index) {
    setState(() {
      _options.removeAt(index);
    });
  }

  // Randomize and select an option
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
    _optionController.dispose();
    _focusNode.dispose(); // Dispose of the focus node to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/random.png'), // Add your background image here
            fit:
                BoxFit.cover, // This will cover the whole screen with the image
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Place the buttons and breadcrumb navigation here
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  // Breadcrumb Navigation dynamically generated
                  for (int i = 0; i < widget.breadcrumbPath.length; i++) ...[
                    TextButton(
                      onPressed: () {
                        // Navigate to the appropriate page based on breadcrumb
                        if (widget.breadcrumbPath[i] == 'Home') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else if (widget.breadcrumbPath[i] == 'Join Room') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageTwo()),
                          );
                        } else if (widget.breadcrumbPath[i] == 'Create Room') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageOne()),
                          );
                        } else {}
                      },
                      child: Text(
                        widget.breadcrumbPath[i],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    if (i < widget.breadcrumbPath.length - 1)
                      Text(' > ', style: TextStyle(color: Colors.white)),
                  ],
                ],
              ),
              SizedBox(height: 20), // Add space below the breadcrumb row
              // Display Room Code at the top of the page
              Text(
                'Room Code: ${widget.roomCode}', // Display the room code here
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Add some space below the room code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Left Card: Square and Small
                  Container(
                    width: 300,
                    height: 300,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // TextField
                            TextField(
                              controller: _optionController,
                              focusNode:
                                  _focusNode, // Connect the FocusNode to the TextField
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: _editingIndex == null
                                    ? 'Enter an Option'
                                    : 'Edit Option',
                              ),
                              onSubmitted: (_) => _addOrEditOption(),
                            ),
                            SizedBox(height: 20),
                            // Randomize Button
                            ElevatedButton(
                              onPressed: _randomizeOption,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purple,
                                backgroundColor:
                                    Color.fromARGB(255, 211, 153, 250),
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Make Random Selection'),
                            ),
                            SizedBox(height: 20),
                            // Display the selected option
                            if (_selectedOption != null)
                              Text(
                                'Selected Option: $_selectedOption',
                                style: TextStyle(fontSize: 18),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Space between the cards
                  // Right Card: Longer
                  Expanded(
                    child: Container(
                      height: 300,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: _options.isEmpty
                                    ? Center(
                                        child: Text(
                                          'What to eat?\nOption #1: Pizza\nOption #2: Sushi\nOption #3: Burgers',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: _options.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(_options[index]),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Edit Button
                                                IconButton(
                                                  icon: Icon(Icons.edit,
                                                      color: Colors.purple),
                                                  onPressed: () =>
                                                      _editOption(index),
                                                ),
                                                // Delete Button
                                                IconButton(
                                                  icon: Icon(Icons.delete,
                                                      color: Colors.red),
                                                  onPressed: () =>
                                                      _deleteOption(index),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Onboarding Pages

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        pages: [
          OnboardingPageModel(
            title: 'Struggle making decisions?',
            description: 'We can help!',
            imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
            bgColor: Colors.indigo,
          ),
          OnboardingPageModel(
            title: 'Create and join rooms with your friends',
            description:
                'Everyone can add their choices and we\'ll make a choice for you',
            imageUrl: 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingPageModel(
            title: 'Struggling on your own?',
            description:
                'No problem! Just directly use our random decision maker to help you pick',
            imageUrl: 'https://i.ibb.co/420D7VP/building.png',
            bgColor: const Color(0xfffeae4f),
          ),
          OnboardingPageModel(
            title: 'Ready to get started?',
            description: 'Click finish to start using the app.',
            imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
            bgColor: Colors.purple,
          ),
        ],
        onSkip: (controller) {
          // Find the index of the page with the title 'Follow creators'
          const targetIndex = 3; // Index of the 'Follow creators' page
          controller.animateToPage(
            targetIndex,
            curve: Curves.easeInOutCubic,
            duration: const Duration(milliseconds: 250),
          );
        },
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final void Function(PageController) onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter({
    super.key,
    required this.pages,
    required this.onSkip,
    this.onFinish,
  });

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: item.textColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(
                                  item.description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: item.textColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 150, // Adjust the height to make room for the buttons
                child: Stack(
                  children: [
                    // Back Button on the Left
                    if (_currentPage > 0)
                      Positioned(
                        left: 16.0,
                        bottom: 16.0,
                        child: GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              _currentPage - 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: widget
                                      .pages[_currentPage].buttontextColor,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    color: widget
                                        .pages[_currentPage].buttontextColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    // Next or Finish Button on the Right
                    Positioned(
                      right: 16.0,
                      bottom: 16.0,
                      child: GestureDetector(
                        onTap: () {
                          if (_currentPage == widget.pages.length - 1) {
                            widget.onFinish?.call();
                          } else {
                            _pageController.animateToPage(
                              _currentPage + 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                _currentPage == widget.pages.length - 1
                                    ? 'Finish'
                                    : 'Next',
                                style: TextStyle(
                                  color: widget
                                      .pages[_currentPage].buttontextColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                _currentPage == widget.pages.length - 1
                                    ? Icons.check
                                    : Icons.arrow_forward,
                                color:
                                    widget.pages[_currentPage].buttontextColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Skip Button if not at last page
                    if (_currentPage < widget.pages.length - 1)
                      Positioned(
                        right: 16.0,
                        bottom: 80.0,
                        child: GestureDetector(
                          onTap: () {
                            widget.onSkip(_pageController);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: widget
                                        .pages[_currentPage].buttontextColor,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.skip_next,
                                  color: widget
                                      .pages[_currentPage].buttontextColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;
  final Color buttontextColor;

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white,
      this.buttontextColor = Colors.black});
}
