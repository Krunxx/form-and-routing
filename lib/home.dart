import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var selectedGender = 'Female';
  var genders = ['Female', 'Male'];

  var formKey = GlobalKey<FormState>();
  var hidePassword = true;

  TextEditingController fbProfileLink = TextEditingController();
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
              controller: fbProfileLink,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                  labelText: "Facebook Profile Link"
              ),
              validator: (value){
                if (value == null || value == ''){
                  return "Please enter your fb profile link";
                }

                if(!value.isUrl()){
                  return "Please enter your fb profile link";
                }
                return null;
              },
            ),
            TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email Address"

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
              keyboardType: TextInputType.number,
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
              validator: (value){
                if (value == null || value == ''){
                  return "Please enter your password";
                }

                if(value.length < 8){
                  return "Password must be at least 8 characters long";
                }
                return null;
              },
            ),
            DropdownButtonFormField(
                items: [
                  ...genders.map((gender) => DropdownMenuItem(
                    value: gender,
                      child: Text(gender)
                  ))
                ],
                value: selectedGender,
                onChanged: (value){
                  selectedGender = value!;
                }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text("Gender"),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: (){

                              },
                              child: Text("Female")
                          ),
                          TextButton(
                              onPressed: (){

                              },
                              child: Text("Male")
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                 formKey.currentState?.validate();
                },
                child: Text("Login"))
          ],
        ),
      )
    );
  }
}
