enum AdStatus { active, pause, pending, rejected, ended }

class AdModel {
  final String imageUrl; 
  final String category;
  final String title;
  final String location;
  final String price;
  final String postedTime;
  final String remainingTime;
  final AdStatus status;

  AdModel({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.location,
    required this.price,
    required this.postedTime,
    required this.remainingTime,
    required this.status,
  });
}
