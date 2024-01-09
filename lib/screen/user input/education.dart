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
  TextEditingController x=TextEditingController();
  TextEditingController s=TextEditingController();
  Widget education() {
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
            Text("Course/Degree", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: d,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
               hintText:" B.Tech",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your Course name";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"course":value});
              },
            ),
            SizedBox(height: 15,),
            Text(
              "University/School/Institute", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: n,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText: "V.N.S.G.U."
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your School name";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"University/School/Institute":value});
              },
            ),
            const SizedBox(height: 15,),
            Text("Last year's percentage(%)", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: true),
              textInputAction: TextInputAction.next,
              controller: x,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText: "90",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your %";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"Last year's percentage(%)":value});
              },
            ),
            SizedBox(height: 15,),
            Text(
              "Passing Year", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: s,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText: "2019"
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your passing year";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"Passing Year":value});
              },
            ),
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
        child: education(),
      ),
    );
  }
}
