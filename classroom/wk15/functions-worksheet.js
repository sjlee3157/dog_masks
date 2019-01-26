// JavaScript Worksheet: Functions
//https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/exercises/functions-worksheet.md

const hello = function hello() {
  console.log("hello!")
};

hello();

const sayNum = function sayNum(number) {
  console.log(`Your number is ${number}.`)
};

sayNum(3);

// With a function expression:
const largerNum = function largerNum(first, second) {
  if (first >= second) {
    return first;
  } else if (second > first) {
    return second;
  }
};

console.log(largerNum(42, 17));

// With a function declaration:
// Must rename the function otherwise you get this error:
// Identifier 'largerNum' has already been declared
function largerNumDeclaration(first, second) {
  if (first >= second) {
    return `Answer is ${first}`;
  } else if (second > first) {
    return `Answer is ${second}`;
  }
};

console.log(largerNumDeclaration(42, 17));

// Anonymous function in a forEach loop:
const output = function output(items) {
  items.forEach(function(item) {
    console.log(item);
  }
)};

output(["purple", "prickly", "porcupine"]);

// Part 2

// Invoke the Zombies
const zombies = function() {
  return "We like to eat people";
};

console.log(zombies());

// Hey hey hey
console.log(function (third) {
  return `Hey hey ${third}`;
}("yodel"));

// Blabbermouth
const blabbermouth = function() { };
console.log(blabbermouth.name);
console.log(largerNumDeclaration.name);
console.log(output.name);
