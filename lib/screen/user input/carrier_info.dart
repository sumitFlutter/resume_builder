import 'package:flutter/material.dart';
import 'package:resume_bulider/utils/color.dart';
import 'package:resume_bulider/utils/global.dart';

class CarrierInfo extends StatefulWidget {
  const CarrierInfo({super.key});

  @override
  State<CarrierInfo> createState() => _CarrierInfoState();
}

class _CarrierInfoState extends State<CarrierInfo> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: prime_b,
        leading: Icon(
          Icons.arrow_outward_outlined,
          color: prime_b,
        ),
        centerTitle: true,
        title: const Text(
          "Carrier Info",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            carrier(),
          ],
        ),
      ),
    );
  }

  Widget carrier() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 0.1)
          ]),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Carrier Objective",
                  style: TextStyle(fontSize: 18, color: prime_b),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 4,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(strokeAlign: 2)),
                      hintText: "Description"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter valid Description";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    String carrier = value;
                    details.add({"carrier": carrier});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 0.1)
          ]),
          child: Form(
            key: key1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Current Designation",
                  style: TextStyle(fontSize: 18, color: prime_b),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(strokeAlign: 2)),
                      hintText: "Software Engineer"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter valid Description";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    String cd = value;
                    details.add({"current designation": cd});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "Your Data Saved",
                  style: TextStyle(color: Colors.black),
                ),
                shape: Border.fromBorderSide(
                    BorderSide(width: 12, color: prime_b)),
                backgroundColor: Colors.white,
              ),
            );
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => prime_b)),
          child: const Center(
            child: Text(
              "Save and Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
