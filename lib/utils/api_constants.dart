class ApiConstants {
  static const scheme = 'https';
  static const baseUrl = 'fishwatch.gov';
  static const path = 'api/species';
  static get getFishSpecies => Uri(
        scheme: scheme,
        host: baseUrl,
        path: path,
      );
}
