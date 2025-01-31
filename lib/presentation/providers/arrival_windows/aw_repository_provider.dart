import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/driver_adapter/data_sources/aw_data_source_imp.dart';
import 'package:restaurant_app/driver_adapter/repositories/aw_repository_imp.dart';

//static version, only read:

final awRepositoryProvider = Provider((ref){


  return AwRepositoryImp(dataSource: AwDataSourceImp());
});



//With Refresh option version:
// class AwRepositoryProvider extends StateNotifier<List<String>>{
//   AwRepositoryProvider():super([]);

//   Future<void> fetchWindows() async {
//     final response = AwRepositoryImp(dataSource: AwDataSourceImp());  
//   }

//   void refresh(){
//     fetchWindows();
//   }

//   final awProvider = StateNotifierProvider<AwRepositoryProvider,List<String>>((ref){
//     return AwRepositoryProvider()..fetchWindows();
//   });
// }


// Create a provider for the repository
// final awRepositoryProvider = StateProvider((ref) {
//   return AwRepositoryImp(dataSource: AwDataSourceImp());
// });

// Create a FutureProvider for fetching slot periods

