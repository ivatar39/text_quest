//encounter.dart
class Encounter {
  String text;
  List<Option> options;
  Encounter(this.text, {this.options});
}
class Option {
  String text;
  int id;
  Option(this.text, this.id);
}
