import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/global.dart';
class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  bool  c=false;
  bool  p=true;
  String gv="previously";
  GlobalKey<FormState> key=GlobalKey<FormState>();
  TextEditingController d=TextEditingController();
  TextEditingController n=TextEditingController();
  TextEditingController x=TextEditingController();
  TextEditingController s=TextEditingController();
  TextEditingController dn=TextEditingController();
  TextEditingController de=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: prime_b,
        leading: Icon(Icons.ac_unit_sharp,color: prime_b,),
        centerTitle: true,
        title: const Text(
          "Experience",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: education(),
      ),
    );
  }
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
            Text("Company Name", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: d,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText:" Microsoft ",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your past company name";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"company":value});
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
                details.add({"college/School/Institute":value});
              },
            ),
            const SizedBox(height: 15,),
            Text("Role", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: x,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 2)),
                hintText: "Software Engineer",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your role";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                details.add({"Role":value});
              },
            ),
            SizedBox(height: 15,),
            Text(
              "Employed Status", style: TextStyle(fontSize: 18, color: prime_b),),
            SizedBox(height: 10,),
            Row(
              children: [
                Radio(activeColor: prime_b,value:"previously", groupValue: gv, onChanged: (value) {
                  setState(() {
                    gv=value!;
                    if(gv=="previously")
                      {
                        p=true;
                        c=false;
                      }
                  });
                },),
                const Text("Previously"),
                Radio(activeColor:prime_b,value:"currently", groupValue: gv, onChanged: (value) {
                  setState(() {
                    gv=value!;
                    if(gv=="currently")
                    {
                      c=true;
                      p=false;
                    }
                  });
                },),
                const Text("currently"),
              ],
            ),
            Divider(),
             Visibility(
               visible: c,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date Joined",style: TextStyle(color: prime_b,fontSize: 18),),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.sizeOf(context).width*0.40,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      textInputAction:TextInputAction.next,
                      controller: dn,
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
                      onFieldSubmitted: (value) {
                        details.add({"date joined":value});
                      },
                    ),
                  ),
                ],
                           ),
             ),
            Visibility(
              visible: p,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date Joined",style: TextStyle(color: prime_b),),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width*0.35,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          textInputAction:TextInputAction.next,
                          controller: dn,
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
                          onFieldSubmitted: (value) {
                            details.add({"date joined":value});
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date Exit",style: TextStyle(color: prime_b),),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width*0.35,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          textInputAction:TextInputAction.next,
                          controller: de,
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
                          onFieldSubmitted: (value) {
                            details.add({"date exit":value});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
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
        ),
      ),
    );
  }
}
