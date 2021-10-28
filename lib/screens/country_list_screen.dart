import 'package:country/handlers/country_handler.dart';
import 'package:country/models/country_model.dart';
import 'package:country/screens/view_country_details_screen.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  final String regionName;
  final Color titleColor;
  final Color appBarColor;
  const CountryListScreen(
      {Key key,
      @required this.regionName,
      @required this.titleColor,
      @required this.appBarColor})
      : super(key: key);

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.appBarColor,
          title: Text(
            "Countries in ${widget.regionName} region",
            style: TextStyle(color: widget.titleColor),
          ),
        ),
        body: FutureBuilder<List<CountryModel>>(
            future: CountryHandler.getCountries(region: widget.regionName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
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
                                                countryDetails: snapshot
                                                    .data[index],
                                                regionThemeColor:
                                                    widget.appBarColor,
                                                titleColor:
                                                    widget.titleColor)));
                              },
                              leading: Hero(
                                tag: snapshot.data[index].name.common,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapshot.data[index].flags.png),
                                ),
                              ),
                              title: Text(snapshot.data[index].name.common),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: widget.appBarColor,
                  ),
                );
              }
            }),
      ),
    );
  }
}
