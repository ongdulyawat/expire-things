class ProductController{
  String _pathImage = "";
  int _count = 0;
  String _note = "-";
  String _category = "";
  String _expireDate = "";
  bool check = false;

  String test = "--";

  void setTest(String s){
    test = s;
    print(test);
  }

    bool checkInputAddProductHeader(String? pathImage, int? count)   {
      if (pathImage != null && count != null) {
        _pathImage = pathImage;
        _count = count;
        check = true;
      }
      else{
        check = false;
      }
      return check;
    }

    bool checkInputAddProductBody(String? note, String? category, String? expireDate)   {

      if (note != null && category != null && expireDate != null) {
        _note = note;
        _category = category;
        _expireDate = expireDate;
        check = true;
      }
      else{
        check = false;
      }
      return check;
    }

  void createProduct()   {
    print(test);

    }


}