import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parentteach/screen/registration_screencopy.dart';

class LoginScreencopy extends StatefulWidget {
  const LoginScreencopy({super.key});

  @override
  State<LoginScreencopy> createState() => _LoginScreencopyState();
}

class _LoginScreencopyState extends State<LoginScreencopy> {
  bool obscureText = true; // Initially, password is obscured
  
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

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
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 6, 6, 111),
            ),
          ),
        ),
      ),
    body: Container(
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
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/LOGO.png',
                    width: 200,
                    height: 200,
                  ),
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
    
                  const SizedBox(height: 5),
    
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final user =
                            await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (user != null) {
                          // Navigate to the next screen
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: myButtons,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 6, 111),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreencopy(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register!',
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
    );
  }



//Styling and modifying the functionalities the input fields
  Widget inputField({
    required String label,
    required String hintText,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
    VoidCallback? onTap,
    TextEditingController? controller,
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
          height: 10,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),         
            
            //this is to create the visibility icon button
            suffixIcon: label=='Password'// Check if label is "Password"
            ?obscureText
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 6, 6, 111),
                    ),
                    onPressed: onTap,
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Color.fromARGB(255, 6, 6, 111),
                    ),
                    onPressed: onTap,
                  )
            :null,//if it is not Password, it will not show the suffix icon 

            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:Color.fromARGB(255, 6, 6, 111),),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}