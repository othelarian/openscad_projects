//CONCEPTION FILE

//
// INFO : support de tête -> size*3 de rayon, soit minimum 3
// INFO : flag -> size 1
// INFO : plate -> size 2.5
// INFO : base -> size 5
// INFO : cube -> size 10
// INFO : stud -> size 3, h size 1
// INFO : big stud -> size 4, h size 1
//
// INFO : V -> variation
// INFO : S -> show
// INFO : I -> includes
//

//include <monsters/basic_monster.scad>
//basic_monster_variation();

/*
include <parts/rounds/basic_disc.scad>
basic_disc_variation();
basic_disc_show();
*/

/*
include <parts/angulars/basic_plate.scad>
basic_plate_variation();
basic_plate_show();
*/

include <parts/rounds/basic_round.scad>
basic_round_variation();
basic_round_show();

// #################################################
// ###                   IDEAS                   ###
// #################################################

// écrou de verrou
// barrique
// plaque
// moteur
// plantes
// pièces de base

// #################################################
// ###                    TODO                   ###
// #################################################

// parts/heads/box_head.scad

// #################################################
// ###                    DOING                  ###
// #################################################

// libs/lib_001.scad
// VI monsters/basic_monster.scad
// VS parts/angulars/basic_plate.scad
// VS parts/rounds/basic_disc.scad

// #################################################
// ###                    DONE                   ###
// #################################################

// parts/heads/can_head.scad
// parts/links/T_link.scad
// parts/small_pieces/tray.scad
// VS parts/rounds/basic_round.scad
