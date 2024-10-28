// ignore_for_file: avoid_print

var alphabet = [
  ['a', 'ą', 'b', 'c', 'ć', 'd', 'e'],
  ['ę', 'f', 'g', 'h', 'i', 'j', 'k'],
  ['l', 'ł', 'm', 'n', 'ń', 'o', 'ó'],
  ['p', 'q', 'r', 's', 'ś', 't', 'u'],
  ['w', 'v', 'x', 'y', 'z', 'ź', 'ż'],
];
//7 x 5

// var alphabet = [
//   ['a', 'b', 'c', 'd', 'e'],
//   ['f', 'g', 'h', 'i', 'j'],
//   ['k', 'l', 'm', 'n', 'o'],
//   ['p', 'q', 'r', 's', 't'],
//   ['u', 'v', 'w', 'x', 'y'],
// ]; // 5 x 5

var repetitions = ['x', 'y', 'z'];

String tekstRefactor(String tekst) {
  String refactored = '';
  tekst = tekst.replaceAll(RegExp(r'[^a-ząćęłńóśźż]'), '');

  for (int i = 0; i < tekst.length - 1; i++) {
    if (tekst[i] == tekst[i + 1]) {
      if (repetitions.contains(tekst[i])) {
        refactored += '${tekst[i]}${repetitions[(repetitions.indexOf(tekst[i]) + 1) % 3]}';
      } else {
        refactored += '${tekst[i]}x';
      }
    } else {
      refactored += tekst[i];
    }
  }

  refactored = '$refactored${tekst[tekst.length - 1]}${refactored.length % 2 == 0 ? 'x' : ''}';

  for (int i = 2; i <= refactored.length - 2; i += 3) {
    refactored = '${refactored.substring(0, i)} ${refactored.substring(i, refactored.length)}';
  }
  return refactored;
}

int getLetterRow(String letter, List<List<String>> newAlphabet) {
  for (int i = 0; i < newAlphabet.length; i++) {
    if (newAlphabet[i].contains(letter)) {
      return i;
    }
  }
  return -1;
}

int getLetterColumn(String letter, List<List<String>> newAlphabet) {
  for (int i = 0; i < alphabet.length; i++) {
    if (newAlphabet[i].contains(letter)) {
      return newAlphabet[i].indexOf(letter);
    }
  }
  return -1;
}

String filterUniqueCharacters(String input) {
  input = input.toLowerCase().replaceAll(RegExp(r'[^a-ząćęłńóśźż]'), '');
  Set<String> seenCharacters = {};
  StringBuffer uniqueString = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    String currentChar = input[i];
    if (!seenCharacters.contains(currentChar)) {
      seenCharacters.add(currentChar);
      uniqueString.write(currentChar);
    }
  }

  return uniqueString.toString();
}

String alphabetStringFromKey(String key) {
  key = filterUniqueCharacters(key);
  String alphabetString = '';
  for (int i = 0; i < alphabet.length; i++) {
    for (int j = 0; j < alphabet[i].length; j++) {
      alphabetString += alphabet[i][j];
    }
  }
  for (int i = key.length - 1; i >= 0; i--) {
    alphabetString = alphabetString.replaceAll(key[i], '');
    alphabetString = key[i] + alphabetString;
  }

  return alphabetString;
}

String playFireEncription(String tekst, String key) {
  String alphabetfromKey = alphabetStringFromKey(key);

  var newAlphabet = [
    ['a', 'ą', 'b', 'c', 'ć', 'd', 'e'],
    ['ę', 'f', 'g', 'h', 'i', 'j', 'k'],
    ['l', 'ł', 'm', 'n', 'ń', 'o', 'ó'],
    ['p', 'q', 'r', 's', 'ś', 't', 'u'],
    ['w', 'v', 'x', 'y', 'z', 'ź', 'ż'],
  ];

  for (int i = 0; i < alphabet.length; i++) {
    for (int j = 0; j < alphabet[i].length; j++) {
      newAlphabet[i][j] = alphabetfromKey[i * alphabet[i].length + j];
    }
  }

  tekst = tekstRefactor(tekst);
  var tekstList = tekst.split(' ');
  for (int i = 0; i < tekstList.length; i++) {
    String char1 = tekstList[i][0];
    String char2 = tekstList[i][1];
    int row1 = getLetterRow(char1, newAlphabet);
    int row2 = getLetterRow(char2, newAlphabet);
    int col1 = getLetterColumn(char1, newAlphabet);
    int col2 = getLetterColumn(char2, newAlphabet);
    if (row1 == row2) {
      tekstList[i] =
          '${newAlphabet[row1][(col1 + 1) % newAlphabet[0].length]}${newAlphabet[row2][(col2 + 1) % newAlphabet[0].length]}';
    } else if (col1 == col2) {
      tekstList[i] =
          '${newAlphabet[(row1 + 1) % newAlphabet.length][col1]}${newAlphabet[(row2 + 1) % 5][col2]}';
    } else {
      tekstList[i] = '${newAlphabet[row1][col2]}${newAlphabet[row2][col1]}';
    }
  }

  return tekstList.join(' ');
}

String playFireDecription(String tekst, String key) {
  String alphabetfromKey = alphabetStringFromKey(key);

  var newAlphabet = [
    ['a', 'ą', 'b', 'c', 'ć', 'd', 'e'],
    ['ę', 'f', 'g', 'h', 'i', 'j', 'k'],
    ['l', 'ł', 'm', 'n', 'ń', 'o', 'ó'],
    ['p', 'q', 'r', 's', 'ś', 't', 'u'],
    ['w', 'v', 'x', 'y', 'z', 'ź', 'ż'],
  ];

  for (int i = 0; i < alphabet.length; i++) {
    for (int j = 0; j < alphabet[i].length; j++) {
      newAlphabet[i][j] = alphabetfromKey[i * alphabet[i].length + j];
    }
  }

  var tekstList = tekst.split(' ');
  for (int i = 0; i < tekstList.length; i++) {
    String char1 = tekstList[i][0];
    String char2 = tekstList[i][1];
    int row1 = getLetterRow(char1, newAlphabet);
    int row2 = getLetterRow(char2, newAlphabet);
    int col1 = getLetterColumn(char1, newAlphabet);
    int col2 = getLetterColumn(char2, newAlphabet);
    if (row1 == row2) {
      tekstList[i] =
          '${newAlphabet[row1][(col1 - 1) % newAlphabet[0].length]}${newAlphabet[row2][(col2 - 1) % newAlphabet[0].length]}';
    } else if (col1 == col2) {
      tekstList[i] =
          '${newAlphabet[(row1 - 1) % newAlphabet.length][col1]}${newAlphabet[(row2 - 1) % 5][col2]}';
    } else {
      tekstList[i] = '${newAlphabet[row1][col2]}${newAlphabet[row2][col1]}';
    }
  }

  return tekstList.join('');
}

void main() {
  String tekst = 'aleksy';
  print(playFireEncription(tekst, 'dupa'));
  print(playFireDecription('pł kó rz', 'dupa'));
}
