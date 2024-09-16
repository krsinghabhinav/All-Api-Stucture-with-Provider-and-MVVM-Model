// import 'package:flutter/foundation.dart';
// import 'package:hostelpedia/model/hostelViaIdModel.dart';
// import 'package:hostelpedia/repository/hostelViaId_Repo.dart';

// import '../response/apiResponse.dart';
// import '../utils/toastMess.dart';

// class HostelViaiDProvider with ChangeNotifier {
//   HostelviaidRepo hostelviaidRepo = HostelviaidRepo();

//   bool isLoading = false;
//   ApiResponse<hostelViaIdModel> hostelViaIdVM = ApiResponse.loading();

//   void sethostelViaIdVM(ApiResponse<hostelViaIdModel> response) {
//     hostelViaIdVM = response;
//     notifyListeners();
//   }

//   Future<void> gethostelViaIdVM() async {
//     sethostelViaIdVM(ApiResponse.loading());
//     isLoading = true;

//     try {
//       final data = await hostelviaidRepo.gethostelViaRepo();
//       sethostelViaIdVM(ApiResponse.completed(data));
//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       sethostelViaIdVM(ApiResponse.error(e.toString()));
//       toastMessage("API request failed: ${e.toString()}");
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:hostelpedia/model/hostelViaIdModel.dart';
import 'package:hostelpedia/repository/hostelViaId_Repo.dart';
import '../response/apiResponse.dart';
import '../utils/toastMess.dart';

class HostelViaIdProvider with ChangeNotifier {
  final HostelviaidRepo _hostelviaidRepo = HostelviaidRepo();

  bool isLoading = false;
  ApiResponse<hostelViaIdModel> hostelViaIdVM = ApiResponse.loading();

  void setHostelViaIdVM(ApiResponse<hostelViaIdModel> response) {
    hostelViaIdVM = response;
    notifyListeners();
  }

  Future<void> getHostelViaIdVM() async {
    setHostelViaIdVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    try {
      // final data =
      await _hostelviaidRepo.getHostelViaRepo().then((value) {
        setHostelViaIdVM(ApiResponse.completed(value));
        isLoading = false;
        notifyListeners();
      });

      // if (data != null) {
      // } else {
      // setHostelViaIdVM(ApiResponse.error('No data available.'));
      // toastMessage("No data returned from the API.");
      // }
    } catch (e) {
      setHostelViaIdVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
