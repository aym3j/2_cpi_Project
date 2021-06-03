import 'package:flutter/material.dart';
import 'package:ii_cpi_project/models/user.dart';

const List<String> kWilaya = [
  "أدرار",
  "الشلف",
  "الأغواط",
  "أم البواقي",
  "باتنة",
  "بجاية",
  "بسكرة",
  "بشار",
  "البليدة",
  "البويرة",
  "تمنراست",
  "تبسة",
  "تلمسان",
  "تيارت",
  "تيزي وزو",
  "الجزائر",
  "الجلفة",
  "جيجل",
  "سطيف",
  "سعيدة",
  "سكيكيدة",
  "سيدي بلعباس",
  "عنابة",
  "قالمة",
  "قسنطينة",
  "المدية",
  "مستغانم",
  "المسيلة",
  "معسكر",
  "ورقلة",
  "وهران",
  "البيض",
  "إليزي",
  "برج بوعريريج",
  "بومرداس",
  "الطارف",
  "تندوف",
  "تسمسيلت",
  "الوادي",
  "خنشلة",
  "سوق الأهراس",
  "تيبازة",
  "ميلة",
  "عين الدفلى",
  "النعامة",
  "عين تموشنت",
  "غرداية",
  "غليزان",
  "المغير",
  "المنيعة",
  "أولاد جلال",
  "برج باجي مختار",
  "بني عباس",
  "تيميمون",
  "تقرت",
  "جانت",
  "عين صالح",
  "عين قزّام",
];

const List<String> kWilayaNumerated = [
  "1 - أدرار",
  "2 - الشلف",
  "3 - الأغواط",
  "4 - أم البواقي",
  "5 - باتنة",
  "6 - بجاية",
  "7 - بسكرة",
  "8 - بشار",
  "9 - البليدة",
  "10 - البويرة",
  "11 - تمنراست",
  "12 - تبسة",
  "13 - تلمسان",
  "14 - تيارت",
  "15 - تيزي وزو",
  "16 - الجزائر",
  "17 - الجلفة",
  "18 - جيجل",
  "19 - سطيف",
  "20 - سعيدة",
  "21 - سكيكيدة",
  "22 - سيدي بلعباس",
  "23 - عنابة",
  "24 - قالمة",
  "25 - قسنطينة",
  "26 - المدية",
  "27 - مستغانم",
  "28 - المسيلة",
  "29 - معسكر",
  "30 - ورقلة",
  "31 - وهران",
  "32 - البيض",
  "33 - إليزي",
  "34 - برج بوعريريج",
  "35 - بومرداس",
  "36 - الطارف",
  "37 - تندوف",
  "38 - تسمسيلت",
  "39 - الوادي",
  "40 - خنشلة",
  "41 - سوق الأهراس",
  "42 - تيبازة",
  "43 - ميلة",
  "44 - عين الدفلى",
  "45 - النعامة",
  "46 - عين تموشنت",
  "47 - غرداية",
  "48 - غليزان",
  "49 - المغير",
  "50 - المنيعة",
  "51 - أولاد جلال",
  "52 - برج باجي مختار",
  "53 - بني عباس",
  "54 - تيميمون",
  "55 - تقرت",
  "56 - جانت",
  "57 - عين صالح",
  "58 - عين قزّام",
];

Map wilayat = kWilaya.asMap();

const List<DropdownMenuItem<String>> vehicles = [
  DropdownMenuItem(value: "شاحنة مبردة", child: Text("شاحنة مبردة")),
  DropdownMenuItem(value: "شاحنة", child: Text("شاحنة")),
  DropdownMenuItem(value: "سيارة", child: Text("سيارة")),
  DropdownMenuItem(value: "دراجة", child: Text("دراجة")),
];

