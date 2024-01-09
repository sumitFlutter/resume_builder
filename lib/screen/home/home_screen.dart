import 'package:flutter/material.dart';
import 'package:resume_bulider/utils/color.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            toolbarHeight: 180,
            backgroundColor: prime_b,
            leading: Icon(Icons.menu,color: Colors.white,),
            centerTitle: true,
            title: const Text("Resume Builder",style: TextStyle(color: Colors.white),),
            flexibleSpace: const Align(alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text("Build Options",style: TextStyle(fontSize: 18,color: Colors.white),),
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Option(i: "1",title: "Contact Info",screen: "1"),
                Option(i: "2",title: "Carrier Objective",screen: "2"),
                Option(i: "3",title: "Personal Details",screen: "3"),
                Option(i: "4",title: "Education",screen: "4"),
                Option(i: "5",title: "Experiences",screen: "5"),
                Option(i: "6",title: "Technical Skills",screen: "6"),
                Option(i: "7",title: "Hobbies",screen: "7"),
                Option(i: "8",title: "Projects",screen: "8"),
                Option(i: "9",title: "Achievements",screen: "9"),
                Option(i: "10",title: "References",screen: "10"),
                Option(i: "11",title: "Declaration",screen: "11"),
              ],
            ),
          ),
        ));
  }
  Widget Option({required String i,required String title,required String screen})
  {
    return   InkWell(
      onTap: () {
        Navigator.pushNamed(context, "$screen");
      },
      child: Container(
        padding:  const EdgeInsets.all(20.0),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child:  Row(
          children: [
            Container(height:30,
                width:30,
                child: Image.asset("assets/image/$i.png",fit: BoxFit.fill,)),
            const SizedBox(width: 20,),
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
