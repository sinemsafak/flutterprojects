class StudentValidationMixin{

  String validateFirstName(String value){
    if(value.length<2){
      return "İsim en az iki karakterli olmalıdır.";
    }
  }
} 