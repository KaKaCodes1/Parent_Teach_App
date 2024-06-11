import 'package:flutter/material.dart';
import 'package:parentteach/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreencopy extends StatefulWidget {
  const RegistrationScreencopy({super.key});

  @override
  State<RegistrationScreencopy> createState() => _RegistrationScreencopyState();
}

class _RegistrationScreencopyState extends State<RegistrationScreencopy> {
  bool obscureText = true; // Initially, password is obscured

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String fullName;
  late String username;
  late String location;
  late String dateOfBirth;

  final ButtonStyle myButtons = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40),
    backgroundColor: const Color.fromARGB(255, 249, 249, 207),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 230, 119),
        title: const Center(
          child: Text(
            'Create A New Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 6, 6, 111),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 254, 230, 119),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromARGB(255, 245, 236, 204)),
              width: 448,
              //height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/LOGO.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    inputField(
                      label: 'Full Name',
                      hintText: 'Enter Your Full Name',
                      onChanged: (value) {
                        fullName = value;
                      },
                    ),
                    inputField(
                      label: 'Username',
                      hintText: 'Enter Your Username',
                      onChanged: (value) {
                        username = value;
                      },
                    ),
                    inputField(
                      label: 'Email',
                      hintText: 'Enter Your Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    inputField(
                      label: 'Password',
                      hintText: 'Enter Your Password',
                      obscureText: obscureText,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    inputField(
                      label: 'Location',
                      hintText: 'Enter Your Location',
                      onChanged: (value) {
                        location = value;
                      },
                    ),
                    inputField(
                      label: 'Date of Birth',
                      hintText: 'Enter Your Date of Birth',
                      onChanged: (value) {
                        dateOfBirth = value;
                      },
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          if (newUser != null) {
                            // Navigate to the next screen
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      style: myButtons,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 6, 111),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account, '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Log In!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 6, 6, 111),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required String label,
    required String hintText,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
            suffixIcon: label=='Password'// Check if label is "Password"
            ?obscureText
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility,
                    ),
                    onPressed: onTap,
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                    ),
                    onPressed: onTap,
                  )
            :null,//if it is not, it will not show the suffix icon      
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
