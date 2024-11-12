String alphabet = "aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż";
// String alphabet = 'abcdefghijklmnopqrstuvwxyz';

String filterUnencrypted(String unencrypted) {
  String clearUnencrypted = '';
  unencrypted = unencrypted.toLowerCase();
  for (int i = 0; i < unencrypted.length; i++) {
    if (alphabet.contains(unencrypted[i])) {
      clearUnencrypted += unencrypted[i];
    }
  }
  return clearUnencrypted;
}

String undeToKey(String unencrypted, String key) {
  String unencryptedKey = '';
  key = key.toLowerCase();
  for (int i = 0; i < unencrypted.length; i++) {
    unencryptedKey += key[i % key.length];
  }

  return unencryptedKey;
}

String encrypt(String unencrypted, String key) {
  unencrypted = filterUnencrypted(unencrypted);
  String unencryptedKey = undeToKey(unencrypted, key);
  String encrypted = '';
  int row = 0;
  int column = 0;
  int charPosition = 0;
  for (int i = 0; i < unencrypted.length; i++) {
    row = alphabet.indexOf(unencrypted[i]) + 1;
    column = alphabet.indexOf(unencryptedKey[i]) + 1;
    charPosition = (row + column - 2) % alphabet.length;
    encrypted += alphabet[charPosition];
  }
  return encrypted;
}

String deencrypt(String encrypted, String key) {
  String deenctypted = '';
  String encryptedKey = undeToKey(encrypted, key);
  int charPosition = 0;
  for (int i = 0; i < encrypted.length; i++) {
    charPosition += alphabet.indexOf(encrypted[i]) - alphabet.indexOf(encryptedKey[i]);
    while (charPosition < 0) {
      charPosition += alphabet.length;
    }
    deenctypted += alphabet[charPosition];
    charPosition = 0;
    // long story short, remember to reset variable bc debuging takes a lot of time and nerves :)
  }
  return deenctypted;
}

void main() {
  // print(undeToKey(filterUnencrypted(unencryptedDebug), keyDebug));
  // print(unencryptedDebug.replaceAll(" ", ""));
  String keyDebug = 'TAJNE';
  String unencryptedDebug = 'TO JEST BARDZO TAJNY TEKST';

  print(encrypt(unencryptedDebug, keyDebug));
  print(deencrypt("mosrwmbjehsocnngycrolt", "dupa"));
}
