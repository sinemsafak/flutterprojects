mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim boş olamaz.";
    } else if (value.length < 2) {
      return "İsim en az iki karakterli olmalıdır.";
    }
    return null; // Geçerli durumu belirtmek için null döndürün.
  }
  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Soyad boş olamaz.";
    } else if (value.length < 2) {
      return "Soyad en az iki karakterli olmalıdır.";
    }
    return null; // Geçerli durumu belirtmek için null döndürün.
  }
  String? validateGrade(String? value) {
    if (value == null || value.isEmpty) {
      return "Not boş olamaz.";
    }
    var grade = int.tryParse(value);
    if (grade == null || grade <= 0 || grade > 100) {
      return "Girilen not değeri 0 ile 100 arasında olmalıdır.";
    }
    return null; // Geçerli durumu belirtmek için null döndürün.
  }
}
