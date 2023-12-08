mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim boş olamaz.";
    } else if (value.length < 2) {
      return "İsim en az iki karakterli olmalıdır.";
    }
    return null; // Geçerli durumu belirtmek için null döndürün.
  }
}
