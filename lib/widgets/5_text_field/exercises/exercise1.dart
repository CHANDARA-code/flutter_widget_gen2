import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: ExerciseMenu()),
  );
}

// ==========================================
// MAIN MENU (To navigate between exercises)
// ==========================================
class ExerciseMenu extends StatelessWidget {
  const ExerciseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Exercises Solution")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercise1SearchBar()),
              ),
              child: const Text("Ex 1: Round Search Bar"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercise2SignUp()),
              ),
              child: const Text("Ex 2: Sign Up Logic"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercise3Inventory()),
              ),
              child: const Text("Ex 3: Product Inventory"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 1: Round Search Bar
// ==========================================
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
    super.initState();
    // Listen to changes to hide/show the X icon
    _searchController.addListener(() {
      setState(() {
        _showClearIcon = _searchController.text.isNotEmpty;
      });
    });
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
            TextField(
              controller: _searchController,
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
                // FOCUSED BORDER (Styling when clicked)
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 2: Sign Up (Password Match)
// ==========================================
class Exercise2SignUp extends StatefulWidget {
  const Exercise2SignUp({super.key});

  @override
  State<Exercise2SignUp> createState() => _Exercise2SignUpState();
}

class _Exercise2SignUpState extends State<Exercise2SignUp> {
  final _formKey = GlobalKey<FormState>();

  // Controllers allow us to read the value of one field inside the validator of another
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirm = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Success! Accounts created.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ex 2: Validation Logic")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // EMAIL FIELD
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  // Simple regex for email
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(value)) return "Invalid Email";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // PASSWORD FIELD
              TextFormField(
                controller: _passController, // Assign controller
                obscureText: _obscurePass,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePass = !_obscurePass),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  if (value.length < 6) return "Min 6 characters";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // CONFIRM PASSWORD FIELD
              TextFormField(
                controller: _confirmPassController,
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_clock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";

                  // LOGIC: COMPARE WITH FIRST PASSWORD CONTROLLER
                  if (value != _passController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 3: Product Inventory (Data Types)
// ==========================================
class Exercise3Inventory extends StatefulWidget {
  const Exercise3Inventory({super.key});

  @override
  State<Exercise3Inventory> createState() => _Exercise3InventoryState();
}

class _Exercise3InventoryState extends State<Exercise3Inventory> {
  final _formKey = GlobalKey<FormState>();

  // Variables to hold data for the display text
  String? _name;
  String? _price;
  String? _stock;
  String _displayText = "";

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Saves data to variables
      setState(() {
        _displayText = "Added: $_name - \$$_price (Stock: $_stock)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ex 3: Inventory Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // PRODUCT NAME
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Required" : null,
                onSaved: (v) => _name = v,
              ),
              const SizedBox(height: 15),

              // PRICE (Number Only)
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price",
                  prefixText: "\$ ", // Shows $ inside the box
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Required" : null,
                onSaved: (v) => _price = v,
              ),
              const SizedBox(height: 15),

              // DESCRIPTION (Multiline)
              TextFormField(
                minLines: 3, // Starts at 3 lines tall
                maxLines: 5, // Can grow to 5 lines
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: "Description",
                  alignLabelWithHint: true, // Aligns label to top
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // STOCK (Validation > 0)
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Stock Qty",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  int? stock = int.tryParse(value);
                  if (stock == null || stock < 0) {
                    return "Must be 0 or more";
                  }
                  return null;
                },
                onSaved: (v) => _stock = v,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _addProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("ADD PRODUCT"),
              ),

              const SizedBox(height: 20),
              // RESULT DISPLAY
              if (_displayText.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.green[100],
                  child: Text(
                    _displayText,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
