class UserData {
  static String nickname = '';
  static String fullName = '';
  static String age = '';
  static String gender = '';
  static String weight = ''; // in kg, as string
  static String height = ''; // in cm, as string

  // BMI calculated as: weight(kg) / [height(m)]^2
  static String get bmi {
    final double? heightCm = double.tryParse(height);
    final double? weightKg = double.tryParse(weight);

    if (heightCm == null || weightKg == null || heightCm == 0) {
      return 'Invalid';
    }

    final heightM = heightCm / 100;
    final bmiValue = weightKg / (heightM * heightM);
    return bmiValue.toStringAsFixed(2);
  }
}
