class Hotel {
  final String name; //nilai name hanya dapat diisi sekali ketika object dibuat.
  final String location;
  final String imageUrl;
  final double price;
  final double rating;

  const Hotel({
    required this.name, //nilai name wajib diberikan ketika membuat object Hotel.
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}