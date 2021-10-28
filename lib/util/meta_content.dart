import 'package:country/models/region_model.dart';
import 'package:country/util/meta_color.dart';
import 'package:flutter/material.dart';

class MetaContent {
  static List<RegionModel> regionList = [
    RegionModel(regionName: "Africa",regionThemeColor: MetaColor.regColorOne,regionTextColor: Colors.white),
    RegionModel(regionName: "Americas",regionThemeColor: MetaColor.regColorTwo,regionTextColor: Colors.white),
    RegionModel(regionName: "Asia",regionThemeColor: MetaColor.regColorThree,regionTextColor: Colors.white),
    RegionModel(regionName: "Europe",regionThemeColor: MetaColor.regColorFour,regionTextColor: Colors.black),
    RegionModel(regionName: "Oceania",regionThemeColor: MetaColor.regColorFive,regionTextColor: Colors.black),

  ];
}
