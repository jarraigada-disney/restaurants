import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/repositories/arrival_window_repository.dart';
import 'package:restaurant_app/driver_adapter/data_sources/aw_data_source_imp.dart';
import 'package:restaurant_app/driver_adapter/repositories/aw_repository_imp.dart';
import 'package:restaurant_app/presentation/providers/arrival_windows/aw_repository_provider.dart';

final nowOpenWindowsProvider = StateNotifierProvider<AwNotifier,List<String>>((ref){
  final refreshWindows = ref.watch(awRepositoryProvider).slotPeriod;
  
  return AwNotifier(
    refreshWindows: refreshWindows,
  );
});

typedef AwCallback = Future<List<String>> Function({required String restaurantId});

class AwNotifier extends StateNotifier<List<String>>{
  
  AwCallback refreshWindows;

  AwNotifier({
    required this.refreshWindows,
  }): super([]);

  Future<void> refreshArrivalWindows({required String restaurantId}) async{
    final List<String> aWindows = await refreshWindows(restaurantId: restaurantId);
    state = [...state,...aWindows]; 
  }


}