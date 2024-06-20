import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parentteach/screen/login_screencopy.dart';

class RegistrationScreencopy extends StatefulWidget {
  const RegistrationScreencopy({super.key});

  @override
  State<RegistrationScreencopy> createState() => _RegistrationScreencopyState();
}

class _RegistrationScreencopyState extends State<RegistrationScreencopy> {
  bool obscureText = true;

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String fullName;
  late String username;
  late String location;
  late String dateOfBirth;

  final TextEditingController _dateController = TextEditingController();

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
            'Create New Account',
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
                      controller: _dateController,
                      onChanged: (value) {
                        dateOfBirth = value;
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            dateOfBirth =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            _dateController.text = dateOfBirth;
                          });
                        }
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
                            //uses snackbar to notify user if Registration is successful
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Registration successful! Please log in.'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreencopy(),
                              ),
                            );
                          }
                        } catch (e) {
                          //uses snackbar to notify user if Registration failed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Registration failed. Please try again.'),
                              backgroundColor: Colors.red,
                            ),
                          );
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
                        const Text('Already have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreencopy(),
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
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          onTap: label == 'Date of Birth' ? onTap : null,
          readOnly: label == 'Date of Birth',
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
            suffixIcon: label == 'Password'
                ? obscureText
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
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 6, 6, 111),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
