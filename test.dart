void main() {
  callBack(value: "hay");
}

enum Card { promotion, member, staff }

void callBack({required String value}) {
  print(value);
}
