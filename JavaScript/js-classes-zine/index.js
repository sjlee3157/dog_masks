const SALES_TAX = 0.08;

class Zine {
  constructor(name,
      publisher = 'Zif Davis',
      price = 9.99) {
    this.name = name;
    this.publisher = publisher;
    this.price = price;
  }

  toString() {
    return `${this.name} by ${this.publisher}`;
  }

  totalPrice() {
    return this.price * (1 + SALES_TAX);
  }

  static lowestPrice(zineA, zineB) {
    if (zineA.price <= zineB.price) {
      return zineA.name;
    }

    return zineB.name;
  }
}

class Fanzine extends Zine {
  constructor(name, publisher, price, subject) {
    super(name, 'Self Publishing', price);

    this.subject = subject;
  }

  toString() {
    return `${super.toString()} about ${this.subject}`;
  }
}

const theQuibbler = new Zine('The Quibbler',
  'Tor Books',
  19.99
  );
theQuibbler.pageViews = 2000000000;
const knittingForCats = new Fanzine('Knitting for Kats', 'C for life', 6.75, 'Knit & Perrrrrrul');

const cheapest = Zine.lowestPrice(theQuibbler, knittingForCats);

console.log(`The Cheapest Zine is ${cheapest}`);

const payment = theQuibbler.totalPrice();
console.log(payment);


console.log(knittingForCats.toString());
console.log(theQuibbler.toString());
console.log(theQuibbler.name);
console.log(theQuibbler['name']);
// console.log(theQuibbler['nae']);
