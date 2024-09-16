import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class AuthSigner {
  final String _issuer = "com.hostelpedia";
  final int _expirationTime = 3600; // expires after 3600 sec
  final String _secretKey =
      "your-secret-key"; // Replace this with your actual secret key

  String createJwt() {
    // Get current time in seconds
    final int currentTime =
        (DateTime.now().millisecondsSinceEpoch / 1000).floor();

    // Create a JWT signer with the secret key using HS256 algorithm
    final jwt = JWT({
      'iat': currentTime, // Issued at time
      'exp': currentTime + _expirationTime, // Expiration time
    }, issuer: _issuer);

    // Sign the JWT and return it
    final token = jwt.sign(SecretKey(_secretKey),
        expiresIn: Duration(seconds: _expirationTime));

    return token;
  }
}

void main() {
  final authSigner = AuthSigner();
  final jwt = authSigner.createJwt();

  print('Generated JWT: $jwt');
}
