// Example: lib/auth_service.dart
import 'package:flutter_appauth/flutter_appauth.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();

Future<void> signInWithAzureB2C() async {
  final AuthorizationTokenResponse? result =
      await appAuth.authorizeAndExchangeCode(
    AuthorizationTokenRequest(
      'cbbaef31-5e90-486d-84fe-a4b8e70c3494', // <-- Replace with your Azure app's client ID
      'com.example.aadb2clogindemo://auth', // <-- Your redirect URI
      serviceConfiguration: AuthorizationServiceConfiguration(
        authorizationEndpoint: 'https://mybillio.b2clogin.com/mybillio.onmicrosoft.com/B2C_1_SignUp_SignIn/oauth2/v2.0/authorize',
        tokenEndpoint: 'https://mybillio.b2clogin.com/mybillio.onmicrosoft.com/B2C_1_SignUp_SignIn/oauth2/v2.0/token',
      ),
      scopes: ['openid', 'profile', 'https://mybillio.onmicrosoft.com/cbbaef31-5e90-486d-84fe-a4b8e70c3494/Users.Read'],
    ),
  );
  // Handle result (tokens, etc.)
  if (result != null) {
    print('Access token: ${result.accessToken}');
    print('ID token: ${result.idToken}');
    print('Refresh token: ${result.refreshToken}');
  } else {
    print('Login failed or was cancelled');
  }
}