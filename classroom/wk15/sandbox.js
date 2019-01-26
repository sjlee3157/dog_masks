// dont_user_var = "A poorly made variable"
// puts dont_user_var
//
let dont_user_var = "A poorly made variable";
console.log(dont_user_var);
//
// person_age = 55
// ada_age = 2
//
// if person_age < ada_age
//    print "This person is younger"
// elsif ada_age < person_age
//    print "Ada is younger"
// else
//    print "They’re the same!"
// end

let person_age = 55;
let ada_age = 2;

if (person_age < ada_age) {
  console.log('This person is younger');
} else if (ada_age < person_age) {
  console.log('Ada is younger');
} else {
  console.log('They\'re the same!');
}

//
// x = 1
// y = 3
//
// if x > y || x == y
//    if x > y
//       print "x is bigger"
//    else
//       print "x = y"
//    end
// else
//    print "y is bigger"
// end
//
let x = 1
let y = 3

if (x > y || x === y) {
  if (x > y) {
    console.log('x is bigger');
  } else { console.log('x = y');
  }
} else {
  console.log('y is bigger');
}

// 10.times do |i|
//   puts i * i
// end

// for (initialization; condition; increment) {
//   // do work!
// }
//
// Initialization: Runs before the loop, often used to set up a counter variable
// Condition: Runs before each iteration (including the first), determines whether the loop should keep going
// Increment: Runs after each iteration, sets up the following iteration

let i;
for (i = 0; i < 10; i+= 1) {
  console.log(`${i}`);
}

// total = 0
//
// (1..3).each do |i|
//   total = total + i
// end
//
// puts total


const speak = function meow(){
  console.log('Meow!');
};

// function pointers!

// This is a function declaration!
// use curly braces to encapsulate our methods
// need () for parameters EVEN if empty. bark()

speak();

// the stack trace will show the function (right side),
// not the pointer (left side)
// you can treat a function like any other piece of data assigned
// to a variable.

// you point to functions in JS, like objects in Ruby.
// JS is a functional language: a language built on calling functions

// const say_it_twice = function double() {
//   speak();
//   speak();
// }

// say_it_twice();

// we're stuck with positional arguments and do not have keyword arguments
const sayItTwice = function sayItTwice(text = "Javascript is SUPER RAD", times = 2){
  for(let i = 0; i < times; i++) {
    console.log(text);
  }
};

// for (initialization; condition; increment) {
//   // do work!
// }
//
// Initialization: Runs before the loop, often used to set up a counter variable
// Condition: Runs before each iteration (including the first), determines whether the loop should keep going
// Increment: Runs after each iteration, sets up the following iteration

// sayItTwice();
sayItTwice(5,"Javascript is A-OK");
// sayItTwice(5,"3");
sayItTwice("text is also OK!",3);



// console.log(sayWoof());
