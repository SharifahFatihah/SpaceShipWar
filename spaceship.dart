import 'dart:math';

void main() {

  SpaceShip sp1 = ArmoredSpaceShip("ArmoredSpaceShip", 1000, 100);
  SpaceShip sp2 = HighSpeedSpaceShip("HighSpeedSpaceShip", 200, 1000);
  BattleField war = BattleField();
  war.startBattle(sp1, sp2);


}

abstract class SpaceShip {
  String player;
  double health;
  int firePower;

//Methods
//hit
//isDestroyed

  void hit(int shoot){
    health = health - shoot;
    print('Spaceship $player is shooting');
  }

  void isDestroyed() {
    if (health <= 0) {
      print('$player is destroyed.');
    } else {
      print('$player still alive: $health');
    }
  }
//Constructor
  SpaceShip(this.player, this.health, this.firePower);

}

class BattleField {
  void startBattle(SpaceShip sp1, SpaceShip sp2) {
    //Randomly a space ship is selected to hit first
    bool result = Random().nextDouble() <= 0.5;

    print('Battle start');
    //SpaceShips hit each other
    //Until one of them is destroyed
    if (result == true) {
      do {
        print('${sp1.player} start attacking with ${sp1.firePower} fire power!');
        sp2.hit(sp1.firePower);
        sp2.isDestroyed();

        if (sp2.health <= 0) {
          print("${sp2.player} lost! ${sp1.player} won! Battle over.");
        } else if (sp1.health <= 0) {
          print("${sp1.player} lost! ${sp2.player} won! Battle over.");
        } else {
          print("");
        }

        if (sp2.health > 0) {
          print('${sp2.player} counterattack ${sp1.player}');
          sp1.hit(sp2.firePower);
          sp1.isDestroyed();

          if (sp1.health <= 0) {
            print("${sp1.player} lost! ${sp2.player} won! Battle over.");
          } else if (sp2.health <= 0) {
            print("${sp2.player} lost! ${sp1.player} won! Battle over.");
          } else {
            print("");
          }
        } else {}

      } while ((sp1.health > 0) && (sp2.health > 0));
    }

    else {

      do {
        print('${sp2.player} start attacking with ${sp2.firePower} fire power!');
        sp1.hit(sp2.firePower);
        sp1.isDestroyed();

        if (sp1.health <= 0) {
          print("${sp1.player} lost! ${sp2.player} won! Battle over.");
        } else if (sp2.health <= 0) {
          print("${sp2.player} lost! ${sp1.player} won! Battle over.");
        } else {
          print("");
        }

        if (sp1.health > 0) {
          print('${sp1.player} counterattack ${sp2.player}');
          sp2.hit(sp1.firePower);
          sp2.isDestroyed();

          if (sp2.health <= 0) {
            print("${sp2.player} lost! ${sp1.player} won! Battle over.");
          } else if (sp1.health <= 0) {
            print("${sp1.player} lost! ${sp2.player} won! Battle over.");
          } else {
            print("");
          }
        } else {}

      } while ((sp2.health > 0) && (sp1.health > 0));
    }
  }
}

class ArmoredSpaceShip extends SpaceShip {

  //Constructor
  ArmoredSpaceShip(super.player, super.health, super.firePower);

  //Randomly absorbs hit
  @override
  void hit(int shoot){
    int maxArmorPower = (Random().nextInt(60)+1);
    double armorPower = shoot-(shoot* (maxArmorPower/100));
    health = health - (armorPower);

    print('ArmoredSpaceShip shield $maxArmorPower% of the attack, firepower: $armorPower');
    print('ArmoredSpaceShip health: $health/1000');
  }

}

class HighSpeedSpaceShip extends SpaceShip {
  //Whether dodges hit or not
  //bool dodging
  @override
  void hit(int shoot) {
    bool dodging = Random().nextBool();
    if (dodging == true) {
      print('HighSpeedSpaceShip successfully dodge the attack.');
      health = health - 0;
    } else {
      print('HighSpeedSpaceShip failed to dodge the attack.');
      health = health - shoot;
    }
    print('HighSpeedSpaceShip health: $health/200');
  }

  //Constructor
  HighSpeedSpaceShip(super.player, super.health, super.firePower);
}