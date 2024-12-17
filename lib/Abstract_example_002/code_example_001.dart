// ignore_for_file: avoid_print
// Define the abstract class

abstract class Animal {
  // Abstract method (no implementation)
  void makeSound();

  // Concrete method (optional)
  void eat() {
    print('This animal is eating.');
  }
}

// Subclass implementing the abstract class
class Dog extends Animal {
  // Implement the abstract method
  @override
  void makeSound() {
    print('Bark');
  }
}

// Another subclass implementing the abstract class
class Cat extends Animal {
  // Implement the abstract method
  @override
  void makeSound() {
    print('Meow');
  }
}

class Elephant extends Animal {
  @override
  void makeSound() {
    print('Huuunrrrrrrw');
  }

  @override
  void eat (){
    print('THE ELEPHANT IS NOT HUNGRY TODAY!');
  }
  
}

void main() {
  // Abstract classes cannot be instantiated
  // var animal = Animal(); // Error: Cannot instantiate abstract class
  print('------------------------------------------');

  // Use subclasses instead
  Animal dog = Dog();
  dog.makeSound(); // Output: Bark
  dog.eat(); // Output: This animal is eating.

  print('------------------------------------------');

  Animal cat = Cat();
  cat.makeSound(); // Output: Meow
  cat.eat(); // Output: This animal is eating.

  print('------------------------------------------');

  Animal elepan = Elephant();
  elepan.makeSound();
  elepan.eat();

  print('------------------------------------------');
}
