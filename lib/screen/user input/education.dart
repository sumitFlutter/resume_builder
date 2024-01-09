import 'package:flutter/material.dart';
import 'package:resume_bulider/utils/color.dart';
import 'package:resume_bulider/utils/global.dart';
class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  GlobalKey<FormState> key=GlobalKey<FormState>();
  TextEditingController d=TextEditingController();
  TextEditingController n=TextEditingController();
  Widget Education() {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 0.1)
          ]),
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("DOB", style: TextStyle(fontSize: 18, color: prime_b),),
            TextFormField(
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              controller: d,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                label: Text("DD/MM/YYYY"),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your DOB";
                }

                return null;
              },
            ),
            Text(
              "Nationality", style: TextStyle(fontSize: 18, color: prime_b),),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: n,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                label: Text("Indian"),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your Nationality";
                }

                return null;
              },
            ),
            const SizedBox(height: 25,),
            Center(
              child: ElevatedButton(onPressed: () {
                if (key.currentState!.validate()) {
                  String dob = d.text;
                  String nation = n.text;
                  details.add({"dob": dob});
                  details.add({"nationality": nation});
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.white,
                      shape: Border.fromBorderSide(
                          BorderSide(width: 12, color: prime_b)),
                      content: const Center(
                          child: Text(
                            "Your information is updated",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))));
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
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "Personal Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Education(),
      ),
    );
  }
}
