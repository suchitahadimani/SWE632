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
      backgroundColor: Colors.purple, // Set background color to purple
      body: Center(
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
                        color:
                            Colors.purple, // Set text color to match the theme
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
    );
  }
}

//CREATE ROOM PAGE

class PageOne extends StatefulWidget {
  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  int? _randomNumber;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber =
          Random().nextInt(10000); // Generates a random number between 0 and 99
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Room',
          style: TextStyle(
            color: Colors.white,
          ),
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
      backgroundColor:
          Colors.purple, // Set the Scaffold background color to purple
      body: Center(
        child: Container(
          width: 500, // Set a fixed width for the card
          child: Card(
            color: const Color.fromARGB(255, 211, 153, 250), // Lavender color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Only show the button if no room code is generated
                  if (_randomNumber == null) ...[
                    ElevatedButton(
                      onPressed: _generateRandomNumber,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple, // Text color
                        backgroundColor: Colors.white, // Button color
                        minimumSize: Size(200, 50), // Size of the button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      child: Text('Generate Room Code'),
                    ),
                    SizedBox(height: 20),
                  ],
                  if (_randomNumber != null) ...[
                    Text(
                      'Room Code: $_randomNumber',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageThree()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple, // Text color
                        backgroundColor: Colors.white, // Button color
                        minimumSize: Size(200, 50), // Size of the button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('iMessage'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('WhatsApp'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Telegram'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Mail'),
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
  String? enteredCode;

  void _submitCode() {
    setState(() {
      enteredCode = _controller.text;
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
        title: Text(
          'Join Room',
          style: TextStyle(
            color: Colors.white,
          ),
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
      backgroundColor:
          Colors.purple, // Set the Scaffold background color to purple
      body: Center(
        child: Container(
          width: 300, // Set the width of the square
          height: 300, // Set the height of the square
          child: Card(
            color: const Color.fromARGB(255, 211, 153, 250), // Lavender color
            elevation: 4, // Adds shadow for a card-like appearance
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Optional: Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center items vertically
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
                    onPressed: () {
                      // Check if the text field is not empty
                      if (_controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageThree()),
                        );
                      } else {
                        // Show a dialog or snackbar if the input is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please enter a code before submitting.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple, // Text color
                      backgroundColor:
                          Color.fromARGB(255, 244, 240, 246), // Lavender color
                      minimumSize: Size(double.infinity, 50), // Button width
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
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
      backgroundColor: Colors.purple, // Set the background color to purple
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Left Card: Square and Small
            Container(
              width: 300, // Width of the square card
              height: 300, // Height of the square card
              child: Card(
                color: Colors.white, // Card color white
                elevation: 4, // Shadow for card appearance
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // TextField
                      TextField(
                        controller: _optionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter an Option',
                        ),
                      ),
                      SizedBox(height: 20),
                      // Add Option Button
                      ElevatedButton(
                        onPressed: _addOption,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple, // Button text color
                          backgroundColor: Color.fromARGB(
                              255, 211, 153, 250), // Lavender button color
                          minimumSize:
                              Size(double.infinity, 50), // Button width
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        child: Text('Add Option'),
                      ),
                      SizedBox(height: 20),
                      // Randomize Button
                      ElevatedButton(
                        onPressed: _randomizeOption,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple, // Button text color
                          backgroundColor: Color.fromARGB(
                              255, 211, 153, 250), // Lavender button color
                          minimumSize:
                              Size(double.infinity, 50), // Button width
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        child: Text('Randomize'),
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
                height: 300, // Height of the card
                child: Card(
                  color: Colors.white, // Card color white
                  elevation: 4, // Shadow for card appearance
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
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
            description: 'Click next to start using the app.',
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
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(item.imageUrl),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
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
