class Player {
  String _name;
  int _lives = 3;

  Player(this._name);

  set lives(int value) {
    _lives = value;
  }

  Player.name(this._name);


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return "Player $_name has $_lives lives";
  }

  int get lives => _lives;
}
