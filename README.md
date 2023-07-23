# UIKit-Data-Passing-Techniques


This repository showcases various ways to pass data from one ViewController to another. Each method is provided with its own example and usage instructions.

The examples in this repository are based on UIKit and include code for the following methods:

1. **Delegation**: This method is used typically when one ViewController needs to receive data from another ViewController. The delegate is defined with a certain protocol to perform a specific task.

2. **NotificationCenter**: This method is used as a broadcasting mechanism to send information to multiple listeners. Any object can register with NotificationCenter to respond to a particular event.

3. **RxSwift**: This library uses the concepts of reactive programming to manage asynchronous programming and data streams. RxSwift handles complex situations of data passing from one ViewController to another.

4. **Closure**: Closures capture and store blocks of code that can function similarly. This method is used when one ViewController needs to receive data from another ViewController. Closures often result in code that is more readable and organized.

## Getting Started

Ensure that the dependencies are correctly installed before running each example. For the RxSwift example, verify that your project includes the RxSwift library.

## License

This project is licensed under the MIT license
