// a functional class
using System;
// the USING keyword imports a namespace
// a namespace is a collection of classes
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        // the params modifier
        // arbitrary number of params in an array
        
        // long way to call it:
        // GreetPersons(new string[] { "John", "Jane", "Tarzan" });

        // better way with params keyword
        // static void GreetPersons(params string[] names) { }
        // GreetPersons("John", "Jane", "Tarzan");
        // params keyword also makes params optional (0 params)
        // can mix optional and required params
        // params keyword has to come last
        // static void GreetPersons(int someUnusedParameter, params string[] names)
        
        // static: 
        // method should be accessible without instantiating the class (aka a class method in Ruby)
        // Main is the entry point: 
        // first code to be executed
        static void Main(string[] args)
        {
            // Variable
            // declare variable with type car
            Car car;
            
            // new instance of it with parameter "Red"
            car = new Car("Red");
            Console.WriteLine(car.Describe());

            // another instance of same class
            car = new Car("Green");
            Console.WriteLine(car.Describe());
            
            // reads the next line of characters from the standard input stream
            // returns String or null
            Console.ReadLine();
            // compare to Console.Read();
            // reads the next character from the standard input stream
            // returns Int32 or -1 if none

            // this ReadLine is a trick to keep the window from closing until prompted
        }
    }

    class Car
    {
        // Variable
        // good practice to define variables as private
        // accessing variables from outside should be done using a property
        private string color;

        // Constructor
        // takes one parameter (initialized with color)
        // I think there can be multiple constructors?
        public Car(string color)
        {
            this.color = color;
        }

        // Method
        public string Describe()
        {
            return "This car is " + Color;
        }

        // define the public color property
        // gives access to the color variable
        public string Color
        {
            get { return color; }
            set { color = value; }
        }
    }
}

// TODO
// HACK
// NOTE
// UNDONE

/// single-line XML Documentation Comments
/// <summary>
/// The Name of the User.
/// </summary>

/// multi-line XML Documentation Comments
/**
* <summary>The Age of the User.</summary>
*/