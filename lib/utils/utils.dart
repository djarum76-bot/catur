bool listEquals(List a, List b) {
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

bool listContains(List<List<int>> list, List<int> item) {
  for (var listItem in list) {
    if (listEquals(listItem, item)) {
      return true;
    }
  }
  return false;
}