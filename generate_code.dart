// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:crypto/crypto.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    print('⚠️  Por favor, proporciona un email como argumento.');
    print('Ejemplo: dart run generate_code.dart "usuario@email.com"');
    return;
  }

  final email = args[0];
  final code = generateCode(email);
  print('------------------------------------------------');
  print('Email:  $email');
  print('Código: $code');
  print('------------------------------------------------');
}

String generateCode(String email) {
  const secret = 'mi_secret_v1_2025';
  const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final normalized = email.trim().toLowerCase();
  final hmac = Hmac(sha256, utf8.encode(secret));
  final digest = hmac.convert(utf8.encode(normalized)).bytes;
  final buffer = StringBuffer();
  for (int i = 0; i < 6; i++) {
    final idx = digest[i] % charset.length;
    buffer.write(charset[idx]);
  }
  return buffer.toString();
}
