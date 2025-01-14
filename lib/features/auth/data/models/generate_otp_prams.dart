class GenerateOtpParams {
  final String phoneNumber;

  GenerateOtpParams({
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
    };
  }
}
