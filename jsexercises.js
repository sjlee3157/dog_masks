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
