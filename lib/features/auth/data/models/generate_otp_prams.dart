class GenerateOtpParams {
  final String phoneNumber;

  GenerateOtpParams({
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {'mobile_number': phoneNumber};
  }
}
