const sayHi = () => {
  return 'hi';
}

const sayGreeting = (callGreeting) => {
  console.log(callGreeting().toUpperCase() );
}

sayGreeting(sayHi);

const sayAnotherGreeting = (callGreeting) => {
  console.log(callGreeting.toUpperCase() );
}

sayAnotherGreeting(sayHi());


// const createCakeLabel = (ingredients) => {
//   return `Delicious ${ingredients[0]} Cake 🍰. Ingredients: ${ingredients}`;
// }
//
// const groceries = ['strawberries', 'sugar', 'eggs', 'flour', 'cream'];
//
// console.log(createCakeLabel(groceries));
