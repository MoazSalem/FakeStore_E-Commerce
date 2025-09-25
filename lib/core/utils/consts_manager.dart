class ConstsManager {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String productsEndpoint = "/products";
  static const String paymobApiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'not-set',
  );
  static const String integrationID = String.fromEnvironment(
    'CARD_ID',
    defaultValue: '0',
  );
  static const String walletIntegrationId = String.fromEnvironment(
    'WALLET_ID',
    defaultValue: '0',
  );
  static const String iFrameID = String.fromEnvironment(
    'IFRAME_ID',
    defaultValue: '0',
  );
}
