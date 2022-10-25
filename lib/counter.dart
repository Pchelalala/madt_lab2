int count(String userInput, String dropdownValue) {
  if (dropdownValue == "words") {
    final regExp = RegExp(r"[\w-]+");
    return regExp.allMatches(userInput).length;
  }
  return userInput.length;
}
