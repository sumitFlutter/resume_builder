import 'package:flutter/material.dart';
import 'package:resume_bulider/utils/color.dart';
class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, 'home'),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/1.png",height: 100,width: 100,),
            const SizedBox(height: 8,),
             Text("Resume Builder",style: TextStyle(fontWeight: FontWeight.bold,color: prime_b),)
          ],
        ),
      ),
    );
  }
}
