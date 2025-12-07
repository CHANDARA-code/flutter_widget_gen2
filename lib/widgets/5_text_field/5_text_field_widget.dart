import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: TextFieldWidget()));
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isObscureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field Widget")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "123456",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 12),
            TextField(
              obscureText: _isObscureText,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "123456",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscureText = !_isObscureText;
                    });
                  },
                  icon: _isObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            Text(
              _isObscureText
                  ? "Text is not visible to see"
                  : "Text is visible to seee",
            ),
            SizedBox(height: 12),
            Text("Validation", style: TextStyle(fontSize: 32)),
            SizedBox(height: 12),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _isObscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }

                if (value.length < 8) {
                  return "Password is must be over than 8 charactor";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "123456",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscureText = !_isObscureText;
                    });
                  },
                  icon: _isObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            Text("Input Type", style: TextStyle(fontSize: 32)),
            SizedBox(height: 12),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              validator: (phone) {
                if (phone == null || phone.isEmpty) {
                  return "Phone is required";
                }

                final regex = RegExp(r'^[0-9]{8,15}');
                if (!regex.hasMatch(phone)) {
                  return "Phone Number is invalid";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "017445647",
                prefixIcon: Icon(Icons.phone_android_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Text("Email"),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }

                String pattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                RegExp regExp = RegExp(pattern);

                if (!regExp.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "example@gmail.com",
                prefixIcon: Icon(Icons.phone_android_outlined),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
