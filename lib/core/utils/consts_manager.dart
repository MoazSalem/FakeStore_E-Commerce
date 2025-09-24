class ConstsManager {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String productsEndpoint = "/products";
  static const String paymobApiKey = String.fromEnvironment('API_KEY');
  static const String integrationID = String.fromEnvironment('CARD_ID');
  static const String walletIntegrationId = String.fromEnvironment('WALLET_ID');
  static const String iFrameID = String.fromEnvironment('IFRAME_ID');
}
