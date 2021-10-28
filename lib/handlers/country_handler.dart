import 'package:country/models/country_model.dart';
import 'package:country/util/meta_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryHandler {
  static String baseUrl = MetaStrings.baseUrl;

  static Future<List<CountryModel>> getCountries({String region}) async {
    // try {
    http.Response response = await http.get(
        Uri.parse(baseUrl + MetaStrings.regionEndPoint + region.toLowerCase()));
    if (response.statusCode == 200) {
      return countryModelFromJson(response.body);
    } else {
      return [];
    }
  }
   static Future<List<CountryModel>> searchCountries({String countryName}) async {
    
    http.Response response = await http.get(
        Uri.parse(baseUrl + MetaStrings.searchCountryEndPoint + countryName.toLowerCase()));
    if (response.statusCode == 200) {
      return countryModelFromJson(response.body);
    } else {
      return [];
    }
  }
}
