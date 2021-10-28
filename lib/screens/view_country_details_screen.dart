import 'package:country/models/country_model.dart';
import 'package:flutter/material.dart';

class ViewCountryDetails extends StatefulWidget {
  @required
  final CountryModel countryDetails;
  final Color regionThemeColor;
  final Color titleColor;
  const ViewCountryDetails(
      {Key key,
      @required this.countryDetails,
      @required this.regionThemeColor,
      @required this.titleColor})
      : super(key: key);

  @override
  _ViewCountryDetailsState createState() => _ViewCountryDetailsState();
}

class _ViewCountryDetailsState extends State<ViewCountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.countryDetails.name.common,
            style: TextStyle(color: widget.titleColor),
          ),
          backgroundColor: widget.regionThemeColor),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlagWidget(
                  widget: widget,
                ),
                DetailsWidget(widget: widget, ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key key,
    @required this.widget,

  }) : super(key: key);

  final ViewCountryDetails widget;
 

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.countryDetails.name.official,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Capital : ${widget.countryDetails.capital.first}",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Dialing Code : ${widget.countryDetails.idd.root}${widget.countryDetails.idd.suffixes.first}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Demonyms : ${widget.countryDetails.demonyms.eng.m}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Country Code : ${widget.countryDetails.cioc}"),
            ),
          ],
        ),
      ),
    );
  }
}

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ViewCountryDetails widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
          tag: widget.countryDetails.name.common,
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5)
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.countryDetails.flags.png))),
          )),
    );
  }
}
