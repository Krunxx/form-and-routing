import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var formKey = GlobalKey<FormState>();
  var hidePassword = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Form Handling'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username"
              ),
              validator: (value){
                if (value == null || value == ''){
                  return "Please enter your username";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: "Password",
                suffix: IconButton(
                  onPressed: (){
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                )
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  print(usernameController.text);
                  print(passwordController.text);

                  usernameController.text = "";
                  passwordController.text = "";
                },
                child: Text("Login"))
          ],
        ),
      )
    );
  }
}
