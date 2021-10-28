part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

// ignore: must_be_immutable
class CountrySearchDoneState extends CountryState {
  List<CountryModel> countryData;
  CountrySearchDoneState({this.countryData});
  CountrySearchDoneState copyWith({CountryModel countryData}) {
    return CountrySearchDoneState(countryData: countryData ?? this.countryData);
  }
}

class CountrySearchOnState extends CountryState {}
