const buildClickHandler = (color) => {
  let square = 0;
  return () => {
    square = color;
    console.log(square);
  }
};

// $(document).ready(() => {
//   ["red", "blue", "green"].forEach((color) => {
//     const element = $("button." + color);
//     const clickHandler = buildClickHandler(color);
//     element.click(clickHandler);
//   });
// });

const clickHandler = buildClickHandler('red');
clickHandler();
