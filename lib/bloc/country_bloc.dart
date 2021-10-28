import 'package:bloc/bloc.dart';
import 'package:country/handlers/country_handler.dart';
import 'package:country/models/country_model.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<CountryEvent>((event, emit) async {
      if (event is CountrySearchEvent) {
        emit(CountrySearchOnState());
        List<CountryModel> response = await CountryHandler.searchCountries(
            countryName: event.countryName);
        emit(CountrySearchDoneState(countryData: response));
      } else if (event is EndSearchEvent) {
        emit(CountryInitial());
      }
    });
  }
}
