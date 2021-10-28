part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  final String countryName;

  const CountryEvent({this.countryName});

  @override
  List<Object> get props => [countryName];
}

class CountrySearchEvent extends CountryEvent {
  const CountrySearchEvent({String countryName})
      : super(countryName: countryName);
}

class EndSearchEvent extends CountryEvent {}
