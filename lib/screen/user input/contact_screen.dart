import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_bulider/utils/color.dart';
import 'package:resume_bulider/utils/global.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  String? path;
  int index = 0;
  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController address1 = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Widget appbar(
      {required String title, required double width, required int indexed}) {
    return InkWell(
      onTap: () {
        setState(() {
          index = indexed;
        });
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.30,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(left: 35),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: width, color: Colors.yellow))),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Resume Builder",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                appbar(
                    width: index == 0 ? 3 : 0.1, title: "Contact", indexed: 0),
                appbar(width: index == 1 ? 3 : 0.1, title: "Image", indexed: 1),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: index,
        children: [
          contact(),
          photo(),
        ],
      ),
    );
  }

  Widget contact() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 0.1)
        ]),
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: name1,
                decoration: const InputDecoration(
                    label: Text("Name"), prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your name";
                  }

                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: email1,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your email";
                  } else if (!RegExp(
                          "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                      .hasMatch(value!)) {
                    return "enter the valid email";
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: phone1,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text("Phone"),
                    prefixIcon: Icon(Icons.mobile_friendly)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your phone number";
                  } else if ((value!.length != 10)) {
                    return "enter the valid number";
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: address1,
                decoration: const InputDecoration(
                    label: Text("Address"),
                    prefixIcon: Icon(Icons.location_on)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    String name = name1.text;
                    String email = email1.text;
                    String phone = phone1.text;
                    String address = address1.text;
                    details.add({"name": name});
                    details.add({"email": email});
                    details.add({"address": address});
                    details.add({"phone": phone});
                    ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                        backgroundColor: Colors.white,
                        shape: Border.fromBorderSide(BorderSide(width: 12,color: prime_b)),
                        content: const Center(
                            child: Text(
                          "Your information is updated",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))));
                    Navigator.pop(context);
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget photo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.sizeOf(context).height * 0.30,
        width: MediaQuery.sizeOf(context).width * 0.85,
        color: Colors.white,
        child:  Stack(
          alignment: Alignment.center,
          children: [
            path==null?
            const CircleAvatar(
              radius: 90,
            ): CircleAvatar(
              radius: 90,
              backgroundImage: FileImage(File(path!)),
            ),
             Align(
                alignment: Alignment(0.3, 0.3),
                child: IconButton(
                  onPressed: () async{
                   ImagePicker picker = ImagePicker();
                   XFile? image = await picker.pickImage(source: ImageSource.camera);
                   setState(() {
                     path=image!.path;
                   });

                  },
                  icon: const Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.blueAccent,
                    weight: 50,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
