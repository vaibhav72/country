import 'package:country/bloc/country_bloc.dart';
import 'package:country/models/country_model.dart';
import 'package:country/screens/country_list_screen.dart';
import 'package:country/screens/search_country_screen.dart';
import 'package:country/screens/view_country_details_screen.dart';
import 'package:country/util/meta_color.dart';
import 'package:country/util/meta_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionList extends StatefulWidget {
  const RegionList({Key key}) : super(key: key);

  @override
  _RegionListState createState() => _RegionListState();
}

class _RegionListState extends State<RegionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Regions",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()));
                        },
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hintText: 'Search Countries',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      child: ListView.builder(
                          itemCount: MetaContent.regionList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MetaContent
                                        .regionList[index].regionThemeColor,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 5),
                                          color: MetaContent.regionList[index]
                                              .regionThemeColor
                                              .withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CountryListScreen(
                                                    regionName: MetaContent
                                                        .regionList[index]
                                                        .regionName,
                                                    titleColor: MetaContent
                                                        .regionList[index]
                                                        .regionTextColor,
                                                    appBarColor: MetaContent
                                                        .regionList[index]
                                                        .regionThemeColor,
                                                  )));
                                    },
                                    title: Text(
                                      MetaContent.regionList[index].regionName,
                                      style: TextStyle(
                                          color: MetaContent.regionList[index]
                                              .regionTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                ),
              ],
            )));
  }
}
