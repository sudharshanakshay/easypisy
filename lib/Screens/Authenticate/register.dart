import 'package:flutter/material.dart';
import 'package:easypisy/services/auth.dart';
import 'package:easypisy/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[20],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        title: const Text('Sign up to easypisy'),
        actions: [
          // ignore: deprecated_member_use
          FilledButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val) {
                  // for password
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) => val!.length < 6
                    ? 'Enter a Password with 6 char long'
                    : null,
              ),
              const SizedBox(
                height: 20.0,
              ),

              // ignore: deprecated_member_use
              FloatingActionButton(
                // color: Colors.blue[400],
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic returnValue = await _auth
                        .registerWithEmailAndPassword(email, password);
                    if (returnValue == null) {
                      setState(() => error = 'Please supply a valid Email Id');
                    }
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
