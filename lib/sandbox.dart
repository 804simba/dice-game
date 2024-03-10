import 'dart:io';

typedef ListMapper<X> = Map<X, List<X>>;

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

// class Planet {
//   final PlanetType planetType;
//   final int numberOfMoons;
//   final bool hasRings;
//
//   mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
//   venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
//   uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
//   pluto(planetType: PlanetType.terrestrial, moons: 40, hasRings: true),
//
//   const Planet(
//   {required this.planetType, required this.numberOfMoons, required this.hasRings,}
//       );
// }

const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> printWithDelayShortVersion(String message) {
  return Future.delayed(oneSecond).then((_) => print(message));
}
const astronauts = 10;

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}


abstract class InvestmentService {
  void handleInvestmentPortfolio(String name);
}

class InvestmentServiceImpl extends InvestmentService {

  @override
  void handleInvestmentPortfolio(String name) {
    print('STANDING ON BUSINESS FOR $name, TYPE SHIT!');
  }
}

final investmentService = InvestmentServiceImpl();

class PortfolioManagementServiceProvider {
  final InvestmentService _investmentService;

  PortfolioManagementServiceProvider() : _investmentService = investmentService;

  void handlePortfolioManagement() {
    print("Handling portfolio for client");
    _investmentService.handleInvestmentPortfolio('SIMBA');
  }
}

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 40, carbonPerKilometre: 1000),
  bus(tires: 4, passengers: 40, carbonPerKilometre: 1000),
  bicycle(tires: 4, passengers: 40, carbonPerKilometre: 1000);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometre,
});

  final int tires;
  final int passengers;
  final int carbonPerKilometre;

  int get carbonFootPrint => (carbonPerKilometre / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootPrint - other.carbonFootPrint;
}

class FileHandler {
   static Future<String> readFileAsync(String filename) {
    final file = File(filename);

    return file.readAsString().then((contents) => contents.trim());
  }
}
/*
* By marking a function with [async*] we are able to use the [yield] keyword
* By marking a function with [async] we are able to use the await keyword
* */

class CountStream {
  Stream<int> countStreamHandler (int max) async* {
    for (int i = 0; i < max; i++) {
      yield i;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }
}

void main() {
  final fileHandler = FileHandler.readFileAsync('dummy.txt');
  var voyager = Spacecraft('The Neptunes', DateTime.tryParse('2000-12-31'));
  var secondVoyager = Spacecraft('John', null);
  voyager.describe();
  secondVoyager.describe();

  if (astronauts == 0) {
    throw StateError('No astronauts');
  }

  Map<String, List<String>> mapper = {};
  ListMapper<String> listMapper = {
    'A': ['Apple', 'Ant'],
    'B': ['Ball', 'Banana'],
    'C': ['Cat', 'Car'],
  };

  // Add more items to the list
  listMapper['D'] = ['Dog', 'Duck'];

  // Print the list items for each key
  listMapper.forEach((key, value) {
    print('$key: $value');
  });

  // records
  var record = ('first', a: 2, b: true, 'last');

  PortfolioManagementServiceProvider portfolioManagementServiceProvider = PortfolioManagementServiceProvider();
  portfolioManagementServiceProvider.handlePortfolioManagement();
}