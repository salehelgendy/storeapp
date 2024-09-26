class ProdectModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProdectModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  factory ProdectModel.fromJson(jsonData) {
    return ProdectModel(
      id: jsonData['id'],
      title: jsonData['title'],
      // تأكد من أن السعر يتم تحويله إلى double بشكل صحيح
      price: (jsonData['price'] is int)
          ? (jsonData['price'] as int).toDouble()
          : (jsonData['price'] is double)
              ? jsonData['price']
              : 0.0, // إذا كانت البيانات لا تحتوي على قيمة صالحة، استخدم قيمة افتراضية
      description: jsonData['description'] ?? 'No description available',
      image: jsonData['image'] ?? '',
      rating: RatingModel.fromJson(jsonData['rating']),
      category: jsonData['category'],
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    // تحقق من أن jsonData ليس null
    if (jsonData == null) {
      return RatingModel(rate: 0.0, count: 0); // استخدم قيم افتراضية إذا كان jsonData null
    }

    return RatingModel(
      // تأكد من أن التقييم يتم تحويله إلى double بشكل صحيح
      rate: (jsonData['rate'] is int)
          ? (jsonData['rate'] as int).toDouble()
          : (jsonData['rate'] is double)
              ? jsonData['rate']
              : 0.0, // استخدم قيمة افتراضية إذا لم تكن البيانات صالحة
      count: jsonData['count'] ?? 0,
    );
  }
}
