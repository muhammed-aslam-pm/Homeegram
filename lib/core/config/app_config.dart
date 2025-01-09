class AppConfig {
  final String apiBaseUrl;
  final String appName;
  final bool enableAnalytics;

  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.enableAnalytics,
  });
}