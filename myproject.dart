import 'package:myproject/myproject.dart' as myproject;
import 'dart:math';
// This is my main file for
// Dart Basics

// void main(List<String> arguments) {

	//This is my name
	// final String name = 'Sharifah';
	// const int age = 20;

	//I'm using this print to show you my name and age
	// Usage
	// helloToOptional(name, "Khan", age);
	// helloTo(name, age);
	// helloToOptional(name);
	// helloToOptional();


	// if (age % 2 == 0) {
	// 	print('Even');
	// }	else{
	// 	print('Odd');
	// }
	//
	// if (age > 0){
	// 	print('${age} is positive');
	// }	else if (age < 0) {
	// 	print('${age} is negative');
	// }	else {
	// 	print( '${age} is neither positive nor negative');
	// }

	// switch(age) {
	// 	case 19:
	// 		print('You are still a teenager!');
	// 		break;
	// 	case 20:
	// 		print('Young soul!');
	// 		break;
	// 	case 25:
	// 		print('You rock!');
	// 		break;
	// 	default:
	// 		print('You are immortal! Forever young!');
	// }

	//---------------------------Loop------------------------------------------
	// for (var i = 0; i <5; i++) {
	// 	print(i);
	// }
	//
	// var pets = ['Cat', 'Dog', 'Rabbit'];
	// for (var pet in pets) {
	// 	print(pet);
	// }
	//
	// pets.forEach((pet) => print(pet));


//-------------------------------While loop------------------------------------
// 			int h = 0;
//
// 			while (h <= 5) {
// 				print(h);
// 				h++;
// 			}

//----------------------------------Do loop------------------------------------

// 	int k = 10;
//
// 	do {
// 		print(k);
// 		k++;
// 	} while (k < 16);
//
// }


// Variable `name` and `age` is a positional parameter.
// helloTo(String name, int age){
// 	print("Hello I'm $name, $age years old");
// }

// helloToOptional([String name="", int age=21]){
// 	print("Hello I'm $name, $age years old");
// }

// Variable `name` is a optional parameter.
// helloToOptional([String name="", String family="Khan", int age=21]){
// 	print("Hello I'm $name $family, $age years old");
// }

	//declaring variable to calculate circle area
	// double pi = 3.142;
	// int radius = 5;
	// dynamic circle = 2 * pi * radius;
	
	//displaying the result for circle area
	// print('The area of the circle is $circle cm2');

//----------------------------async---------------------------------------------
// void main() async {
//
// 	await printSomething(2, "after 2 seconds");
// 	printSomething(1, "after 1 seconds");
// }
//
//
// Future<void>printSomething(int seconds, String message) async{
// 	//Dummy async operation
// 	await Future.delayed(Duration(seconds: seconds), () { //tanya!!
// 		print(message);
// 	});
// 	print('test');
// }

DateTime dateTime = DateTime.now();
int duration = 0;

void main() async {
	 // double i = await getPrice();
	//  showPrices(double.parse(i.toStringAsFixed(2)));
	//
	//  final streamPrice = getPricesStream();
	//  // streamPrice.forEach(print); //to display one by one
	//
	// final subscription = streamPrice.listen((i)=>{print('$i')});

	getPricesStream().listen((price) => showPrices(double.parse(price.toStringAsFixed(2))));
	// showPrices(double.parse(i.toStringAsFixed(2)));


}

// Get a stream of random prices
Stream<double> getPricesStream() async* {
	final int numberOfResults = 10;
	for (var i=0; i < numberOfResults; i++) {
		final price = await getPrice();
		yield price; //add data to the stream
	}
}

//Get a random price
Future<double> getPrice() {
	final random = Random ();
	var rng = Random().nextInt(5)+1;
	return Future.delayed(
		// Duration(seconds:Random().nextInt(5)), () => random.nextDouble() * 1000,
		Duration(seconds: rng), () => random.nextDouble() * 1000,

	);
}

//Print the price passed in
void showPrices(double price) {

	duration = dateTime.difference(DateTime.now()).inSeconds.abs();
	// print(price);

	print('$price													time difference->$duration');
			dateTime = DateTime.now();
}


