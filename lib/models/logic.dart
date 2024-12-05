import 'dart:math';

Random random = Random();

String filterString(String text) {
  return text.replaceAll(RegExp(r'[^a-zA-Z]'), '');
}

// losowy numer:
bool isPrime(int number) {
  if (number <= 1) return false;
  if (number <= 3) return true;
  if (number % 2 == 0 || number % 3 == 0) return false;
  for (int i = 5; i * i <= number; i += 6) {
    if (number % i == 0 || number % (i + 2) == 0) return false;
  }
  return true;
}

int generatePrimeNumber({int min = 1000, int max = 9999}) {
  int prime;
  do {
    prime = min + random.nextInt(max - min + 1);
  } while (!isPrime(prime));
  return prime;
}

// szybkie szukanie d: e * d mod(fi) = 1
int modularExponentiation(int x, int y, int z) {
  int result = 1;
  x = x % z;

  while (y > 0) {
    if (y % 2 == 1) {
      result = (result * x) % z;
    }
    x = (x * x) % z;
    y = y ~/ 2;
  }
  return result;
}

// 3 fukcje szykające w wydajny i losowy sposób e z klucz prywatnego
List<int> extendedGcd(int a, int b) {
  if (b == 0) {
    return [a, 1, 0]; // [gcd, x, y]
  }
  var result = extendedGcd(b, a % b);
  int gcd = result[0];
  int x = result[2];
  int y = result[1] - (a ~/ b) * result[2];
  return [gcd, x, y];
}

int modularInverse(int e, int phi) {
  var result = extendedGcd(e, phi);
  int gcd = result[0];
  int x = result[1];

  if (gcd != 1) {
    throw Exception("e and phi are not coprime, modular inverse doesn't exist");
  }

  // Ensure positive modular inverse (lowest d)
  return (x % phi + phi) % phi;
}

bool isCoprime(int a, int b, int c) {
  return gcd(a, b) == 1 && gcd(a, c) == 1;
}

int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

List<int> getPublickey(int p, int q) {
  int n = p * q;
  int fi = (p - 1) * (q - 1);

  int e = 2;
  while (true) {
    e = 2 + random.nextInt(fi);
    if (isCoprime(e, n, fi)) {
      break;
    }
  }

  List<int> lock = [e, n];
  return lock;
}

int encryption(List<int> lock, int numText) {
  int encryptedNum = modularExponentiation(numText, lock[0], lock[1]);
  return encryptedNum.toInt();
}

List<int> getPrivateKey(int p, int q, List<int> lock) {
  int n = p * q;
  int d = 2;
  int fi = (p - 1) * (q - 1);

  d = modularInverse(lock[0], fi);
  return [d, n];
}

int decryption(int p, int q, int numText, List<int> dlock) {
  int decryptedNum = numText;
  // decryptedNum = (decryptedNum).pow(dlock[0]) % BigInt.from(dlock[1]);
  decryptedNum = modularExponentiation(decryptedNum, dlock[0], dlock[1]);
  return decryptedNum;
}

class RsaObject {
  int? p;
  int? q;
  List<int>? publickey;
  List<int>? privateKey;
  String text;
  List<int> encryptedListCodeUnits = [];
  String encryptedText = '';
  String dectyptedText = '';

  List<int> howLong = [];

  RsaObject({required this.text});

  void generateNewPrime() {
    p = generatePrimeNumber();
    q = generatePrimeNumber();
  }

  void generateKeys() {
    publickey = getPublickey(p!, q!);
    privateKey = getPrivateKey(p!, q!, publickey!);
  }

  void encrypt() {
    text = filterString(text);
    encryptedListCodeUnits = text.codeUnits;
    encryptedListCodeUnits = encryptedListCodeUnits.map((e) => encryption(publickey!, e)).toList();
  }

  void decrypt() {
    List<int> decryptedListUnitsCode =
        encryptedListCodeUnits.map((e) => decryption(p!, q!, e, privateKey!)).toList();
    dectyptedText = String.fromCharCodes(decryptedListUnitsCode);
    print(dectyptedText);
  }

  void makeItLookGoodXD() {
    howLong = encryptedListCodeUnits.map((e) => e.toString().length).toList();
    encryptedText = encryptedListCodeUnits.join('');
  }
}

void main() {
  String text = 'aleksy';

  RsaObject rsa = RsaObject(text: text);
  rsa.generateNewPrime();

  rsa.text = text;

  print('text: ${rsa.text}');

  print(rsa.p);
  print(rsa.q);

  print('p: ${rsa.p}  q: ${rsa.q}');

  rsa.generateKeys();

  print('public key: ${rsa.publickey}');
  print('private key: ${rsa.privateKey}');

  rsa.encrypt();
  print('encrypted: ${rsa.encryptedListCodeUnits}');

  rsa.decrypt();
  print(rsa.dectyptedText);

  rsa.makeItLookGoodXD();
  print(rsa.encryptedText);
}
