const outerFunction = () => {
  let outerVariable = 0;

  return () => {
    outerVariable += 1;
    console.log(`This is call number ${outerVariable}`);
  }
}

const incrementer = outerFunction();
incrementer();
incrementer();
incrementer();

const anotherIncrementer = outerFunction();
anotherIncrementer();
anotherIncrementer();
anotherIncrementer();
