import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_widgets/widgets/5_text_field/7_fetch_api_future_builder.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: Exercise1SearchBar()));
}

class Exercise1SearchBar extends StatefulWidget {
  const Exercise1SearchBar({super.key});

  @override
  State<Exercise1SearchBar> createState() => _Exercise1SearchBarState();
}

class _Exercise1SearchBarState extends State<Exercise1SearchBar> {
  // WE USE A CONTROLLER TO CLEAR THE TEXT PROGRAMMATICALLY
  final TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    // initial  value
    _searchController.text = "123";
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isNotEmpty) {
          _showClearIcon = true;
        } else {
          _showClearIcon = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ex 1: Styling")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Search your favorite item:"),
            const SizedBox(height: 15),
            TextFormField(
              controller: _searchController,
              enabled: true,
              decoration: InputDecoration(
                hintText: "Search...",
                // PREFIX ICON
                prefixIcon: const Icon(Icons.search),
                // SUFFIX ICON (Only shows if text is not empty)
                suffixIcon: _showClearIcon
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          // LOGIC TO CLEAR TEXT

                          _searchController.clear();
                        },
                      )
                    : null,
                // ROUND BORDER
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), // Very round
                ),
                // ENABLED BORDER (Styling when not focused)
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                // FOCUSED BORDER (Styling when clicked)
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.yellow, width: 2),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResultScreen()),
                );
              },
              child: Text("Navigate To Success"),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RandomUser()),
                );
              },
              child: Text("Navigate to Randonm User"),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FetchApiFutureBuilder()),
                );
              },
              child: Text("Navigate Random User with Future Builder Uusage"),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    print("initState => in => ResultScreen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          "Success",
          style: TextStyle(color: Colors.green, fontSize: 45),
        ),
      ),
    );
  }
}

class RandomUser extends StatefulWidget {
  const RandomUser({super.key});

  @override
  State<RandomUser> createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {
  bool _isLoading = true;
  bool _isError = false;
  String? _errorDesc;
  String? _name;
  String? _email;

  @override
  void initState() {
    fetchInfoUser();
    super.initState();
  }

  /**
   * 
   * loading state
   * error state
   * success state
   * empty state
  */

  Future<Map<String, dynamic>> fetchInfoUser() async {
    try {
      final apiUrl = "https://randomuser.me/api/?inc=name,email";
      final response = await http.get(Uri.parse(apiUrl));
      await Future.delayed(Durations.medium4);
      if (response.statusCode == 200) {
        final bodyResponse = response.body;
        final bodySerialize = jsonDecode(bodyResponse) as Map<String, dynamic>;
        final results = bodySerialize['results'];
        print("bodyReponse: $bodyResponse");
        print("reuslt: ${bodySerialize['results']}");

        if (results.length == 0) return {};
        final item = results[0];
        print("item: $item");
        print(
          "name: ${item['name']["title"]} ${item['name']["first"]}  ${item['name']["last"]}",
        );
        print("email: ${item['email']}");
        final name =
            "${item['name']["title"]} ${item['name']["first"]}  ${item['name']["last"]}";
        final email = "${item['email']}";

        _name = name;
        _email = email;
        _isLoading = false;
        setState(() {});
      }
      return {};
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorDesc = e.toString();
      });
      return {};
    }
  }

  _buildView() {
    if (_isError) return Center(child: Text("Error:$_errorDesc"));
    if (_isLoading) return Center(child: CircularProgressIndicator());
    return Column(children: [Text("Name: $_name"), Text("Email: $_email")]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random User"), centerTitle: true),
      body: _buildView(),
    );
  }
}
