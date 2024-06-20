class StringUtility {
  static String getIndexAlphabet(int index) {
    if (index >= 1 && index <= 26) {
      // Assuming the index is within the range of English alphabets
      return String.fromCharCode('A'.codeUnitAt(0) + index - 1).toLowerCase();
    } else {
      return "a";
    }
  }
}
