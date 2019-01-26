// acme.cs (source file)
// a program is 1+ source files
// a compiled program is an assembly (.exe, .dll)
using System;
namespace Acme.Collections

// Types: Classes and interfaces
// Members: Fields, methods, properties, and events.

{
    // a class is a type; programs declare types
    // types have members and are organized into namespaces
    // full class name is Acme.Collections.Stack
    public class Stack
    
    {
        // Member 1: a field named "top"
        // "StackItem" means that Stack.top is a StackItem.
        StackItem top;

// Properties allow you to control the accessibility of a class's variables, and is the recommended way to access variables from the outside in an object oriented programming language like C#.

        // Member 2: a public method named "Push()"
        // Stack.Push takes an object as a parameter and returns nothing ("void").
        public void Push(object data)
        {
            // "top" refers to the field declared above.
            // We rewrite/reset the value of Stack.top to another StackItem.
            // "new" calls the StackItem's constructor and takes 2 parameters, a StackItem and an object.
            top = new StackItem(top, data);
        }

        // Member 2: a public method named "Pop()"
        // Stack.Pop() takes no parameters and returns an object.
        public object Pop()
        {
            if (top == null)
            {
                throw new InvalidOperationException();
            }
            // "output" is a new variable, so we must declare its type ("object")
            object output = top.data;
            top = top.next;
            return output;
        }

        // Member 3: a nested class named "StackItem"
        class StackItem
        {
            // Member 1: a field named "next"
            public StackItem next;

            // Member 2: a field named "data"
            public object data;

            // Member 3: a constructor
            public StackItem(StackItem next, object data)
            {
                // "this" refers to current instance of the StackItem class
                // "this.next" and "this.data" refer to StackItem.next and StackItem.data
                this.next = next;
                this.data = data;
            }
        }
    }
}

// static void Main() => Console.WriteLine("Hello, I am the Main entry point!");
// code without a Main() entry point will be compiled as a library (.dll)

// To compile in Windows with the csc Windows executable:
// $ csc /t:library acme.cs

// To use C# across other platforms, you should use the tools for .NET Core. 
// The .NET Core ecosystem uses the dotnet CLI to manage command line builds. 
// This includes managing dependencies, and invoking the C# compiler. 