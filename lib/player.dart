class Player {
  String name;
  String biography;
  String avatar;
  int hp;
  int gold;
  Player({this.name, this.avatar, this.gold = 10, this.hp = 100});

  String getStatus() => "<--$avatar$name 💳$gold ♥$hp%-->";
}