const List<DropdownMenuItem<String>> kWilayat = [
  DropdownMenuItem(value: "1 - أدرار", child: Text("1 - أدرار")),
  DropdownMenuItem(value: "2 - الشلف", child: Text("2 - الشلف")),
  DropdownMenuItem(value: "3 - الأغواط", child: Text("3 - الأغواط")),
  DropdownMenuItem(value: "4 - أم البواقي", child: Text("4 - أم البواقي")),
  DropdownMenuItem(value: "5 - باتنة", child: Text("5 - باتنة")),
  DropdownMenuItem(value: "6 - بجاية", child: Text("6 - بجاية")),
  DropdownMenuItem(value: "7 - بسكرة", child: Text("7 - بسكرة")),
  DropdownMenuItem(value: "8 - بشار", child: Text("8 - بشار")),
  DropdownMenuItem(value: "9 - البليدة", child: Text("9 - البليدة")),
  DropdownMenuItem(value: "10 - البويرة", child: Text("10 - البويرة")),
  DropdownMenuItem(value: "11 - تمنراست", child: Text("11 - تمنراست")),
  DropdownMenuItem(value: "12 - تبسة", child: Text("12 - تبسة")),
  DropdownMenuItem(value: "13 - تلمسان", child: Text("13 - تلمسان")),
  DropdownMenuItem(value: "14 - تيارت", child: Text("14 - تيارت")),
  DropdownMenuItem(value: "15 - تيزي وزو", child: Text("15 - تيزي وزو")),
  DropdownMenuItem(value: "16 - الجزائر", child: Text("16 - الجزائر")),
  DropdownMenuItem(value: "17 - الجلفة", child: Text("17 - الجلفة")),
  DropdownMenuItem(value: "18 - جيجل", child: Text("18 - جيجل")),
  DropdownMenuItem(value: "19 - سطيف", child: Text("19 - سطيف")),
  DropdownMenuItem(value: "20 - سعيدة", child: Text("20 - سعيدة")),
  DropdownMenuItem(value: "21 - سكيكيدة", child: Text("21 - سكيكيدة")),
  DropdownMenuItem(value: "22 - سيدي بلعباس", child: Text("22 - سيدي بلعباس")),
  DropdownMenuItem(value: "23 - عنابة", child: Text("23 - عنابة")),
  DropdownMenuItem(value: "24 - قالمة", child: Text("24 - قالمة")),
  DropdownMenuItem(value: "25 - قسنطينة", child: Text("25 - قسنطينة")),
  DropdownMenuItem(value: "26 - المدية", child: Text("26 - المدية")),
  DropdownMenuItem(value: "27 - مستغانم", child: Text("27 - مستغانم")),
  DropdownMenuItem(value: "28 - المسيلة", child: Text("28 - المسيلة")),
  DropdownMenuItem(value: "29 - معسكر", child: Text("29 - معسكر")),
  DropdownMenuItem(value: "30 - ورقلة", child: Text("30 - ورقلة")),
  DropdownMenuItem(value: "31 - وهران", child: Text("31 - وهران")),
  DropdownMenuItem(value: "32 - البيض", child: Text("32 - البيض")),
  DropdownMenuItem(value: "33 - إليزي", child: Text("33 - إليزي")),
  DropdownMenuItem(
      value: "34 - برج بوعريريج", child: Text("34 - برج بوعريريج")),
  DropdownMenuItem(value: "35 - بومرداس", child: Text("35 - بومرداس")),
  DropdownMenuItem(value: "36 - الطارف", child: Text("36 - الطارف")),
  DropdownMenuItem(value: "37 - تندوف", child: Text("37 - تندوف")),
  DropdownMenuItem(value: "38 - تسمسيلت", child: Text("38 - تسمسيلت")),
  DropdownMenuItem(value: "39 - الوادي", child: Text("39 - الوادي")),
  DropdownMenuItem(value: "40 - خنشلة", child: Text("40 - خنشلة")),
  DropdownMenuItem(value: "41 - سوق الأهراس", child: Text("41 - سوق الأهراس")),
  DropdownMenuItem(value: "42 - تيبازة", child: Text("42 - تيبازة")),
  DropdownMenuItem(value: "43 - ميلة", child: Text("43 - ميلة")),
  DropdownMenuItem(value: "44 - عين الدفلى", child: Text("44 - عين الدفلى")),
  DropdownMenuItem(value: "45 - النعامة", child: Text("45 - النعامة")),
  DropdownMenuItem(value: "46 - عين تموشنت", child: Text("46 - عين تموشنت")),
  DropdownMenuItem(value: "47 - غرداية", child: Text("47 - غرداية")),
  DropdownMenuItem(value: "48 - غليزان", child: Text("48 - غليزان")),
  DropdownMenuItem(value: "49 - المغير", child: Text("49 - المغير")),
  DropdownMenuItem(value: "50 - المنيعة", child: Text("50 - المنيعة")),
  DropdownMenuItem(value: "51 - أولاد جلال", child: Text("51 - أولاد جلال")),
  DropdownMenuItem(
      value: "52 - برج باجي مختار", child: Text("52 - برج باجي مختار")),
  DropdownMenuItem(value: "53 - بني عباس", child: Text("53 - بني عباس")),
  DropdownMenuItem(value: "54 - تيميمون", child: Text("54 - تيميمون")),
  DropdownMenuItem(value: "55 - تقرت", child: Text("55 - تقرت")),
  DropdownMenuItem(value: "56 - جانت", child: Text("56 - جانت")),
  DropdownMenuItem(value: "57 - عين صالح", child: Text("57 - عين صالح")),
  DropdownMenuItem(value: "58 - عين قزّام", child: Text("58 - عين قزّام")),
];

const bool demande = false;
const bool offer = true;

User thisUser;
