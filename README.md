# README

## Request
There is a need for a Rest (or Rest-like) API that can receive an index `n` and returns the Fibonacci value that corresponds to the given index.

### Example
The first values of the Fibonacci sequence are 0, 1, 1, 2, 3, 5, 8, 13, ..., so, if we were to give the API the index `n=3`, we should get the response value `2`, and if we request `n=6`, we should get `8` as the response, and so on.

### How to use
Make GET requests to the endpoint `https://control-hub-fibonacci-api.herokuapp.com/fibonacci-values/<index>`, placing the index number you want to request in the `<index>` field.

## Implementation

The application is buil in:

* Ruby 3.1.0
* Rails 7.0.2

Runing in Heroku

It consists of:
* One controller to process the request to the only endpoint available
* One service to make the needed calculations.

### About the service

The controller should only handle request-related logic, and the calculation logic don't belong there. Also, there's no need to create a model since the application won't be storing anything in the database, and the data we need to return needs to be calculated, not retrieved from storage. That's why I decided to place the calculation logic inside a service object.

#### Logic behind the service
I used a standard `while` loop to calculate the Fibonacci sequence, the index being the constraint that will terminate the loop. The implemented algorithm has **O(n)** running time, where `n` is the index given.

I used Ruby’s dynamic arrays to continuously push Fibonacci values to the `sequence` array (stack) until the program reaches the desired index. To check the loop ending condition, I also used another feature of Ruby. The language will return a `nil` value for array indexes that haven’t been assigned.

The logic is: Keep pushing Fibonacci sequence values to the `sequence` array until a value is assigned in the desired index `n`. Once `sequence[n]` has a value assigned, the loop ends, and we return the value from the given index.

## Invalid input
The application only accepts integers equal to or greater than `0`, and less than `1001`. It will return an error JSON for everything else.

### About the constraints
There's no reason to provide a word or sentence as an argument, we want to get a value from an index given, so everything that's not a number should be automatically discarded.

There are ways to extend the Fibonacci sequence to negative numbers, for the simplicity of this exercise. It will only accept integers equal or greater than `0`.

The `1000` limit is imposed to avoid costly calculations and byte overflows. For the simplicity of this exercise, that value was set arbitrarily.

## Tests
I created a test file for requests to the API. All test cases are handled as requests to the server, and they evaluate what's being returned. The correct thing to do would've been to also unit test the service object behavior in a separate test file. Since the application is very basic and it won't continue growing, I decided to place all the possible scenarios in the `fibonacci_values_spec.rb` and test them in the form of requests. 

## Hypothetical next steps
The first things I would work on if I needed to continue working in this application would be:
* Find an optimal value for the maximum index the API can calculate the value of.
* Create unit tests for the service object that makes the calculations.
