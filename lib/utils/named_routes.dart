

import 'package:flutter/cupertino.dart';
import 'package:resume_bulider/screen/home/home_screen.dart';
import 'package:resume_bulider/screen/splesh/splesh_screen.dart';
import 'package:resume_bulider/screen/user%20input/achievements.dart';
import 'package:resume_bulider/screen/user%20input/carrier_info.dart';
import 'package:resume_bulider/screen/user%20input/contact_screen.dart';
import 'package:resume_bulider/screen/user%20input/declaration.dart';
import 'package:resume_bulider/screen/user%20input/education.dart';
import 'package:resume_bulider/screen/user%20input/experiences.dart';
import 'package:resume_bulider/screen/user%20input/hobbies_info.dart';
import 'package:resume_bulider/screen/user%20input/personal_details.dart';
import 'package:resume_bulider/screen/user%20input/projects.dart';
import 'package:resume_bulider/screen/user%20input/references.dart';
import 'package:resume_bulider/screen/user%20input/skills_info.dart';

Map <String ,WidgetBuilder> routes1={
  "/":(context)=>SpleshScreen(),
  "home":(context)=> HomeScreen(),
  "1":(context)=> ContactInfo(),
  "2":(context)=> CarrierInfo(),
  "3":(context)=> PersonalDetails(),
  "4":(context)=> Education(),
  "5":(context)=> Experiences(),
  "6":(context)=> SkillsInfo(),
  "7":(context)=> Hobbies(),
  "8":(context)=> Projects(),
  "9":(context)=> Achievements(),
  "10":(context)=> References(),
  "11":(context)=> Declaration(),
};