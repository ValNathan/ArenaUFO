import 'package:ArenaUFO/models/player_model.dart';

class GameModel {
  final PlayerModel player;

  GameModel({this.player});

  @override
  String toString() {
    return '''GameModel {
      player: $player
    }''';
  }
}
