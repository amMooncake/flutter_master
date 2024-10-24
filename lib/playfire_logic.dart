// ignore_for_file: avoid_print

// var alphabet = [
//   ['a', 'ą', 'b', 'c', 'ć', 'd', 'e'],
//   ['ę', 'f', 'g', 'h', 'i', 'j', 'k'],
//   ['l', 'ł', 'm', 'n', 'ń', 'o', 'ó'],
//   ['p', 'q', 'r', 's', 'ś', 't', 'u'],
//   ['w', 'v', 'x', 'y', 'z', 'ź', 'ż'],
// ];
//7 x 5

var alphabet = [
  ['a', 'b', 'C', 'D', 'E'],
  ['F', 'G', 'H', 'I', 'J'],
  ['K', 'L', 'M', 'N', 'O'],
  ['P', 'Q', 'R', 'S', 'T'],
  ['U', 'V', 'W', 'X', 'Y'],
]; // 5 x 5

var repetitions = ['x', 'y', 'z'];

String tekstRefactor(String tekst) {
  String refactored = '';
  tekst = tekst.replaceAll(' ', '').toLowerCase();

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

int getLetterRow(String letter) {
  for (int i = 0; i < alphabet.length; i++) {
    if (alphabet[i].contains(letter)) {
      return i;
    }
  }
  return -1;
}

int getLetterColumn(String letter) {
  for (int i = 0; i < alphabet.length; i++) {
    if (alphabet[i].contains(letter)) {
      return alphabet[i].indexOf(letter);
    }
  }
  return -1;
}

String playFireEncription(String tekst) {
  tekst = tekstRefactor(tekst);
  var tekstList = tekst.split(' ');
  for (int i = 0; i < tekstList.length; i++) {
    String char1 = tekstList[i][0];
    String char2 = tekstList[i][1];
    int row1 = getLetterRow(char1);
    int row2 = getLetterRow(char2);
    int col1 = getLetterColumn(char1);
    int col2 = getLetterColumn(char2);
    if (row1 == row2) {
      tekstList[i] = '${alphabet[row1][(col1 + 1) % 7]}${alphabet[row2][(col2 + 1) % 7]}';
    } else if (col1 == col2) {
      tekstList[i] = '${alphabet[(row1 + 1) % 5][col1]}${alphabet[(row2 + 1) % 5][col2]}';
    } else {
      tekstList[i] = '${alphabet[row1][col2]}${alphabet[row2][col1]}';
    }
  }
  print(tekstList);

  return tekstList.join(' ');
}

void main() {
  String tekst = 'wikipedia jest najlepsza';
  print(tekstRefactor(tekst));
  print(getLetterRow('u'));
  print(getLetterColumn('u'));
  print(playFireEncription(tekst));
}
