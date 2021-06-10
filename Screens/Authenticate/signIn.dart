import 'package:easypisy/services/auth.dart';
import 'package:easypisy/shared/constants.dart';
import 'package:easypisy/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.blue[20],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        title: Text('Sign in to easypisy'),
        actions: [
          // ignore: deprecated_member_use
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val){
                  setState(() => email = val);
                },
                validator: (val) => val!.isEmpty ? 'Enter an Email': null,
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val){    // for password
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) => val!.length < 6 ? 'Enter a Password with 6 char long': null,
              ),
              SizedBox(height: 20.0,),

              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white,),
                ),
                onPressed: ()async{
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic returnValue = await _auth.signInWithEmailAndPassword(email, password);
                      //dynamic returnValue = await _auth.signOut();
                      if(returnValue == null){
                        print('i got null back here');
                        setState(() {
                          loading = false;
                          error = 'Invalid Email or Password';
                        });
                      }
                    }
                  },

              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}