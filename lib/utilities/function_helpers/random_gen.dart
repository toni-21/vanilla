import 'dart:math';

String generateDocId() {
  // generateRandomDocumentId
  final random = Random();
  const length = 16; // Adjust length as needed (16 for provided format)

  const chars =
      '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  final buffer = StringBuffer();
  for (var i = 0; i < length; i++) {
    final charIndex = random.nextInt(chars.length);
    buffer.write(chars[charIndex]);
  }

  // Optionally, add a prefix or suffix for better readability
  // return 'DOC-' + buffer.toString() + '-ID';

  return buffer.toString();
}

String generateOTP() {
  final random =
      Random.secure(); // Use cryptographically secure random number generator
  const digits = '0123456789';
  String otp = '';
  for (int i = 0; i < 4; i++) {
    final index = random.nextInt(digits.length);
    otp += digits[index];
  }
  return otp;
}
