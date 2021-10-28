// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.flag,
    this.flags,
    this.demonyms,
  });

  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  String status;
  bool unMember;
  Currency currencies;
  Idd idd;
  List<String> capital;
  List<String> altSpellings;
  String region;
  String subregion;
  Languages languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  double area;
  String flag;
  Flags flags;
  Demonyms demonyms;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? null
            : List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"] == null ? null : json["cca2"],
        ccn3: json["ccn3"] == null ? null : json["ccn3"],
        cca3: json["cca3"] == null ? null : json["cca3"],
        cioc: json["cioc"] == null ? null : json["cioc"],
        independent: json["independent"] == null ? null : json["independent"],
        status: json["status"] == null ? null : json["status"],
        unMember: json["unMember"] == null ? null : json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currency.fromJson(json['currencies'].values.toList().first
                // ignore: avoid_print
                ),
        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? null
            : List<String>.from(json["capital"].map((x) => x)),
        altSpellings: json["altSpellings"] == null
            ? null
            : List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"] == null ? null : json["region"],
        subregion: json["subregion"] == null ? null : json["subregion"],
        languages: json["languages"] == null
            ? null
            : Languages.fromJson(json["languages"]),
        translations: json["translations"] == null
            ? null
            : Map.from(json["translations"]).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x)),
        landlocked: json["landlocked"] == null ? null : json["landlocked"],
        area: json["area"] == null ? null : json["area"],
        flag: json["flag"] == null ? null : json["flag"],
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name.toJson(),
        "tld": tld == null ? null : List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2 == null ? null : cca2,
        "ccn3": ccn3 == null ? null : ccn3,
        "cca3": cca3 == null ? null : cca3,
        "cioc": cioc == null ? null : cioc,
        "independent": independent == null ? null : independent,
        "status": status == null ? null : status,
        "unMember": unMember == null ? null : unMember,
        // "currencies": currencies == null ? null : currencies.toJson(),
        "idd": idd == null ? null : idd.toJson(),
        "capital":
            capital == null ? null : List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": altSpellings == null
            ? null
            : List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region == null ? null : region,
        "subregion": subregion == null ? null : subregion,
        "languages": languages == null ? null : languages.toJson(),
        "translations": translations == null
            ? null
            : Map.from(translations)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng":
            latlng == null ? null : List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked == null ? null : landlocked,
        "area": area == null ? null : area,
        "flag": flag == null ? null : flag,
        "flags": flags == null ? null : flags.toJson(),
        "demonyms": demonyms == null ? null : demonyms.toJson(),
      };
}

class Currencies {
  Currencies({
    this.jpy,
  });

  Currency jpy;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        jpy: json["JPY"] == null ? null : Currency.fromJson(json["JPY"]),
      );

  Map<String, dynamic> toJson() => {
        "JPY": jpy == null ? null : jpy.toJson(),
      };
}

class Currency {
  Currency({
    this.name,
    this.symbol,
  });

  String name;
  String symbol;

  factory Currency.fromJson(Map<String, dynamic> json) {
    print(json);
    return Currency(
      name: json["name"] == null ? null : json["name"],
      symbol: json["symbol"] == null ? null : json["symbol"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "symbol": symbol == null ? null : symbol,
      };
}

class Demonyms {
  Demonyms({
    this.eng,
    this.fra,
  });

  Eng eng;
  Eng fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng == null ? null : eng.toJson(),
        "fra": fra == null ? null : fra.toJson(),
      };
}

class Eng {
  Eng({
    this.f,
    this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"] == null ? null : json["f"],
        m: json["m"] == null ? null : json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f == null ? null : f,
        "m": m == null ? null : m,
      };
}

class Flags {
  Flags({
    this.svg,
    this.png,
  });

  String svg;
  String png;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"] == null ? null : json["svg"],
        png: json["png"] == null ? null : json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg == null ? null : svg,
        "png": png == null ? null : png,
      };
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  String root;
  List<String> suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"] == null ? null : json["root"],
        suffixes: json["suffixes"] == null
            ? null
            : List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root == null ? null : root,
        "suffixes": suffixes == null
            ? null
            : List<dynamic>.from(suffixes.map((x) => x)),
      };
}

class Languages {
  Languages({
    this.jpn,
  });

  String jpn;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        jpn: json["jpn"] == null ? null : json["jpn"],
      );

  Map<String, dynamic> toJson() => {
        "jpn": jpn == null ? null : jpn,
      };
}

class Name {
  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  String common;
  String official;
  NativeName nativeName;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"] == null ? null : json["common"],
        official: json["official"] == null ? null : json["official"],
        nativeName: json["nativeName"] == null
            ? null
            : NativeName.fromJson(json["nativeName"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common == null ? null : common,
        "official": official == null ? null : official,
        "nativeName": nativeName == null ? null : nativeName.toJson(),
      };
}

class NativeName {
  NativeName({
    this.jpn,
  });

  Translation jpn;

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        jpn: json["jpn"] == null ? null : Translation.fromJson(json["jpn"]),
      );

  Map<String, dynamic> toJson() => {
        "jpn": jpn == null ? null : jpn.toJson(),
      };
}

class Translation {
  Translation({
    this.official,
    this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"] == null ? null : json["official"],
        common: json["common"] == null ? null : json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official == null ? null : official,
        "common": common == null ? null : common,
      };
}
