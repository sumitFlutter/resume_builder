import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_bulider/utils/color.dart';
import 'package:resume_bulider/utils/named_routes.dart';

void main()
{
 SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
   statusBarColor: Colors.blueAccent
 ));
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white54
  )
  );
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: routes1,
    ),
  );
}