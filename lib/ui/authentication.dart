import 'package:cryptowallet_firebase/net/flutterfire.dart';
import 'package:cryptowallet_firebase/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _emailField,
              decoration: const InputDecoration(
                hintText: 'something@email.com',
                hintStyle: TextStyle(color: Colors.white,
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _passwordField,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35,),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async{
                bool shouldNavigate = await register(_emailField.text, _passwordField.text);
                if(shouldNavigate){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),),);
                }
              },
              child: const Text('Register'),
              ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35,),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async{
                bool shouldNavigate = await signIn(_emailField.text, _passwordField.text);
                if(shouldNavigate){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),),);
                }
              },
              child: const Text('Login'),
              ),
          ),
        ],
      ),
    ),
    );
  }
}