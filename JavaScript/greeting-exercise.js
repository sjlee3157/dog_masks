// sayHi is a regular, degular function:
const sayHi = () => {
  return 'hi';
}

// sayGreeting is expecting a variable that can be called as a function:
const sayGreeting = (callGreeting) => {
  console.log(callGreeting().toUpperCase()); // sayGreeting expects to be able to call the variable as a function.
}

sayGreeting(sayHi);

// sayAnotherGreeting, on the other hand, is expecting a variable that will not be called as a function,
// so if we want to pass in a function, we have to call it WHEN we pass it in:
const sayAnotherGreeting = (callGreeting) => {
  console.log(callGreeting.toUpperCase() );
}

// here is how we do that:
sayAnotherGreeting(sayHi());
// If we try to call sayAnotherGreeting(sayHi),
// we get an error because of line 16:
        // callGreeting.toUpperCase is not a function
// but if line 16 were changed to:
        // console.log(callGreeting);
// we wouldn't get an error. Instead, line 16 would display:
        // [Function: sayHi]

const createCakeLabel = (ingredients) => {
  return `Delicious ${ingredients[0]} Cake 🍰. Ingredients: ${ingredients}`;
};

const groceries = ['strawberries', 'sugar', 'eggs', 'flour', 'cream'];

console.log(createCakeLabel(groceries))
