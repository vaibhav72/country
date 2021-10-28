import 'package:flutter/material.dart';
import 'package:country/bloc/country_bloc.dart';

import 'package:country/screens/country_list_screen.dart';
import 'package:country/screens/view_country_details_screen.dart';
import 'package:country/util/meta_color.dart';
import 'package:country/util/meta_content.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Search",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: MetaColor.searchColor,
              elevation: 0,
            ),
            body: BlocBuilder<CountryBloc, CountryState>(
              bloc: BlocProvider.of<CountryBloc>(context),
              builder: (context, state) {
                return Column(
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
                            onChanged: (String name) {
                              BlocProvider.of<CountryBloc>(context).add(
                                  CountrySearchEvent(countryName: name.trim()));
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
                    if (state is CountrySearchOnState)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    else if (state is CountrySearchDoneState)
                      Expanded(
                        child: Container(
                            child: state.countryData.isNotEmpty
                                ? ListView.builder(
                                    itemCount: state.countryData.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 2,
                                                    blurRadius: 12)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListTile(
                                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewCountryDetails(
                                                                countryDetails:
                                                                    state.countryData[
                                                                        index],
                                                                regionThemeColor:
                                                                    MetaColor
                                                                        .searchColor,
                                                                titleColor: Colors
                                                                    .black)));
                                              },
                                              leading: Hero(
                                                tag: state.countryData[index]
                                                    .name.common,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      state.countryData[index]
                                                          .flags.png),
                                                ),
                                              ),
                                              title: Text(state
                                                  .countryData[index]
                                                  .name
                                                  .common),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : Center(
                                    child: Text("No countries found "),
                                  )),
                      )
                    else
                      Container()
                  ],
                );
              },
            )));
  }
}
