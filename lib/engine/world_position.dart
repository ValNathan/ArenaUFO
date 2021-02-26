import 'dart:math';
import 'dart:ui';

import 'package:ArenaUFO/engine/tile_position.dart';
import 'package:ArenaUFO/game_props.dart';
import 'package:flutter/foundation.dart';

@immutable
class WorldPosition {
  final double x;
  final double y;

  const WorldPosition(this.x, this.y);

  static WorldPosition fromTilePosition(TilePosition tp) {
    assert(tileSize != null, 'init tileSize first');
    final t = GameProps.tileSize;
    final x = t * tp.col + tp.relX;
    final y = t * tp.row + tp.relY;
    return WorldPosition(x, y);
  }

  TilePosition toTilePosition() {
    final t = GameProps.tileSize;
    final col = x ~/ t;
    final row = y ~/ t;
    final relX = x % t;
    final relY = y % t;
    return TilePosition(col, row, relX, relY);
  }

  Offset toOffset() {
    return Offset(x, y);
  }

  static WorldPosition fromOffset(Offset offset) {
    return WorldPosition(offset.dx, offset.dy);
  }

  static double tileSize;
}
