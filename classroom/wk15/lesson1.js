const person = {
  firstName: 'Tom',
  lastName: 'Cruise',
  actor: true,
  age: 54, //made up
};
const {firstName: name, age} = newPerson;
console.log(newPerson);
console.log(person);
console.log(person.actor);

const sayMeow = function catSound() {
  return 'Meow!';
};

sayMeow();

const animal = {
  dogSound() {
    return 'Woof!';
  },
  species: 'dog',
  sound: function() {
    console.log('Dog Sound!!!');
  },
  describeCat() {
    console.log(`A cat goes ${sayMeow()}`);
  },
  describeThis() {
    console.log(`A ${this.species} goes ${this.dogSound()}`);
  }
};

animal.describeCat();
animal.describeThis();
animal.sound();

// Invoke the callback function on every number from 0 through 9,
// and print the results to the command line
const doMath = function doMath(callback) {
  for (let i = 0; i < 10; i += 1) {
    let result = callback(i);
    console.log(`${i}: ${result}`);
  }
};

const double = function double(number) {
  return number + number;
};

// Pass the function by name
doMath(double);

// Now try it passing in an anonymous function:

let data = [4, 7, 9 , 12, 3, 18, 6];
let sum = 0;
let number = 0;

data.forEach(function(num) {
  sum += num;
});

console.log(sum);

let average = sum / data.length;
console.log(`Average is ${average}`);
