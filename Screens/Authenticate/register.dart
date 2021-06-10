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
        title: Text('Sign up to easypisy'),
        actions: [
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Sign in'),
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
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    dynamic returnValue = await _auth.registerWithEmailAndPassword(email, password);
                    if(returnValue == null){
                      setState(()=> error = 'Please supply a valid Email Id');
                    }
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white,),
                ),
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
