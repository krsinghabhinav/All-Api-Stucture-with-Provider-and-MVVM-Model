import 'package:flutter/material.dart';
import 'package:yyyyyyyyy/repository/dynamicListdatamodal.dart';
import 'package:yyyyyyyyy/response/apiResponse.dart';
import 'package:yyyyyyyyy/utils/toastMess.dart';

class CountryProvider with ChangeNotifier {
  final CountriesRepository _countriesRepo = CountriesRepository();
  bool isLoading = false;
  ApiResponse<List<dynamic>> countryModelVM = ApiResponse.loading();
  void setcountryListVM(ApiResponse<List<dynamic>> response) {
    countryModelVM = response;
    notifyListeners();
  }

  Future<void> countryVm() async {
    setcountryListVM(ApiResponse.loading());
    isLoading = true;
    try {
      await _countriesRepo.fetchCountries().then((value) {
        setcountryListVM(ApiResponse.completed(value));
        print("print view modal...........................$value");
        isLoading = false;
      });
    } catch (e) {
      setcountryListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
