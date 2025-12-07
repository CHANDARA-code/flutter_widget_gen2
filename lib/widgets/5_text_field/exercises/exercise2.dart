import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: ExerciseMenu()),
  );
}

// ==========================================
// MAIN MENU
// ==========================================
class ExerciseMenu extends StatelessWidget {
  const ExerciseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alternative Form Exercises")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TipCalculator()),
              ),
              child: const Text("Ex 1: Tip Calculator (Real-time)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileEditor()),
              ),
              child: const Text("Ex 2: Profile (Read/Edit Mode)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FeedbackForm()),
              ),
              child: const Text("Ex 3: Feedback (Char Limit)"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXAMPLE 1: Tip Calculator (Real-time Logic)
// Focus: onChanged, parsing numbers, setState
// ==========================================
class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;
  double _tipPercentage = 0.0;

  double get _totalAmount =>
      _billAmount + (_billAmount * (_tipPercentage / 100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tip Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // BILL AMOUNT INPUT
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Bill Amount",
                prefixText: "\$ ",
                border: OutlineInputBorder(),
              ),
              // We use onChanged to update state immediately as user types
              onChanged: (value) {
                setState(() {
                  _billAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 20),

            // TIP PERCENTAGE INPUT
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tip %",
                suffixText: "%",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _tipPercentage = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 40),

            // RESULT CARD
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Pay",
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  Text(
                    "\$${_totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "(Tip: \$${(_billAmount * (_tipPercentage / 100)).toStringAsFixed(2)})",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXAMPLE 2: Profile Editor (Toggle Mode)
// Focus: enabled/readOnly property, Controllers
// ==========================================
class ProfileEditor extends StatefulWidget {
  const ProfileEditor({super.key});

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  // Initialize with some fake data
  final _nameController = TextEditingController(text: "John Doe");
  final _bioController = TextEditingController(text: "Flutter Developer");

  bool _isEditing = false; // State to track mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          // EDIT BUTTON IN APP BAR
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing; // Toggle mode
              });
              if (!_isEditing) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Profile Saved!")));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: _isEditing ? Colors.orange : Colors.grey,
              child: Icon(
                _isEditing ? Icons.edit : Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // NAME FIELD
            TextField(
              controller: _nameController,
              // If not editing, field is disabled (looks like text)
              enabled: _isEditing,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // BIO FIELD
            TextField(
              controller: _bioController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                labelText: "Bio",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.info),
              ),
            ),
            const SizedBox(height: 20),

            if (_isEditing)
              const Text(
                "You are currently in Editing Mode",
                style: TextStyle(color: Colors.orange),
              ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXAMPLE 3: Feedback Form (Constraints)
// Focus: maxLength, maxLines, Validation
// ==========================================
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feedback Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Tell us what you think!",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),

              TextFormField(
                // Makes the box taller
                maxLines: 5,
                // Adds the "0/100" counter at bottom right
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: "Type your review here...",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please write something.";
                  }
                  if (value.length < 10) {
                    return "Review is too short (min 10 chars).";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Thank you for your feedback!"),
                      ),
                    );
                  }
                },
                child: const Text("Submit Review"),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors
          .grey[200], // Light background to show off the white input field
    );
  }
}
