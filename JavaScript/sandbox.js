// let arrayOfNums = [2, 7, 7, 3, 9, 0, 1, 6, 8, 3, 8, 4, 7, 9];
//
// const getBiggest = function getBiggest(array) {
//   // The spread operator:
//   // This operator causes the values in the array to be expanded, or “spread”, into the function’s arguments.
//   return Math.max(...array);
// };
//
// // pass an array to getBiggest;
// // get a return value that is the biggest number in the array
// //
// let biggest = getBiggest(arrayOfNums);
// console.log(`The biggest is: ${biggest}`);

const submitForm = function() {
  console.log("Submit button clicked");
  console.log(this);
};

$(document).ready(function() {
   $('#submit-button').click(submitForm);
});
