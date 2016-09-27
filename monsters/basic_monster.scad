// basic monster
module basic_monster_variation() {
  echo("######################################");
  echo("basic monster - variations :");
  echo("* 'mark_I' : the basic one");
  //
  echo("######################################");
}

module basic_monster_includes() {
  echo("######################################");
  echo("basic monster - includes :");
  echo("* ../parts/heads/can_head.scad");
  echo("* ../parts/links/T_link.scad");
  echo("* ../parts/small_pieces/tray.scad");
  //
  echo("######################################");
}

include <../parts/heads/can_head.scad>
include <../parts/links/T_link.scad>
include <../parts/small_pieces/tray.scad>

module basic_monster(variation="mark_I",det=1) {
  //
  translate([0,0,3]) monster_head(det=det);
  translate([0,0,2.5]) tray(det=det);
  translate([0,0,0]) T_link(det=det);
  //
}
