class Player {
  String _name;
  final int _lives = 3;

  Player(this._name);

  Player.name(this._name);

  @override
  String toString() {
    return "Player $_name has $_lives lives";
  }
}
