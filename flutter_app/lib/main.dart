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
            image: AssetImage('assets/title.png'), // Path to your PNG file
            fit: BoxFit.cover, // Ensures the image covers the whole screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Create Room Card
              Card(
                color: const Color.fromARGB(255, 211, 153, 250),
                elevation: 5, // Add some elevation for shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageOne()),
                    );
                  },
                  child: Container(
                    width: 200, // Set a fixed width for the card
                    padding:
                        EdgeInsets.all(16), // Add some padding inside the card
                    child: Center(
                      child: Text(
                        'Create Room',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .purple, // Set text color to match the theme
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Join Room Card
              Card(
                color: const Color.fromARGB(255, 211, 153, 250),
                elevation: 5,
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
                    width: 200,
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
              SizedBox(height: 20),
              // Random Selector Card
              Card(
                color: const Color.fromARGB(255, 211, 153, 250),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageThree()),
                    );
                  },
                  child: Container(
                    width: 200,
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
      ),
    );
  }
}

//CREATE ROOM PAGE

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Join Room',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          width: 500,
          child: Card(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ),
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
  String? _errorMessage; // Error message to show when input is invalid

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(10000); // Generate random code
      _customCode = null; // Reset custom code
      _errorMessage = null; // Reset error message
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(
              'Code successfully shared. (Pretend it shares cuz we don\'t have a backend for this project)'),
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

  void _validateCustomCode(String value) {
    // Check if input contains non-numeric characters or is more than 4 digits
    if (value.length > 4 || !RegExp(r'^[0-9]*$').hasMatch(value)) {
      setState(() {
        _errorMessage = 'Please enter up to 4 digits (0-9).';
        _customCode = null; // Invalidate the custom code if input is invalid
      });
    } else {
      setState(() {
        _customCode = value; // Save the custom code if valid
        _errorMessage = null; // Clear error message if input is valid
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isRandom) {
      _generateRandomNumber(); // Auto-generate random code on page load
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Join Room',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          width: 600,
          child: Card(
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
                    // Display Random Code
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
                    // Display Custom Code Input
                    Text(
                      'Please enter up to four digits (0-9):',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType:
                          TextInputType.number, // Set keyboard to number input
                      maxLength: 4, // Limit the input to four digits
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Custom Room Code',
                        errorText:
                            _errorMessage, // Show error message if invalid
                      ),
                      onChanged:
                          _validateCustomCode, // Validate input as user types
                    ),
                  ],
                  SizedBox(height: 20),

                  // Show "Go to Room" button only when a code (random or custom) is valid
                  if (_randomNumber != null ||
                      (_customCode != null && _customCode!.length > 0)) ...[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageThree()),
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
        ),
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
        MaterialPageRoute(builder: (context) => PageThree()),
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
      appBar: AppBar(
        title: Text(
          'Join Room',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple,
      body: Center(
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
                    keyboardType:
                        TextInputType.number, // Set keyboard to number input
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
    );
  }
}

// RANDOM GENERATOR

class PageThree extends StatefulWidget {
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
    _optionController.clear();
    _focusNode.requestFocus();
  }

  // Edit the option at the given index
  void _editOption(int index) {
    setState(() {
      _optionController.text =
          _options[index]; // Pre-fill the input with the option
      _editingIndex = index; // Mark which option is being edited
    });
  }

  // Delete the option at the given index
  void _deleteOption(int index) {
    setState(() {
      _options.removeAt(index); // Remove the option from the list
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Selector',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
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
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: _editingIndex == null
                              ? 'Enter an Option'
                              : 'Edit Option',
                        ),
                        onSubmitted: (_) =>
                            _addOrEditOption(), // Submit option with Enter key
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:
                            _addOrEditOption, // Call the same function as Enter key
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Color.fromARGB(255, 211, 153, 250),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Submit'), // Text for the button
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _randomizeOption,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Color.fromARGB(255, 211, 153, 250),
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
                          'Selected Option:',
                          style: TextStyle(fontSize: 18),
                        ),
                      if (_selectedOption != null)
                        Text(
                          _selectedOption!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                          child: ListView.builder(
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
                                      onPressed: () => _editOption(index),
                                    ),
                                    // Delete Button
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () => _deleteOption(index),
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
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        widget.onSkip(_pageController);
                      },
                      child: const Text("Skip"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
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
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1
                                ? "Finish"
                                : "Next",
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _currentPage == widget.pages.length - 1
                                ? Icons.done
                                : Icons.arrow_forward,
                          ),
                        ],
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

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}