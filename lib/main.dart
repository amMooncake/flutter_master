import 'package:flutter_master/prime_numbers.dart';
import 'dart:math';

Random random = Random();

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

List<int> getEncryptionLock(int p, int q) {
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
  BigInt encryptedNum = BigInt.from(numText);
  encryptedNum = encryptedNum.pow(lock[0]) % BigInt.from(lock[1]);
  return encryptedNum.toInt();
}

List<int> getDecryptionLock(int p, int q, List<int> lock) {
  int n = p * q;
  int d = 0;
  int fi = (p - 1) * (q - 1);
  while (true) {
    d = random.nextInt(10000);
    if ((lock[0] * d) % fi == 1) {
      break;
    }
  }
  return [d, n];
}

int decryption(int p, int q, int numText, List<int> elock) {
  List<int> dlock = getDecryptionLock(p, q, elock);
  BigInt decryptedNum = BigInt.from(numText);
  decryptedNum = decryptedNum.pow(dlock[0]) % BigInt.from(dlock[1]);
  return decryptedNum.toInt();
}

void main() {
  // print(primeNumbers[random.nextInt(1061)]);
  // print(primeNumbers[random.nextInt(1061)]);

  String Text = 'b';
  int numText = 2;

  int p = 1789; //1789
  int q = 5827; //5827

  List<int> lock = getEncryptionLock(p, q);
  print(lock);
  int encrypted = encryption(lock, numText);
  print('encrypted: ${encrypted}');
  int decrypted = decryption(p, q, encrypted, lock);
  print('decrypted: ${decrypted}');
}
