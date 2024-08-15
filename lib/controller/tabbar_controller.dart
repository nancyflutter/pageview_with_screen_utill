import 'package:get/get.dart';

class TabBarController extends GetxController {
  final RxList<NameModel> sports = RxList<NameModel>([
    NameModel(name: "props"),
    NameModel(name: "futures"),
    NameModel(name: "mlb"),
    NameModel(name: "ncaab"),
    NameModel(name: "nba"),
  ]);
}

class NameModel {
  final String? name;

  NameModel({
    this.name,
  });
}
