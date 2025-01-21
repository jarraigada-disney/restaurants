import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
       path: '/',
       name: HomeScreen.name,
       builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/restaurants',
      name: RestaurantsScreen.name,
      builder: (context, state) => const RestaurantsScreen(),
    ),
    GoRoute(
      path: '/merchandiseStore',
      name: MerchStore.name,
      builder: (context, state) => const MerchStore(),
    ),
    
  ],
);