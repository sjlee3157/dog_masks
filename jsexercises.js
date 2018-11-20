// Intro to JS
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/welcome-to-js.md

// Linter setup
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/exercises/setup-linting.md

// Ruby to JS worksheet
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/exercises/ruby-to-js-worksheet.md

// Fun with functions! lesson:
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/fun-with-functions.md

// JS Functions Worksheet:
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/exercises/functions-worksheet.md

// Arrow Functions lesson:
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/arrow-functions.md

// Jest testing
// https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/testing.md

// Adagrams I:
// https://github.com/AdaGold/adagrams#readme

// MDN Reintroduction to JS tutorial:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript

// Ruby to JS problem set!

let personAge = 55;
let adaAge = 2;

if (personAge < adaAge) {
  console.log('This person is younger');
} else if (adaAge < personAge) {
  console.log('Ada is younger');
} else {
  console.log("They're the same!")
}

//

let x = 7;
let y = 7;

if (x > y || x === y) {
  if (x > y) {
    console.log('x is bigger');
  } else {
    console.log('x = y');
  }
} else {
  console.log('y is bigger');
}

//

for (let i = 0; i < 10; i++) {
  console.log(i*i);
}

//

let total = 0;
let range = [1,2,3];

for (let elm of range) {
  total = total + elm;
}
console.log(total);

//

let i = 0;
while (i < 3) {
  console.log('hi');
  i = i + 1;
}

console.log('bye');

//

let fruits = ["banana", "apple", "kiwi"];
for (let fruit of fruits) {
  console.log(`I love ${fruit}!`);
}

//

let anotherTotal = 0;
let values = [4, 6, 2, 8, 11];
for (let value of values) {
  anotherTotal = anotherTotal + value;
}

console.log(anotherTotal);

//

let moreValues = [8, 5, 3, 10, 14, 2];
for (let value of moreValues) {
  if (value === 10) {
    console.log('Special case!');
  } else {
    console.log(`Regular values like ${value}!`);
  }
}

// Functions Worksheet

const hello = function hello() {
  console.log('hello!');
};
hello();
const helloArrowFunction = () => console.log('hello!');
helloArrowFunction();

//

const sayNum = function sayNum(number) {
  console.log(`Your number is ${number}.`);
};
sayNum(1);

const sayNumAnonymously = function(number) {
  console.log(`Your number is ${number}.`);
};
sayNumAnonymously(2);

const sayNumWithArrow = number => console.log(`Your number is ${number}.`);
sayNumWithArrow(3);

function sayNumAsFunctionalDeclaration(number) {
  console.log(`Your number is ${number}.`);
}
sayNumAsFunctionalDeclaration(4);

//

const largerNum = function largerNum(first, second) {
  if (first >= second) {
    return first;
  } else if (second > first) {
    return second;
  }
}
console.log(largerNum(99,1));

const largerNumWithArrowAndTernary = (first, second) => {
  return (first >= second) ? first : second;
}
console.log(largerNumWithArrowAndTernary(44,1));

//
let latestItems = ['little','bunny','foo','foo']
const output = function output(items) {
  items.forEach(function (item) {
    console.log(item);
  });
}
output(latestItems);

const outputWithArrow = items => {
  items.forEach(function (item) {
    console.log(item);
  });
}
outputWithArrow(latestItems);

//
// We like to eat people
const zombies = function() {
  return "We like to eat people";
};

console.log(zombies());

//
// Hey hey hey
console.log(function () {
  return "Hey hey hey";
}());

//
// motormouth is the name of the function referenced by blabbermouth
const blabbermouth = function motormouth() { };
console.log(blabbermouth.name);
//undefined (but only because it's empty)
console.log(blabbermouth());

// JS Function exercises
// Exercise #1: // ToDo:

const toDo = {
  description: 'the thing to be done',
  assignee: 'the name of a person to do it',
  done: false,
  printStatus() {
    let status = (this.done) ? 'is' : 'is not yet';
    console.log(`Task "${this.description}" belongs to "${this.assignee}" and ${status} done.`);
  }
};

toDo.printStatus();

// Exercise #2: // Biggest Number in Array:

let arrayOfNums = [2, 7, 7, 3, 9, 0, 1, 6, 8, 3, 8, 4, 7, 9];

const getBiggest = function getBiggest(array) {
  // The spread operator:
  // This operator causes the values in the array to be expanded, or “spread”, into the function’s arguments.
  return Math.max(...array);
};

// pass an array to getBiggest;
// get a return value that is the biggest number in the array
//
let biggest = getBiggest(arrayOfNums);
console.log(`The biggest is: ${biggest}`);














//
