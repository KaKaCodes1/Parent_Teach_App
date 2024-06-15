import 'package:flutter/material.dart';

class SubjectDialog extends StatefulWidget {
  const SubjectDialog({super.key});

  @override
  State<SubjectDialog> createState() => _SubjectDialogState();
}

class _SubjectDialogState extends State<SubjectDialog> {
  String selectedAge = '';//holds selected age

    final ButtonStyle dialogButtons = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40), 
    backgroundColor: const Color.fromARGB(255, 249, 249, 207),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      backgroundColor: Color.fromARGB(255, 232, 219, 162),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //   color: Colors.black.withOpacity(0.5),
          //   blurRadius: 7,
          //   // spreadRadius: 5,
          //   // offset: const Offset(0,3),
          //   ),

          // ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Age',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                //color:  Color.fromARGB(255, 6, 6, 111),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter age',
                labelStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),   
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onChanged: (value) {
                setState(() {
                  selectedAge = value;
                });
              },
            ),

            const SizedBox(height: 20,),

            const Text(
              'Select Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                //color:  Color.fromARGB(255, 6, 6, 111),
              ),
            ),            

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.photo_camera, color: Color.fromARGB(255, 6, 6, 111),),
                  label: const Text(
                    'Camera Scan', 
                    style: TextStyle(
                       color: Color.fromARGB(255, 6, 6, 111),
                    ),                    
                  ),
                  style: dialogButtons,
                  ),

                const SizedBox(
                  height: 10,
                ),   

                ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.photo,  color: Color.fromARGB(255, 6, 6, 111),),
                  label: const Text(
                    'Select From Gallery', 
                    style: TextStyle(
                       color: Color.fromARGB(255, 6, 6, 111),
                    ),
                    ),
                  style: dialogButtons,
                  ),

                const SizedBox(
                  height: 10,
                ), 

                ElevatedButton.icon(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  icon: const Icon(Icons.cancel, color: Color.fromARGB(255, 6, 6, 111),),
                  label: const Text(
                    'Cancel',
                    style: TextStyle(
                       color: Color.fromARGB(255, 6, 6, 111),
                    ),
                  ),
                  style: dialogButtons,
                  ),

                const SizedBox(
                  height: 10,
                ),                  
              ],
            ),
            
          ],
        ),
        ),
    );
  }
}