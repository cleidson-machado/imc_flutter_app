// ignore_for_file: avoid_print

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// Mixins: Mixins are a way of reusing code in multiple class hierarchies. The following is a mixin declaration:
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

//To add a mixin's capabilities to a class, just extend the class with the mixin.
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
  // ···
}



void main() {
  // Create an instance of the Spacecraft class.

  print('------------------------------------------------------');

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var unlaunchedSpacecraft = Spacecraft.unlaunched('Future Explorer');
  unlaunchedSpacecraft.describe();

  var theOrbiter = Orbiter('Cleidson', DateTime(1977, 9, 5), 1.1);

  print('------------------------------------------------------');

  print(theOrbiter.name);
  print(theOrbiter.launchDate);
  print(theOrbiter.altitude);

  print('------------------------------------------------------');

  var thePiloted = PilotedCraft('Napoleao', DateTime.now());

  print(thePiloted.name);
  print(thePiloted.launchDate);
  print(thePiloted.astronauts);

  print('------------------------------------------------------');
}
