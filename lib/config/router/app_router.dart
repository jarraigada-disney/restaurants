import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
       path: '/',
       builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/restaurants',
      builder: (context, state) => Restaurant(
        id: 0001,
        name: "Sunshine Tree Terrace",
        parkName: "Magic Kingdom Park",
        img: "/Users/joel.arraigada/development/Flutter/Projects/restaurants/restaurant_app/assets/images/sunshine-tree-terrace-01-new.jpg"
      ),
    ),
    
  ],
);