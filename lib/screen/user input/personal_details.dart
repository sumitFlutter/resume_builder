import 'package:flutter/material.dart';
import 'package:resume_bulider/utils/color.dart';
import 'package:resume_bulider/utils/global.dart';
class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String selected="Single";
  TextEditingController d=TextEditingController();
  TextEditingController n=TextEditingController();
  GlobalKey<FormState> key=GlobalKey<FormState>();
  Widget PersonalDetails()
  {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38,spreadRadius: 0.1,blurRadius: 0.1)]),
      child:    Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text("DOB",style: TextStyle(fontSize: 18,color: prime_b),),
            const SizedBox(height: 15,),
            TextFormField(
              keyboardType: TextInputType.datetime,
              textInputAction:TextInputAction.next,
              controller: d,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                  label: Text("DD/MM/YYYY"),
                 ),
              validator: (value) {
                if(value!.isEmpty)
                {
                  return "Enter your DOB";
                }
    
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Marital Status",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(value: "Single", groupValue: selected, onChanged: (value) {
                  setState(() {
                    selected=value!;
                  });
                },
                ),
                const Text("Single",style: TextStyle(fontSize: 18))
              ],
            ),
            Row(
              children: [
                Radio(value: "Married", groupValue: selected, onChanged: (value) {
                  setState(() {
                    selected=value!;
                  });
                },
                ),
                const Text("Married",style: TextStyle(fontSize: 18))
              ],
            ),

            Text("Nationality",style: TextStyle(fontSize: 18,color: prime_b),),
            const SizedBox(height: 15,),
            TextFormField(
              textInputAction:TextInputAction.done,
              controller: n,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText: "Indian",
              ),
              validator: (value) {
                if(value!.isEmpty)
                {
                  return "Enter your Nationality";
                }

                return null;
              },
            ),
            const SizedBox(height: 25,),
            Center(
              child: ElevatedButton(onPressed: () {
                if (key.currentState!.validate()){
                  String dob=d.text;
                  String nation=n.text;
                  details.add({"dob":dob});
                  details.add({"nationality":nation});
                  details.add({"Marital Status":selected});
                  ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                      backgroundColor: Colors.white,
                      shape: Border.fromBorderSide(BorderSide(width: 12,color: prime_b)),
                      content:  const Center(
                          child: Text(
                            "Your information is updated",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ))));
                  Navigator.pop(context);
                }
    
              }, child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: prime_b,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: prime_b,
        ),
        centerTitle: true,
        title: const Text(
          "Personal Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: PersonalDetails(),
      ),
    );
  }
}
