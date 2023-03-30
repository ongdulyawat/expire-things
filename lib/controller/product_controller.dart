class ProductController{
  String _pathImage = "";
  int _count = 0;
  String _note = "-";
  String _category = "";
  String _expireDate = "";


  bool checkInputAddProduct(String pathImage, int count, String note, String? category, String? expireDate)   {
    bool check = false;
    if (pathImage != "" && count != 0 &&  category != null && expireDate != null) {
      _note = note;
      _category = category;
      _expireDate = expireDate;
      _pathImage = pathImage;
      _count = count;
      check = true;
    }
    else{
      check = false;
    }
    return check;
  }

}