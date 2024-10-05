import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  TextEditingController name_controller = TextEditingController(); //password
  TextEditingController email_controller = TextEditingController(); //email
  TextEditingController phone_controller = TextEditingController();

  Profile({super.key}); //password

  @override
  Widget build(BuildContext context) {
    name_controller.text = "Ziad Mohamed";
    email_controller.text = "ziad@gmail.com";
    phone_controller.text = "01015335748";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 80,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                //obscureText: Login_Cubit.get(context).pass,
                keyboardType: TextInputType.text,
                controller: name_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'user name',
                    hintText: 'Enter your name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'EMAIL',
                    hintText: 'Enter your Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: const Icon(Icons.check),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: phone_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your phone';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Enter your Phone',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
