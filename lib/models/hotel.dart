class Hotel {
  String _name;
  String _location;
  String _imageUrl;
  double _price;
  double _rating;

  // Constructor
  Hotel({ //Sebelum object Hotel selesai dibuat, isi field _name dengan nilai name yang dikirim ke constructor.
    required String name,
    required String location,
    required String imageUrl,
    required double price,
    required double rating,
  })  : _name = name,
        _location = location,
        _imageUrl = imageUrl,
        _price = price,
        _rating = rating;

      //Getter
      String get name => _name;
      String get location => _location;
      String get imageUrl => _imageUrl;
      double get price => _price;
      double get rating => _rating;
      
      //Setter
      set name (String value){
        _name = value;
      }

      set price(double value){
        if (value >= 0){
          _price = value;
        }
      }

      set rating(double value){
        if (value >= 0 && value <= 5){
          _rating = value;
        } 
      }

      //Method
      String getHotelInfo(){
        return '$_name - $_location';
      }

      void increasePrice(double percentage){ //double percentage method menerima angka desimal sebagai parameter.
        if (percentage > 0){
          _price += _price * (percentage / 100);
        }
      }
}