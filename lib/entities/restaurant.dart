class Restaurant {
  final String title;
  final String parkName;
  final String img;
  final String id;
  final String location;
  final String openTime;                
  final String closeTime;               
  final String price;                   
  final String menuType;                
  final String diningPlanType;          
  final List<String> acceptedDiningPlans; 
  final String typeofCuisine;           

  const Restaurant({
    required this.parkName,
    required this.img, 
    required this.title,
    required this.id,
    required this.location,
    required this.openTime,              
    required this.closeTime,             
    required this.price,                 
    required this.menuType,              
    required this.diningPlanType,        
    required this.acceptedDiningPlans,   
    required this.typeofCuisine,         
  });
}