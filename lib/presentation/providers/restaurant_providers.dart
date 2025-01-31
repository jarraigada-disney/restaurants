import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentArrivalWindowsProvider = StateNotifierProvider<ArrivalWindowsNotifier,List<String>>(
  (ref)=> ArrivalWindowsNotifier()
);


class ArrivalWindowsNotifier extends StateNotifier<List<String>>{
  ArrivalWindowsNotifier(): super ([]);
}