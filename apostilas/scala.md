<style>svg.railroad-diagram path { stroke-width: 3; stroke: black; fill: rgba(0,0,0,0); } svg.railroad-diagram text {   font: bold 14px monospace; text-anchor: middle; } svg.railroad-diagram text.label { text-anchor: start; } svg.railroad-diagram text.comment { font: italic 12px monospace; } svg.railroad-diagram rect { stroke-width: 3; stroke: black; fill: hsl(120,100%,90%); }</style>

Scala
=====

[TOC]

Before we talk about Scala, let's talk about functions. First of all, we need to understand what functions are, and what they mean in the context of programming.

First of all, functions came from the mathematics, so we'll look at these functions first. 

## Mathematical functions

When we're solving some equation on math, we will use functions. A function is, simply, some name that maps a number of "identifiers" into a result. For instance, let's take a function that simply sums any number by two:

`f(x) = x + 2`

In this example, we have a function named `f`. This function maps an *identifier*, in this case, `x`, to a function. That function simply sums the *identifier* with `2`. So:

```
f(x) = x + 2
f(4) = 4 + 2
f(4) = 6
```

The first line is what we call **function definition**, because it **defines** a function (in this case, `f`). The second line is what we call the **function application**, because it **applies** a parameter (in this case, the `4`) into the function. When we **apply** a function, we get a result. It is as simple as that.

### Discontinuous functions

In math, we can have functions which are *discontinuous*. Such functions have the following format:

$$
\begin{equation}
    f(x) = \begin{cases}
        \frac{1}{x} & \text{for x} \neq 0 \\
        1 & \text{for x} = 0
    \end{cases}
\end{equation}
$$

This function is called *discontinuous* because of the *condition*: if the variable `x` is different from zero, then the function is `1` divided by `x`. If it is equals to zero, then the function result is zero. In most programming languages, we have the `if` command that will serve the purpose to decide which path we should take, if a condition is true. But, before that, let's see how would we translate this condition above to most of programming languages we have today:

```
f(x) = 1 / x if x != 0
f(x) = 0 if x == 0
```

Notice that the **equals** sign is written as `==`. The **different** sign, is written as `!=`. And, the **division** is written as `/`. If we had a multiplication, we would write as `*`. But this code, above, is still not a Scala code - but, before we present the scala code for that, we should look into another kind of function:

### Partial functions

In math, a *partial function* is one that is defined only for a specific subset. Let's see, for instance, this kind of function: 

$$
\begin{equation}
    factorial(x) = \begin{cases}
        x * factorial(x - 1) & \text{for x} \gt 0 \\
        1 & \text{for x} = 0
    \end{cases}
\end{equation}
$$

So, what's the result for `x` that is below zero? The answer is, is **undefined** - we have no result. This kind of function is called a *partial function* because it is defined only for a subset of "x". In this sense, **all functions** in programming languages are partial functions - because they are only defined for a specific subset of objects - but we should get into this later. For now, let's see how is the Scala code for that:

## Scala code for functions

Let's pick our first example: the one where we defined a function that sums a number with `2`. To be able to define this function, we need to specify for **which kind of parameters** our function will work: will it work with integers only? Or, will it accept decimals too? This kind of information we call the *type* of the parameter. For now, let's say our function will only work for integers: in Scala, the type for integers is `Int`, and we'll define that some identifier is of type `Int` by suffixing it with `: Int`. So, let's say we want to say that `x` is of type `Int`: we'll use the syntax `x: Int`.

We define functions using the keyword `def`. So, to define our function, we say:

```scala
def sumByTwo(x: Int): Int = x + 2
```

### A quick detour

To be able to understand more of our Scala code, we'll use a simple kind of diagram called **railroad diagram**. Like a real railroad, you **must** follow the lines, and you can't go back. Like a real railroad, any path you follow will lead you to a working code. Let's see a simple example: suppose you want to say "Hello" to a bunch of people, in English. And it's morning. These are the ways you can say it:

<svg class="railroad-diagram" width="785" height="160" viewBox="0 0 785 160"><g transform="translate(.5 .5)"><path d="M 20 21 v 20 m 10 -20 v 20 m -10 -10 h 20.5"></path><g><path d="M40 31h0"></path><path d="M248 31h0"></path><path d="M40 31h20"></path><g><path d="M60 31h0"></path><path d="M228 31h0"></path><path d="M60 31h10"></path><g><path d="M70 31h0"></path><path d="M122 31h0"></path><rect x="70" y="20" width="52" height="22" rx="10" ry="10"></rect><text x="96" y="35">Good</text></g><path d="M122 31h10"></path><path d="M132 31h10"></path><g><path d="M142 31h0"></path><path d="M218 31h0"></path><rect x="142" y="20" width="76" height="22" rx="10" ry="10"></rect><text x="180" y="35">Morning</text></g><path d="M218 31h10"></path></g><path d="M228 31h20"></path><path d="M40 31a10 10 0 0 1 10 10v10a10 10 0 0 0 10 10"></path><g><path d="M60 61h54"></path><path d="M174 61h54"></path><rect x="114" y="50" width="60" height="22" rx="10" ry="10"></rect><text x="144" y="65">Hello</text></g><path d="M228 61a10 10 0 0 0 10 -10v-10a10 10 0 0 1 10 -10"></path></g><g><path d="M248 31h0"></path><path d="M744 31h0"></path><path d="M248 31h20"></path><g><path d="M268 31h456"></path></g><path d="M724 31h20"></path><path d="M248 31a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><g><path d="M268 51h0"></path><path d="M724 51h0"></path><path d="M268 51h10"></path><g><path d="M278 51h0"></path><path d="M306 51h0"></path><rect x="278" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="292" y="55">,</text></g><path d="M306 51h10"></path><path d="M316 51h10"></path><g><path d="M326 51h0"></path><path d="M394 51h0"></path><rect x="326" y="40" width="68" height="22"></rect><text x="360" y="55">&lt;name></text></g><path d="M394 51h10"></path><g><path d="M404 51h0"></path><path d="M724 51h0"></path><path d="M404 51h20"></path><g><path d="M424 51h280"></path></g><path d="M704 51h20"></path><path d="M404 51a10 10 0 0 1 10 10v9a10 10 0 0 0 10 10"></path><g><path d="M424 80h0"></path><path d="M704 80h0"></path><g><path d="M424 80h0"></path><path d="M552 80h0"></path><path d="M424 80a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path><g><path d="M444 60h88"></path></g><path d="M532 60a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><path d="M424 80h20"></path><g><path d="M444 80h0"></path><path d="M532 80h0"></path><path d="M444 80h10"></path><g><path d="M454 80h0"></path><path d="M522 80h0"></path><rect x="454" y="69" width="68" height="22"></rect><text x="488" y="84">&lt;name></text></g><path d="M522 80h10"></path><path d="M454 80a10 10 0 0 0 -10 10v10a10 10 0 0 0 10 10"></path><g><path d="M454 110h20"></path><path d="M502 110h20"></path><rect x="474" y="99" width="28" height="22" rx="10" ry="10"></rect><text x="488" y="114">,</text></g><path d="M522 110a10 10 0 0 0 10 -10v-10a10 10 0 0 0 -10 -10"></path></g><path d="M532 80h20"></path></g><path d="M552 80h10"></path><g><path d="M562 80h0"></path><path d="M606 80h0"></path><rect x="562" y="69" width="44" height="22" rx="10" ry="10"></rect><text x="584" y="84">and</text></g><path d="M606 80h10"></path><path d="M616 80h10"></path><g><path d="M626 80h0"></path><path d="M694 80h0"></path><rect x="626" y="69" width="68" height="22"></rect><text x="660" y="84">&lt;name></text></g><path d="M694 80h10"></path></g><path d="M704 80a10 10 0 0 0 10 -10v-9a10 10 0 0 1 10 -10"></path></g></g><path d="M724 51a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path></g><path d="M 744 31 h 20 m -10 -10 v 20 m 10 -20 v 20"></path></g></svg>

If we follow the railroad, we'll see that there are only a bunch of ways to say Hello: we follow the "Good" and "Morning" path, or we follow the "Hello" path: So, first of all, we got `Good Morning` or `Hello` as possible ways to say it - please notice that rounded squares means that we need to write **exactly** as is written - not even lower and upper case can be changed. 

Following, we can simply go to the end, or we can use a comma (`,`) followed by a `<name>` - here, we have a square. Squares means that what we'll say is variable - we just need to follow a bunch of rules, that we'll detail later. In this case, **name** is just what it says - a person's name. Let's use "Alice" in this example. If we follow this path, we end with: `Good Morning, Alice` or `Hello, Alice`. Then, we end.

There's another way, that it's the third path - we can have multiple (more than one) names, following the rule: we put a comma, a name, and we can put another comma and another name (here, the process repeats), and we end it with `and` and another name. So, in this case, `Alice and Bob`, `Alice, Bob and Eve`, even `Alice, Bob, Richard, Eve, Santa and Silva` are valid paths. And then, we end - so, possible ways to say "Hello", following this path, are `Hello, Alice and Bob`, `Good Morning, Alice, Bob and Eve`, and so forth.

### Function definition, revisited

The full syntax of defining functions, in Scala, is the following railroad diagram:

<svg class="railroad-diagram" width="1293" height="321" viewBox="0 0 1293 321"><g transform="translate(.5 .5)"><path d="M 20 21 v 20 m 10 -20 v 20 m -10 -10 h 20.5"></path><path d="M40 31h10"></path><g><path d="M50 31h0"></path><path d="M94 31h0"></path><rect x="50" y="20" width="44" height="22" rx="10" ry="10"></rect><text x="72" y="35">def</text></g><path d="M94 31h10"></path><path d="M104 31h10"></path><g><path d="M114 31h0"></path><path d="M206 31h0"></path><rect x="114" y="20" width="92" height="22"></rect><text x="160" y="35">&lt;fn-name></text></g><path d="M206 31h10"></path><g><path d="M216 31h0"></path><path d="M724 31h0"></path><path d="M216 31h20"></path><g><path d="M236 31h468"></path></g><path d="M704 31h20"></path><path d="M216 31a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><g><path d="M236 51h0"></path><path d="M704 51h0"></path><path d="M236 51h10"></path><g><path d="M246 51h0"></path><path d="M274 51h0"></path><rect x="246" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="260" y="55">(</text></g><path d="M274 51h10"></path><g><path d="M284 51h0"></path><path d="M656 51h0"></path><path d="M284 51h20"></path><g><path d="M304 51h332"></path></g><path d="M636 51h20"></path><path d="M284 51a10 10 0 0 1 10 10v9a10 10 0 0 0 10 10"></path><g><path d="M304 80h0"></path><path d="M636 80h0"></path><path d="M304 80a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path><g><path d="M324 60h292"></path></g><path d="M616 60a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><path d="M304 80h20"></path><g><path d="M324 80h0"></path><path d="M616 80h0"></path><path d="M324 80h10"></path><g><path d="M334 80h0"></path><path d="M606 80h0"></path><path d="M334 80h10"></path><g><path d="M344 80h0"></path><path d="M460 80h0"></path><rect x="344" y="69" width="116" height="22"></rect><text x="402" y="84">&lt;param-name></text></g><path d="M460 80h10"></path><path d="M470 80h10"></path><g><path d="M480 80h0"></path><path d="M508 80h0"></path><rect x="480" y="69" width="28" height="22" rx="10" ry="10"></rect><text x="494" y="84">:</text></g><path d="M508 80h10"></path><path d="M518 80h10"></path><g><path d="M528 80h0"></path><path d="M596 80h0"></path><rect x="528" y="69" width="68" height="22"></rect><text x="562" y="84">&lt;type></text></g><path d="M596 80h10"></path></g><path d="M606 80h10"></path><path d="M334 80a10 10 0 0 0 -10 10v10a10 10 0 0 0 10 10"></path><g><path d="M334 110h122"></path><path d="M484 110h122"></path><rect x="456" y="99" width="28" height="22" rx="10" ry="10"></rect><text x="470" y="114">,</text></g><path d="M606 110a10 10 0 0 0 10 -10v-10a10 10 0 0 0 -10 -10"></path></g><path d="M616 80h20"></path></g><path d="M636 80a10 10 0 0 0 10 -10v-9a10 10 0 0 1 10 -10"></path></g><path d="M656 51h10"></path><g><path d="M666 51h0"></path><path d="M694 51h0"></path><rect x="666" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="680" y="55">)</text></g><path d="M694 51h10"></path></g><path d="M704 51a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path></g><g><path d="M724 31h20a10 10 0 0 1 10 10v90a10 10 0 0 1 -10 10h-724a10 10 0 0 0 -10 10v31a10 10 0 0 0 10 10"></path></g><g><path d="M20 192h0"></path><path d="M252 192h0"></path><path d="M20 192h20"></path><g><path d="M40 192h192"></path></g><path d="M232 192h20"></path><path d="M20 192a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><g><path d="M40 212h0"></path><path d="M232 212h0"></path><path d="M40 212h10"></path><g><path d="M50 212h0"></path><path d="M78 212h0"></path><rect x="50" y="201" width="28" height="22" rx="10" ry="10"></rect><text x="64" y="216">:</text></g><path d="M78 212h10"></path><path d="M88 212h10"></path><g><path d="M98 212h0"></path><path d="M222 212h0"></path><rect x="98" y="201" width="124" height="22"></rect><text x="160" y="216">&lt;return-type></text></g><path d="M222 212h10"></path></g><path d="M232 212a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path></g><g><path d="M252 192h0"></path><path d="M548 192h0"></path><path d="M252 192h20"></path><g><path d="M272 192h0"></path><path d="M528 192h0"></path><path d="M272 192h10"></path><g><path d="M282 192h0"></path><path d="M310 192h0"></path><rect x="282" y="181" width="28" height="22" rx="10" ry="10"></rect><text x="296" y="196">{</text></g><path d="M310 192h10"></path><path d="M320 192h10"></path><g><path d="M330 192h0"></path><path d="M470 192h0"></path><rect x="330" y="181" width="140" height="22"></rect><text x="400" y="196">&lt;function-body></text></g><path d="M470 192h10"></path><path d="M480 192h10"></path><g><path d="M490 192h0"></path><path d="M518 192h0"></path><rect x="490" y="181" width="28" height="22" rx="10" ry="10"></rect><text x="504" y="196">}</text></g><path d="M518 192h10"></path></g><path d="M528 192h20"></path><path d="M252 192a10 10 0 0 1 10 10v10a10 10 0 0 0 10 10"></path><g><path d="M272 222h34"></path><path d="M494 222h34"></path><rect x="306" y="211" width="188" height="22"></rect><text x="400" y="226">&lt;function-expression></text></g><path d="M528 222a10 10 0 0 0 10 -10v-10a10 10 0 0 1 10 -10"></path></g><path d="M 548 192 h 20 m -10 -10 v 20 m 10 -20 v 20"></path></g></svg>
  
  * **fn-name** is a function name. This defines the name of the function, and **must** be written with camelCase[^camelCase] notation
  * **param-name** is a parameter name. This defines the name of a parameter in a function, in camelCase notation. It can not have the same name as another parameter in this same function
  * **type** the type of parameter, like `Int` or `Double` or `String`. We'll see more types later, so for now, `Int` is an Integer, and `Double` is a Decimal.
  * **return-type**: the function, too, must return a type, so we declare it explicit here. We can omit this parameter, but sometimes the function will not be able to infer the return type, so we need to declare it explicit in these cases
  * **function-body** is a list of commands, statements, and such things that will be run when this function is called (applyied). We'll see "blocks of code" later
  * **function-expression** is a single expression that will be evaluated, and the return of this expression will be the return of the function. One of these possible expressions is `0` (in this case, it'll just return **0**), and other, more complicated ways to do this, is to use the `if` statement to evaluate a condition.

So, for instance, we could write the following functions (and all of then would be valid definitions):

```scala
def sum(param1: Double, param2: Double) = param1 + param2

def multiply(param1: Int, param2: Int): Int = param1 * param2

def square(number: Int) = multiply(number, number)

def sumOfSquares(param1: Int, param2: Int) =
  sum(square(param1), square(param2))
```

Below, there are some lines of code that work, and some that don't. Can you guess why? The answer is in a footnote[^answer1], but I **strongly** encourage you to understand why

```scala
// This is a comment: it will not be interpreted by Scala in any way
// This code below will not work. Can you guess why?
def multiplyByTwo(number: Double) = multiply(number, 2)

// But this code will work. Can you guess why?
def sumByTwo(number: Int) = sum(number, 2)
```

### Procedures, and expressions

For now, we saw a lot of code using "functions". But, so far, our program is simply a calculator - it doesn't **do** anything that any simple calculator can do. So, for now, let's talk about procedures.

We can understand functions, in programming languages, as something that gets a bunch of parameters, and returns an operation on these parameters (like sum, multiply, etc). We can imagine these "function" as verbs, like:

```
TO sum squares of two numbers n1 and n2
  we SUM
    the square of n1
    with the square of n2
```

Looking at the above description, it is easy to see that our implementation, above, was correct:

```scala
def sum(param1: Double, param2: Double) = param1 + param2

def multiply(param1: Int, param2: Int): Int = param1 * param2

def square(number: Int) = multiply(number, number)

def sumOfSquares(n1: Int, n2: Int) =
  sum(square(n1), square(n2))
```

Procedures are like functions, but they don't **return** anything. We'll see procedures later, but as for now, we can imagine a code that prints something into the screen as a procedure - it just prints something, it does not return anything and it is not expected to do it anyway. In Scala, there's a special type for procedures - `Unit`. So, in Scala, we can say that a procedure is a function that **returns** `Unit`, and that `Unit` is a special type that has no meaning, cannot be converted to and from anything, and **must** be discarded. 

As for functions, we're still missing one point: we need to know what is happening in the code. Suppose that I have the following application[^application] of the above function:

```scala
sumOfSquares(3, 4)
```

How will the computer computes the result of this function? Will it return an integer? What we're expecting is the result `25`, but it is correct?

#### The substitution principle

A simple way to check if this result is correct is to *substitute* all the parameters in the function, so we check if everything is working. Let's do it to the `sumOfSquares(3, 4)` and see if we get `25` in the end:

```scala
// Just to remember, these are the definitions:
def sum(param1: Double, param2: Double) = param1 + param2
def multiply(param1: Int, param2: Int): Int = param1 * param2
def square(number: Int) = multiply(number, number)
def sumOfSquares(n1: Int, n2: Int) = sum(square(n1), square(n2))

// And this is the call:
sumOfSquares(3, 4)

// First, we substitute the parameters in the order they appear:
def sumOfSquares(3, 4) = sum(square(3), square(n2))
def sumOfSquares(3, 4) = sum(square(3), square(4))

// Nothing to do, we expand now the parameters inside the "sum" function:
def square(3) = multiply(3, 3)
def square(4) = multiply(4, 4)
// So..
def sumOfSquares(3, 4) = sum(multiply(3, 3), multiply(4, 4))

// We have expanded "square", but even after the expansion, there's still
// parameters inside the "sum". Let's expand these too:
def multiply(3, 3) = 3 * 3
def multiply(4, 4) = 4 * 4
// So...
def sumOfSquares(3, 4) = sum(3 * 3, 4 * 4)
// So...
def sumOfSquares(3, 4) = sum(9, 16)

// Now, we expand the "sum" itself. Remember, "sum" takes a Double...
sum(9, 16) = 9.0 + 16.0
// So...
def sumOfSquares(3, 4) = 9.0 + 16.0
// So...
def sumOfSquares(3, 4) = 25.0
```

On the above substitution, we discovered an interesting thing: our `sumOfSquares` function is a function that maps two parameters of type `Int` to a single parameter of time `Double`. Scala correctly inferred the type for us, but maybe it wasn't what we wanted. So far, we need to be aware of these behaviors when writing our programs.

#### The "if" conditional

In most languages, there's a statement called **if**. Most of the time, **if** is written like:

```scala
if(<some-condition>) {
  //Do something
} else {
  //Do something else
}
```

It is important to understand that in Scala, `if` is an expression. Expressions are like functions - commands that returns something. So, we could say that an "if" statement is an special kind of function that maps a `Boolean` to an arbitrary type. The full "if" definition is the following:

<svg class="railroad-diagram" width="1073" height="252" viewBox="0 0 1073 252"><g transform="translate(.5 .5)"><path d="M 20 21 v 20 m 10 -20 v 20 m -10 -10 h 20.5"></path><g><path d="M40 31h0"></path><path d="M616 31h0"></path><path d="M40 31h10"></path><g><path d="M50 31h0"></path><path d="M86 31h0"></path><rect x="50" y="20" width="36" height="22" rx="10" ry="10"></rect><text x="68" y="35">if</text></g><path d="M86 31h10"></path><path d="M96 31h10"></path><g><path d="M106 31h0"></path><path d="M134 31h0"></path><rect x="106" y="20" width="28" height="22" rx="10" ry="10"></rect><text x="120" y="35">(</text></g><path d="M134 31h10"></path><path d="M144 31h10"></path><g><path d="M154 31h0"></path><path d="M262 31h0"></path><rect x="154" y="20" width="108" height="22"></rect><text x="208" y="35">&lt;condition></text></g><path d="M262 31h10"></path><path d="M272 31h10"></path><g><path d="M282 31h0"></path><path d="M310 31h0"></path><rect x="282" y="20" width="28" height="22" rx="10" ry="10"></rect><text x="296" y="35">)</text></g><path d="M310 31h10"></path><g><path d="M320 31h0"></path><path d="M616 31h0"></path><path d="M320 31h20"></path><g><path d="M340 31h0"></path><path d="M596 31h0"></path><path d="M340 31h10"></path><g><path d="M350 31h0"></path><path d="M378 31h0"></path><rect x="350" y="20" width="28" height="22" rx="10" ry="10"></rect><text x="364" y="35">{</text></g><path d="M378 31h10"></path><path d="M388 31h10"></path><g><path d="M398 31h0"></path><path d="M538 31h0"></path><rect x="398" y="20" width="140" height="22"></rect><text x="468" y="35">&lt;block-if-true></text></g><path d="M538 31h10"></path><path d="M548 31h10"></path><g><path d="M558 31h0"></path><path d="M586 31h0"></path><rect x="558" y="20" width="28" height="22" rx="10" ry="10"></rect><text x="572" y="35">}</text></g><path d="M586 31h10"></path></g><path d="M596 31h20"></path><path d="M320 31a10 10 0 0 1 10 10v10a10 10 0 0 0 10 10"></path><g><path d="M340 61h38"></path><path d="M558 61h38"></path><rect x="378" y="50" width="180" height="22"></rect><text x="468" y="65">&lt;expression-if-true></text></g><path d="M596 61a10 10 0 0 0 10 -10v-10a10 10 0 0 1 10 -10"></path></g></g><g><path d="M616 31h20a10 10 0 0 1 10 10v60a10 10 0 0 1 -10 10h-616a10 10 0 0 0 -10 10v31a10 10 0 0 0 10 10"></path></g><g><path d="M20 162h0"></path><path d="M436 162h0"></path><path d="M20 162h20"></path><g><path d="M40 162h376"></path></g><path d="M416 162h20"></path><path d="M20 162a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><g><path d="M40 182h0"></path><path d="M416 182h0"></path><path d="M40 182h10"></path><g><path d="M50 182h0"></path><path d="M102 182h0"></path><rect x="50" y="171" width="52" height="22" rx="10" ry="10"></rect><text x="76" y="186">else</text></g><path d="M102 182h10"></path><g><path d="M112 182h0"></path><path d="M416 182h0"></path><path d="M112 182h20"></path><g><path d="M132 182h0"></path><path d="M396 182h0"></path><path d="M132 182h10"></path><g><path d="M142 182h0"></path><path d="M170 182h0"></path><rect x="142" y="171" width="28" height="22" rx="10" ry="10"></rect><text x="156" y="186">{</text></g><path d="M170 182h10"></path><path d="M180 182h10"></path><g><path d="M190 182h0"></path><path d="M338 182h0"></path><rect x="190" y="171" width="148" height="22"></rect><text x="264" y="186">&lt;block-if-false></text></g><path d="M338 182h10"></path><path d="M348 182h10"></path><g><path d="M358 182h0"></path><path d="M386 182h0"></path><rect x="358" y="171" width="28" height="22" rx="10" ry="10"></rect><text x="372" y="186">}</text></g><path d="M386 182h10"></path></g><path d="M396 182h20"></path><path d="M112 182a10 10 0 0 1 10 10v10a10 10 0 0 0 10 10"></path><g><path d="M132 212h38"></path><path d="M358 212h38"></path><rect x="170" y="201" width="188" height="22"></rect><text x="264" y="216">&lt;expression-if-false></text></g><path d="M396 212a10 10 0 0 0 10 -10v-10a10 10 0 0 1 10 -10"></path></g></g><path d="M416 182a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path></g><path d="M 436 162 h 20 m -10 -10 v 20 m 10 -20 v 20"></path></g></svg>

* **condition** is an expression that returns a `Boolean`. Can be any function that returns boolean, or some comparission like `a == 10`, `b != 20`, etc.
* **block-if-true** is a block to run if the condition is `true`. Like said before, we'll talk more about blocks of code
* **expression-if-true** is an expression to be evaluated if the condition is `true`. It is important to say that **expression-if-true** is a **single** expression, not a block of expressions
* **block-if-false** is a block to run if the condition is `false`.
* **expression-if-false** is a single expression to run if the condition is `false`.

It is important to say that an `if` without an `else` can be considered a statement, and not a expression - for instance, if the **condition** is `false`, and we have no `else` clause, Scala does not know what to return, and will return `Unit` instead.

```scala
// Let's implement the discontinuous function that we have seen before
def discontinuous(x: Double) = if(x == 0) 0 else 1 / x
discontinuous(0) // Will return 0
discontinuous(2) // Will return 0.5
discontinuous(0.002) // Will return 500.0
```

### Recursive functions

Recursive functions are functions that need to call itself. The problem with recursive functions is that they can recurse itself to infinity, for instance, with the case:

```scala
def recursive(n: Int): Int = n + recursive(n - 1)

// Applying:
recursive(3)
// Expands to:
3 + recursive(2)
// Expands to:
3 + 2 + recursive(1)
// Expands to:
3 + 2 + 1 + recursive(0)
// Expands to:
3 + 2 + 1 + 0 + recursive(-1)
```

and so on, and the evaluation never ends. So, to be able to proper write recursive functions, we **need** to have a "stop condition": for instance, let's take the "factorial" example, but first let's convert it into a "complete" function: when x is equals **or** below zero, we return `1`. To implement it, we already have our "stop condition": if our element is zero or below:

```scala
// When declaring recursive functions, the return type of the
// function is ALWAYS needed.
def factorial(x: Int): Int = if(x <= 0) 1 else x * factorial(x - 1)
```

Let's try to apply it to `3`:

```scala
factorial(3) = if(3 <= 0) 1 else 3 * factorial(3 - 1)
// We know that 3 is greater than 0, so we can ignore the first part:
factorial(3) = 3 * factorial(2)
factorial(3) = 3 * (if(2 <= 0) 0 else 2 * factorial(2 - 1))
// Again, we can ignore the first part of the if:
factorial(3) = 3 * 2 * factorial(1)
// ...
factorial(3) = 3 * 2 * 1 * factorial(0)
factorial(3) = 3 * 2 * 1 * (if(0 <= 0) 1 else 0 * factorial(0 - 1))
// Now, we know that 0 is equals to 0, so we ignore the SECOND part:
factorial(3) = 3 * 2 * 1 * 1
factorial(3) = 6
```

We can see that in the above code, we have a problem with the return: everytime that we need to return something, we need to "remember" the last return, and calculate factorial again. This is problematic in most programming languages, and there's a better way to work around this that is called Tail Recursion.

### Tail recursive function

We say that a function is tail-recursive if, when recursing (in other words, when it calls itself) the function **only** calls itself, and don't do anything else before or after it calls itself: arithmetic expression, no concatenation, nothing. Let's see how to transform our `factorial` into a tail-recursive version.

First of all, we need to accumulate the results into an accumulator. In this case, we'll not multiply the number by the factorial of the `number - 1`, we'll pass this multiplication to the recursion. We'll create a parameter, named `acc`, that will accumulate the result of the multiplication. We'll give it a default value too - in this case, `1` - so that we don't need to call `factorial` with two parameters.

```scala
def factorial(x: Int, acc: Int = 1): Int = 
  if(x <= 0) acc else factorial(x - 1, x * acc)

// Let's apply it to three, again:
factorial(3)
// It will be expanded to:
factorial(3, 1) = if(3 <= 0) 1 else factorial(3 - 1, 3 * 1)
// As always, we'll evaluate the "if", and discard the "true" part:
factorial(3, 1) = factorial(2, 3)

// We don't have to "remember" anything - so, our call to
// factorial(3, 1) can be rewritten as factorial(2, 3):
// Please notice that the first part of the "if" returns the acc 
// parameter. So, in this case we'll return 3.
factorial(2, 3) = if(2 <= 0) 3 else factorial(2 - 1, 2 * 3)
factorial(2, 3) = factorial(1, 6)
factorial(1, 6) = factorial(0, 6)
factorial(0, 6) = if(0 <= 0) 6 else factorial(0 - 1, 6 * 0)
factorial(0, 6) = 6
```

This code will work **much** better, for the programming language, than the first version - the reason is that in this code, we don't need to remember states between each recursive call, so we'll use less memory.

### Procedures

In Scala, procedures are defined in the same way as functions, but we can ommit the return type of the function and the return type of the function and the `=` (because procedures don't return anything). But, we **must** include the `{` and `}` on the function.

```scala
def printNumber(number: Int) {
  println("The number is " + number)
}
```

Programming with procedures is the *standard way* on most object-oriented programming languages, but for now we'll skip it - there are better and less error-prone ways of programming than using procedures. We also introduced `String`s: a `String` is simply a text, delimited by `"`. We'll see later how to work with `String`s.

> **Notice**

> We introduced a *procedure* here called `println`. It simply prints the text on the screen, followed by a new line, and returns nothing. 

### Blocks of code

When writing functions or `if` expressions, sometimes it would be easier if we write then in multiple lines. For instance, imagine we need to do some simple arithmetic operations before doing our real code. To do a block of code, we start with a `{` and end with `}`. The last expression in the block will be the return of it. So, let's use our `sumOfSquares` example code, and rewrite it as a block:

```
def sumOfSquares(n1: Int, n2: Int) = {
  val squared1 = square(n1)
  val squared2 = square(n2)
  sum(squared1, squared2)
}
```

Here, in this context, `val` just associates a new name to a precomputed result. For instance, I'm squaring the first number `n1` and associating the result to the identifier `squared1`. After that, I'm squaring the second number, and associating the result to the identifier `squared2`. These steps are important in some programs because otherwise, you could end calling `square` multiple times on the same value, wasting computation time. 

One more thing to notice is that there is nothing avoiding you to declare functions *inside* other functions. So, for instance:

```scala
def sumOfSquares(n1: Int, n2: Int): Int = {
  def sum(n1: Int, n2: Int): Int = n1 + n2
  def s(n1: Int): Int = n1 * n1
  sum(s(n1), s(n2))
}
```

The difference is that, right now, `sum` `s` are declares **inside** the `sumOfSquares` function. This means that they're **not** accessible outside the `sumOfSquares` function, and trying to access it outside would give us an error. 

# Types

So far, we've seen a bunch of types: `Int` are for integers, `Double` are for decimals, `Boolean` are for `true` and `false` and, `Unit` are for procedures - code that doesn't return anything. We saw that an `if` without an `else` clause will behave like a `Unit`, but we didn't see how is the relation of each of these types. So, what exactly is a type?

## Type Hierarchy

<img src="https://docs.google.com/drawings/d/1pFtHQMkK3L7Wx32-WI8l_MFSg0NXPafs5fprIpDHbAA/pub?w=882&amp;h=380">

In Scala, types have an hierarchical structure. The top of the hierarchy is `Any`, that literally defines any value. Below that, we have `AnyVal` and `AnyRef`. `AnyVal` is the father of all primitive types, and `Unit` (which is a type to define when a function doesn't return anything). `AnyRef` is a supertype of all other types, for instance `String` (a text) or any type that you'll define later.

In general, when a type is a child of another, we say that it is a **subtype**. When a type is the father of another, we say it is a **supertype**. So, `Double` is a *subtype* of `AnyVal`, and `AnyRef` is a *supertype* of `Object`.

In Scala, you can define types and you can rename types. Sometimes, renaming a type means you'll add more meaning to what you're writing (we'll see that later), sometimes it just means it is more clear to write the renamed type (and sometimes you'll write less). If you define another type (for instance, defining a class or a object-we'll see more about this later), implicitly this new type will be a child of `Object`.

### Primitive types

Note: you can skip this session if you're not confident, but *please* be sure to come back later

For a computer to work, it needs to send commands to the processor. The processor has a way to sum, multiply, subtract and do other arithmetic operations **really** fast. There is another, slower way to process arithmetic data that relies on a higher level of abstraction and don't depend on primitive types. But, if there is a faster way to process arithmetic data, why use a slower one? The answer is how the processor process and represents primitive data.

To represent an Integer, most programming languages uses the size of a "Word". In a 64-bit system, the word is 64 bits. On Scala, to be able to be compatible with any system, all integers are 32-bits[^bit]-this means we can, at least in theory, represent 2<sup>32</sup> different numbers.

But in scala, an `Int` is a **signed** integer - in other words, it needs to be able to represent negative numbers. So, computer uses a way do identify negative numbers - it uses the *most significant bit* (the bit most on the left) to say if a number is negative - `0` represents a positive number, `1` a negative one. Let's simulate this with the following table: suppose our `Int`s are not 32, but only 3 bits:

```
000 = 0
001 = 1
010 = 2
011 = 3
100 = -4
101 = -3
110 = -2
111 = -1
```

So, let's say we want to pick the successor of a number: if we look at the table, the successor of `-4` is `-3`, of `-3` is `-1`, and of `-1`... well, it will be, in bit format, `1000`, but this would not fit in our *3 bit schema*, so we simply discard the most significant bit (in this case, the `1`) and stay with the rest - `000` - which will give us the correct answer, in this case: the successor of `-1` is `0`.

But, we have a problem here.

If we want the successor of `3`, being `3` the greatest integer we can represent, we'll get the wrong answer: `-4`. This is called **overflow**, and it is a real problem in programming: To test this in Scala, you can try the following code, below:

```scala
2147483647 + 1
// Result: -2147483648
```

So, if you want larger numbers, you can use `Long` to represent you numbers. To write a `Long` value in a simple way, you can postfix the number with `l`:

```scala
2147483647l + 1
// Result: 2147483648
```

But `Long`s are only 64-bit integers: they have a higher limit, but still a limit: we can represent numbers till `9223372036854775807`, after that we'll have a overflow again:

```scala
scala> 9223372036854775807l + 1
// Result: -9223372036854775808
```

In these cases, we can use the slower way: BigInt. BigInt does not uses the processor directly, so it is **much** slower. But, at least in theory, we have no limit (only your computer's memory) to which numbers we can represent:

```scala
BigInt("9223372036854775807") + 1
// Result: 9223372036854775808 (it is a BigInt too)
BigInt("9223372036854775807").pow(20)
// Result: 19851555241898344153130788677769001983160921861226045243324013058499644278985263829655458477500554934148319186908254029753701126211729124925712332077145392772214865805846210362859747023907163434176886296071735509937063967304415184441745878591613191784199114531387951675074220397532740510211790749968004592396387387319085094672935864701114816359825685092500704674453832649932800001
```

It is important to remember: if you **must** be precise on your calculations, you'll have to use `BigInt` and `BigDecimal` to do your math. Otherwise, you can rely on `Int`, `Double`, `Long`, because things will work properly most of the time.

### Implicit conversions

Scala can implicitly convert some types that are not really related - for example, both `Int` and `Double` descend from `AnyVal`, but somehow, in our tests we could convert one to another - this is because, implicitly, there's a way to convert one into other. The rules are more complex than that, but for now let's imagine that `Double` behaves like it is a child of `Int`: where we expect an `Int`, we could pass a `Double`, but when we expect a `Double` we **cannot** pass an `Int`

### Type inflection

Now that we've seen how types are related in an hierarquical fashion, we can begin to work on *type inflection*. Older languages like Java and C++ had the need of declare the type of everything, even when we could easily infer the type. For instance, suppose we're using the `square` method, we defined on the first chapters. In that case, we had an `Int` and we returned it multiplied by itself. Scala **knows** that an `Int` multiplied by another `Int` could only be an `Int` itself. So, why should we need to declare the type? Scala can *infer* the type from that code easily. But, sometimes, things are not so easy. Let's consider the following code:

```scala
def salary(value: Int) = if(value < 100) value + 50 else value * 1.2
```

What's the inflected type on this method? Let's begin by seeing what we're doing:

1. First, we're defining a function that expects an `Int`
1. Second we're asking if that value is less than `100`. It this is true, we'll add `50`, and result in an `Int`
1. Otherwise, we'll multiply the value to `1.2` (the equivalent of adding a bunus of 20%), resulting in a `Double`

We have two paths, one in which we can return an `Int`, and one in which we can return a `Double`. A `Double` can represent an `Int`, but an `Int` cannot represent a `Double`, so the return of this function is `Double`.

Now, let's look at this code:

```scala
def positiveUnit(value: Int) = if(value > 0) value
```

Ok, now this code return an `Int` if the value is above `0`. Otherwise... it does nothing. So, what's the type?

In the chapter about the `if` statement, we saw that `if` without `else` will return `Unit` if the condition is false. So, what type can be used to identify both `Int` and `Unit`? If we see the graph, above, we'll see that this type would be `AnyVal` - it is the direct *supertype* of both.

```scala
def isMyName(name: String) = if(name == "Mauricio") name
```

This case is the same as above: if the condition is `true`, it'll return a `String`, otherwise, it'll return `Unit`. Let's go up the hierarchy a little: on top of `Unit` is `AnyVal`. But, on top of `String` is `AnyRef`. `String` doesn't descends from the same tree of `Unit`, so we'll need to go up a little more-in this case, the only type that `String` and `Unit` are related is `Any`. So, in this specific case, the function returns the type `Any`.

### Functions as types

We saw that functions receive parameters (each with its own type) and returns something (that, too, has a type). But how do we represent it?

In Scala, functions **are** types to. So, let's use the examples of the previous section: we had, for instance, the function **salary**. That function expected an `Int` and returned a `Double`. In Scala, we say that the **function** had the type `Int => Double`. This kind of type can be read like **something that takes an `Int` and returns a `Double`**. The same is true for our other functions too: `isMyName` is of type `String => Any`.

But how can we use it?

Let's return to our code `sumOfSquares` (for convenience, I'll annotate the types, and I'll put a comment too before each function defining which type the *function* itself is):

```scala
// Int => Int
def square(n: Int): Int = n * n
// (Int, Int) => Int
def sum(n1: Int, n2: Int): Int = n1 + n2
// (Int, Int) => Int
def sumOfSquares(n1: Int, n2: Int): Int = sum(square(n1), square(n2))
```

We composed this function using two predefined functions: `sum` and `square`. But, can we do better? What if we could create a function that squares the first and the second numbers, then applyed some arbitrary function into it? Turns out we can! If we look at our `sum` function, we see that it is only a type that takes two `Int`s and return an `Int`.  So, let's change our `sumOfSquares` function to be more composable

```scala
// Int => Int
def square(n: Int): Int = n * n
// (Int, Int) => Int
def sum(n1: Int, n2: Int): Int = n1 + n2
// (Int, Int, (Int, Int) => Int) => Int
def composeSquares(n1: Int, n2: Int, function: (Int, Int) => Int): Int = 
  function(square(n1), square(n2))

//(Int, Int) => Int
def sumOfSquares = composeSquares(_: Int, _: Int, sum)
```

A lot of things is going on here, so let's start slowy: first of all, `square` and `sum` are **exactly** the same. We created a new function named `composeSquares`, that takes two numbers and a function to combine them. The body of `composeSquares` is mostly the same as `sumOfSquares` *except* that we now use a function to compose the result. If we would like to call `composeSquares` to have exactly the same functionality than `sumOfSquares`, we could call it like this:

```scala
composeSquares(2, 3, sum)
```

Because sum is, basically, a function that maps two ints to one. Or, we could do something like:

```scala
def subtract(n1: Int, n2: Int): Int = n1 - n2
composeSquares(3, 2, subtract)
```

And our code would run **3<sup>2</sup> - 2<sup>2</sup>**. Last of all, we have our new definition of `sumOfSquares`: it uses the `_` to say *anything*. So, in Scala, `_` is what they call a **wildcard**, that simply matches anything. We need to give it types, because it is a function definition. So, what we're saying is that **`sumOfSquares` is a function that calls `composeSquares`. The first parameter can be anything, as long as it is an `Int`, the second parameter can be anything, as long as it is an `Int`, but the third parameter must be the function `sum`**. Scala will understand that we need to pass later the first and second parameters, and that the third is already fulfilled, so we don't need to pass it too. In the end, we'll have the same result, but using a more generic function.

---

>**Is it better to use the first or the second way?**

> There is no better or worse in this case. It is just another way to express the same thing. Most of the time, when solving a problem, you'll need to abstract that problem in a way the machine language can understand. For instance, if you need to add a discount to every person's salary, maybe having a more generic method can be better-because, in any organization, you can have people with multiple work contracts, so the taxes on each of them are different. It is better to be able to pass a new function that applies the discount and then the taxes, than calculate first the salary already with taxes *and then* try to figure how much you'll discount.

> There is a great metaphor that says that everything you have in your programming language is like a tool. It is not *good* or *bad* in any way, but the more tools you have, the better you'll be prepared to any kind of problem. 

## Structures and classes

So far, we've seen programming with primitive types only. But, for any program we'll make, we'll have to identify objects in the real world - for instance, how can we identify a person with the current objects we have? Or details of a car? To solve this problem, we need some way to structure complex data from more simple data. In object-oriented programming, the primary structure for that is a **class**

A class is nothing more than a collection of attributes and behavior. A class, in fact, is only a structure-a specific collection of attributes is called an **object**. For now, let's take a specific type of class named **case class**. In Scala, a *case class* is a kind of structure that already gives you mappings for attributes. For now, let's work on case classes only with attributes, and begin to add behavior little by little.

Let's see how could we work with case classes. Imagine we would make a simple supermarket application. To do this, the primary object we would need is a `Product`[^UpperCamelCase]. For now, let's say that each product has a code, a name and a price

```scala
case class Product(code: String, name: String, price: Double)
def totalPrice(p1: Product, p2: Product): Double = p1.price + p2.price
```

This simple code just sums two prices of two products. There are ways of passing multiple products to the method, but we'll see then later. For now, let's concentrate on this simple code: how do we create products?

In most programming languages, there is a way to create **objects** from **classes**. Our `Product` is what we call a **class**, a simple structure that will hold all the product information. In the class, we defined a `code` and a `name`, of type `String`, and a `price`, of type `Double`. So, if we need to create an object from that class, we'll use the keyword `new`:

```scala
totalPrice(
  new Product("10001", "Milk", 5.75),
  new Product("10002", "Chocolate", 5.0)
)
```

We call this process of creating objects from classes **instantiation**. We *instantiate* an object from a class using the keyword `new`. It's syntax is quite simple: `new <class-name>(<parameters>)`, like in our case, `new Product("10001", "Milk", 5.75)`

Ok, now we have two products, and we're passing them to the `totalPrice` method. But what means the `p1.price`, that we saw on the `totalPrice` function?

### Methods and attributes

Let's look at the `.`: what it means? Mostly, it means **in this object, run this code**. In the above case, it means **from the object p1, runs the code price**, and, the code **price** is just a code that returns a single value-the price we've put on the product. The first product, for instance, could be translated to a single object just by saying:

```scala
object p1 {
  def code = "10001"
  def name = "Milk"
  def price = 5.75
}
```

but, declaring like that, we would miss the information that p1 is, in fact, a `Product`. We'll see more about `object`s later. For now, let's simply say that a `.` means that I want to run some code that belongs to a object.  We saw functions, but when the thing we want to run is an attribute - like, it is just an information inside a class, there's no need to any computation, we can use the keyword `val`:

```scala
object p1 {
  val code = "10001"
  val name = "Milk"
  val price = 5.75
}
```

`val` is simply a way to store some value in a identifier. Similar with `def`, it can run a block, but will only run once. If we declare a `val` like we've declared on the object example, above, all of the `val` code will run exactly the moment we refer to `p1` the first time. If we declare a val inside a class, it'll be run when we run the code for the attributes the moment we create an object:

```scala
case class Person(givenName: String, surname: String) {
  val fullName = {
    println("Ran the code!")
    givenName + " " + surname
  }
}

new Person("Mauricio", "Szabo") // Here, we'll print 'Ran the code!'
```

Code within `val` is called an **attribute**. Code within `def` are called **methods**. We can say that **methods** are procedures and functions, when defined inside a class. And, we can say that an **attribute** is like a method that is computed only once, and always give us the same answer (although this is not exactly true-we can have *mutable* attributes, but we'll see then later).

#### Functional way of calling methods

Scala is what we call a multi-paradigm programming language: it supports the object-oriented paradigm (the one that uses objects as data structures) and supports functional programmin (the one that values immutability over mutability, and uses functions to compose behavior). So, Scala supports both ways of calling methods: the *object-oriented* way (that is, the `<object>.<method>(<parameters>)` way) and the *functional way* (the `<object> <method> (<parameters> way`. Let's see it in more detail how many ways we have of calling methods on objects:

<svg class="railroad-diagram" width="689" height="222" viewBox="0 0 689 222"><g transform="translate(.5 .5)"><path d="M 20 41 v 20 m 10 -20 v 20 m -10 -10 h 20.5"></path><path d="M40 51h10"></path><g><path d="M50 51h0"></path><path d="M134 51h0"></path><rect x="50" y="40" width="84" height="22"></rect><text x="92" y="55">&lt;object></text></g><path d="M134 51h10"></path><g><path d="M144 51h0"></path><path d="M648 51h0"></path><path d="M144 51h20"></path><g><path d="M164 51h24"></path><path d="M604 51h24"></path><path d="M188 51h10"></path><g><path d="M198 51h0"></path><path d="M226 51h0"></path><rect x="198" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="212" y="55">.</text></g><path d="M226 51h10"></path><path d="M236 51h10"></path><g><path d="M246 51h0"></path><path d="M322 51h0"></path><rect x="246" y="40" width="76" height="22"></rect><text x="284" y="55">&lt;param></text></g><path d="M322 51h10"></path><g><path d="M332 51h0"></path><path d="M604 51h0"></path><path d="M332 51a10 10 0 0 0 10 -10v-9a10 10 0 0 1 10 -10"></path><g><path d="M352 22h232"></path></g><path d="M584 22a10 10 0 0 1 10 10v9a10 10 0 0 0 10 10"></path><path d="M332 51h20"></path><g><path d="M352 51h0"></path><path d="M584 51h0"></path><path d="M352 51h10"></path><g><path d="M362 51h0"></path><path d="M390 51h0"></path><rect x="362" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="376" y="55">(</text></g><path d="M390 51h10"></path><g><path d="M400 51h0"></path><path d="M536 51h0"></path><path d="M400 51a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path><g><path d="M420 31h96"></path></g><path d="M516 31a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><path d="M400 51h20"></path><g><path d="M420 51h0"></path><path d="M516 51h0"></path><path d="M420 51h10"></path><g><path d="M430 51h0"></path><path d="M506 51h0"></path><rect x="430" y="40" width="76" height="22"></rect><text x="468" y="55">&lt;param></text></g><path d="M506 51h10"></path><path d="M430 51a10 10 0 0 0 -10 10v10a10 10 0 0 0 10 10"></path><g><path d="M430 81h24"></path><path d="M482 81h24"></path><rect x="454" y="70" width="28" height="22" rx="10" ry="10"></rect><text x="468" y="85">,</text></g><path d="M506 81a10 10 0 0 0 10 -10v-10a10 10 0 0 0 -10 -10"></path></g><path d="M516 51h20"></path></g><path d="M536 51h10"></path><g><path d="M546 51h0"></path><path d="M574 51h0"></path><rect x="546" y="40" width="28" height="22" rx="10" ry="10"></rect><text x="560" y="55">)</text></g><path d="M574 51h10"></path></g><path d="M584 51h20"></path></g></g><path d="M628 51h20"></path><path d="M144 51a10 10 0 0 1 10 10v60a10 10 0 0 0 10 10"></path><g><path d="M164 131h0"></path><path d="M628 131h0"></path><path d="M164 131h10"></path><g><path d="M174 131h0"></path><path d="M202 131h0"></path><rect x="174" y="120" width="28" height="22" rx="10" ry="10"></rect><text x="188" y="135"> </text></g><path d="M202 131h10"></path><path d="M212 131h10"></path><g><path d="M222 131h0"></path><path d="M298 131h0"></path><rect x="222" y="120" width="76" height="22"></rect><text x="260" y="135">&lt;param></text></g><path d="M298 131h10"></path><g><path d="M308 131h0"></path><path d="M628 131h0"></path><path d="M308 131a10 10 0 0 0 10 -10v-9a10 10 0 0 1 10 -10"></path><g><path d="M328 102h280"></path></g><path d="M608 102a10 10 0 0 1 10 10v9a10 10 0 0 0 10 10"></path><path d="M308 131h20"></path><g><path d="M328 131h0"></path><path d="M608 131h0"></path><path d="M328 131h10"></path><g><path d="M338 131h0"></path><path d="M366 131h0"></path><rect x="338" y="120" width="28" height="22" rx="10" ry="10"></rect><text x="352" y="135"> </text></g><path d="M366 131h10"></path><path d="M376 131h10"></path><g><path d="M386 131h0"></path><path d="M414 131h0"></path><rect x="386" y="120" width="28" height="22" rx="10" ry="10"></rect><text x="400" y="135">(</text></g><path d="M414 131h10"></path><g><path d="M424 131h0"></path><path d="M560 131h0"></path><path d="M424 131a10 10 0 0 0 10 -10v0a10 10 0 0 1 10 -10"></path><g><path d="M444 111h96"></path></g><path d="M540 111a10 10 0 0 1 10 10v0a10 10 0 0 0 10 10"></path><path d="M424 131h20"></path><g><path d="M444 131h0"></path><path d="M540 131h0"></path><path d="M444 131h10"></path><g><path d="M454 131h0"></path><path d="M530 131h0"></path><rect x="454" y="120" width="76" height="22"></rect><text x="492" y="135">&lt;param></text></g><path d="M530 131h10"></path><path d="M454 131a10 10 0 0 0 -10 10v10a10 10 0 0 0 10 10"></path><g><path d="M454 161h24"></path><path d="M506 161h24"></path><rect x="478" y="150" width="28" height="22" rx="10" ry="10"></rect><text x="492" y="165">,</text></g><path d="M530 161a10 10 0 0 0 10 -10v-10a10 10 0 0 0 -10 -10"></path></g><path d="M540 131h20"></path></g><path d="M560 131h10"></path><g><path d="M570 131h0"></path><path d="M598 131h0"></path><rect x="570" y="120" width="28" height="22" rx="10" ry="10"></rect><text x="584" y="135">)</text></g><path d="M598 131h10"></path></g><path d="M608 131h20"></path><path d="M308 131a10 10 0 0 1 10 10v40a10 10 0 0 0 10 10"></path><g><path d="M328 191h68"></path><path d="M540 191h68"></path><path d="M396 191h10"></path><g><path d="M406 191h0"></path><path d="M434 191h0"></path><rect x="406" y="180" width="28" height="22" rx="10" ry="10"></rect><text x="420" y="195"> </text></g><path d="M434 191h10"></path><path d="M444 191h10"></path><g><path d="M454 191h0"></path><path d="M530 191h0"></path><rect x="454" y="180" width="76" height="22"></rect><text x="492" y="195">&lt;param></text></g><path d="M530 191h10"></path></g><path d="M608 191a10 10 0 0 0 10 -10v-40a10 10 0 0 1 10 -10"></path></g></g><path d="M628 131a10 10 0 0 0 10 -10v-60a10 10 0 0 1 10 -10"></path></g><path d="M 648 51 h 20 m -10 -10 v 20 m 10 -20 v 20"></path></g></svg>
Now **that** looks complicated... but is not so much when we dive it in detail. Let's look at the two ways to see it: on the "upper branch" we have the object-oriented way of calling a method: first we begin with an object. To be more didatic, let's create an object with the three kinds of calls on this diagram:

```scala
case class Number(value: Int) {
  def inverse(): Number = new Number(-value)
  def multiply(other: Number): Number = new Number(value * other.value)
  def sumAndMultiply(sum: Number, mult: Number): Number = new Number(
    (value + sum.value) * mult.value )
}

val one = new Number(1)
val two = new Number(2)
val three = new Number(3)
```

For our first test, we'll use `inverse`. Please notice that I used `()` on the end of method definition: because Scala does differentiate between methods that receive no parameters that are declared with parenthesis of the one that are declared without. Methods declared without parenthesis can **only** be called without parenthesis. Methods declared with can be called with or without it. Knowing this, let's look at the upper branch: it says we can call a method using a `.`, the method name, and that ends it. So, we can call `one.inverse`, and `one.value`, because we expect no parameters. Following still the upper branch, it says we can call this method too using `one.inverse()`. `one.value()` doesn't work, because it is declared without parenthesis (scala understands that methods without parenthesis are meant to be *attributes*, and in most programming languages, you cannot call an attributes with parenthesis). If we still stay on the upper branch, we can see that, after the parenthesis, we can pass parameters, separated by `,`. So, we can call `two.multiply(three)`, and `two.sumAndMultiply(one, three)`. These are valid calls for the object-oriented way. Please notice that you **cannot** omit the parenthesis in any way.

Now for the functional call (the bottom branch): we write the object name, a space, and the method name. Parenthesis are optional **only** for methods that expects less than two parameters (in other words, one or zero), and before a parenthesis, we **need** a space. So, let's see how each of these methods would be written in a functional way: first, `inverse` could be written as `one inverse` or `one inverse ()`. `value`, on the other hand, suffers the same fate of the object-oriented way: it can only be written as `one value`. `one multipy two` or `one multiply (two)` are both valid ways of calling this method. Finally, we can only have `one sumAndMultiply (two, three)` as a valid way to call a method with more than one parameter.

The interesting thing of this code is that we can rename the methods to something more meaningful, like:

```scala
case class Number(value: Int) {
  def inverse(): Number = new Number(-value)
  def unary_- = inverse
  def *(other: Number): Number = new Number(value * other.value)
  def +*(sum: Number, mult: Number): Number = new Number(
    (value + sum.value) * mult.value )
}

val one = new Number(1)
val two = new Number(2)
val three = new Number(3)
```

This way, we can call these methods like `-two`, `two * three` and `two +* (one, three)`.

> **What about 1 + 2?**
>
> Ok, we saw this new way of calling methods. So, this means that 1 + 2 is, in fact, `(1).+(2)`? The answer is, simply, yes. Basically, all arithmetic operations, even on primitive numbers, are methods on these classes. It's a new way to look at objects.

### Constructors

On most of object oriented programming, to create a class we need to pass some parameters. In our `Product` example, we had a constructor which received 3 parameters: `code`, `name` and `price`. By default, a constructor does nothing; is up the the programmer to decide what the constructor will do. In the `Product` example, the constructor bound three identifiers to their following attributes. Most of the time, you'll want to give some treatment on the constructor parameters, or do some mutability on the object. It is possible to create programs without constructor code (only parameters) like we did on `Product`. As a simple example, let's create a `class` that simply prints it's parameter when it is instantiated:

```scala
case class Person(name: String) {
  println("My name is: " + name)
}
```

If we construct the class with `new Person("Szabo")`, it will print on screen *My name is: Szabo*.

> **A quick reminder:**

> Remember that every code you write on your constructor will run everytime we instantiate a new class. Sometimes this is desirable, sometimes it is not. Let's say you have and, in one of its attributes it needs a very big number, let's say, 2<sup>30</sup>. It is more desirable to put the result there in a `val` than to compute it everytime we instantiate a new class. Computing everytime will just waste computer processing without a good reason. Remember, computers are fast, but their processing power is not infinite (specially if you plan on using slow languages, or programming for mobile devices like cell phones).

### Inheritance

We saw earlier that types can (and, normaly, will) have father (supertype) and chldren (subtypes). The process of creating a subtype is called **inheritance**, and it is crucial to understand inheritance to understand object oriented programming as it is used in most languages (Javascript, for instance, does not uses *inheritance* exactly as described here, instead it uses a prototype-based inheritance, but the basics are the same). To make a class inherit from another, we simply use the keyword `extends` on the class definition:

```scala
class Father
class Child extends Father
```

When we subclass a class, we get all the methods that were defined on father into the child. We can re-implement these methods, so we can give a more specific behavior (we call this *overriding*), or we can create new methods. Let's imagine, right now, that we'll split our product in more classes: in a general way, a product have a name, but it can not be on sale *right now*: it could be only a preview, or a free sample, or something like that. But all these things **are** products, only some of then could not be sold. So, let's adjust these things:

```scala
class AbstractProduct(name: String)
class Product(code: String, name: String, price: Double)
  extends AbstractProduct(name)
class FreeSample(code: String, name: String)
  extends AbstractProduct(name)
class Preview(name: String) extends AbstractProduct(name)

// All is good... except this code below doesn't work anymore
val p1 = new Product("10001", "Milk", 10.5)
p1.price
```

Ok, so now we have some things to look around: first, we're not using `case class` anymore. That is because a `case class` cannot be inherited... and as we don't know if we're going to inherit a class in the future, is better to just not risk using a case class. Pity[^caseClassProblem]. 

The second is that when we decide to not use case classes, we lost the benefit of declaring, on the constructor, a code, name and price, and these objects to be available immediately with the dot (`.`) notation. We can correct these things in two simple ways: first, to rename the param and define a method or a value to the name we want it:

```scala
class AbstractProduct(_name: String) {
  def name = _name // OR val name = _name
}
```

But this is just a lot of repeated work. We can, instead, put `val` before each parameter in a constructor, and then they'll become public available.

We can, too, define methods on the classes, so they'll become available on the child classes:

```scala
class AbstractProduct(val name: String)

class Product(val code: String, name: String, val price: Double)
  extends AbstractProduct(name) {
  
  def nameForClient = name + " (R$ " + price + ")"
}
  
class FreeSample(code: String, name: String)
  extends Product(code, name, 0.0)
  
class Preview(name: String) extends AbstractProduct(name)

// Now this works:
val p1 = new Product("10001", "Milk", 10.5)
p1.name // returns Milk
p1.nameForClient // returns Milk (R$ 10.5)

val p2 = new FreeSample("10003", "Honey")
p1.nameForClient // returns Honey (R$ 0.0)
```

Obviously, we don't need to define parameter `name` for every other child class, because it is already defined in the superclass. The same is true for `price` on `FreeSample`. In practice, defining these parameters with `val` ensures an error because of **overriding**, and we'll see that later.

One thing to notice is that inheritance is a complicated problem, and most of the time it is used incorrectly: we should use inheritance only when the object we're writing is a specific version of its supertype. Let's say we're writing a code to draw something on the screen: you might be tempted to design your code as the following: a `Square` is a subclass of `Line`, that is a subclass of `Point`. This is problematic in many ways: first of all, what a *rounded square* is? In this case, the mistake is to think of squares as a specific kind of line, or a line as a "generic square". This is not the case. A better approach to think it is as a `Square` and a `Line` being specific `Shape`s. In this case, we would have a (very) generic class `Shape`, and `Line`, `Point` and `Square` as subclasses: specific shapes.

> **Identifying inheritance information**

> A simple way to think about inheritance is to think what a object **is**. In the above example,  we had `Square` and `Line`. A `Square` is **not** a `Line`. But, a `Line` and a `Square` **are** `Shape`s, so this kind of inheritance makes sense.

### Abstract classes and contracts

A contract, in the wild, is a document that binds a set of rules: everyone must follow that group of rules, or face the consequences. When designing systems, the contract is exactly the same.

In programming we define a contract defining abstract classes. Abstract classes work exactly the same as "concrete" classes except that they have methods that are not implemented, only defined (in other words, they don't have the *body* part, and must always annotate the return type). We call these **abstract methods**:

```scala
abstract class ShoppingCart {
  def contains(product: Product): Boolean
  def totalPrice: Double
}
```

An abstract class **must** be annotated with the `abstract` keyword. Ever. This is simple: if we subclass (inherit) an abstract class, we **must** implement all the methods that are declared, but not implemented. So, if we forget to implement a single one, the class is forced to be abstract-so, if we don't declare it as abstract, in these cases, we get an error. Scala, on the other way, makes it simple to implement the methods with *stubs* - fragments of code that just don't do anything, and gives us an error if we try to use then - so we won't have an abstact method anymore, and we can concentrate on giving the correct behaviour later:

```scala
class EmptyCart extends ShoppingCart {
  def contains(product: Proccut): Boolean = ???
  def totalPrice: Double = ???
}
```

Nice! Now, we can proceed to create some behavior on this code:

#### The shopping cart

Let's say we're going to create a shopping cart in code. There are better ways of doing this using lists of products, but we're not gonna use then **right now**: first, we need to be introduced to generics and lists, and so on. Instead, we'll use *inheritance* only. Let's first define a *contract*: what a shopping cart needs to do? Even better: what should we **ask** for the shopping cart to give us, so we can continue our work? Well, we need to inform the user the total of his buy. We need to inform how many items he's buying, we need to add a new item on the shopping cart, remove an item from the shopping cart, and finally, the user needs to *know* what he's buying. What about we just print on the screen what he's buying, one item per line?

**NEVER!**

Making the shopping cart print itself on the screen is a **very bad** idea. The reason is simple: what a shopping cart needs to **do** is to have rules about the sale. A code that prints one item per line is adding a behavior that it is **not** on the shopping cart responsability: show the user something. We will, instead, make a code to inform the program what we have on cart, and then create a code to show this in a meaningful way.

Now, on to the code. The first thing we'll going to do is to create a class to define a product. Let's just use the `case class Product` we had earlier, for the sake of simplicity. Then, we need to see each case of the shopping cart that we'll deal with, but first let's just write the contract we defined earlier:

```scala
case class Product(code: String, name: String, price: Double)

abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  // For now, let's skip these methods. We'll implement then later,
  // when things become clearer
  //def add(product: Product): ?
  //def remove(product: Product): ?
  //def products: ?
}
```

#### Representing an empty shopping cart

First of all, how would we represent the first case of our shopping cart, in this case, an empty shopping cart? Well, it is simple, really: `total` and `numberItems` is `0`-there is nothing on the cart!

```scala
class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
}
```

Well, that was simple. So, what now? Let's say we want to add an item into the cart. How would we do? Well, we can not `add` something to a class named `EmptyCart` - that would be absurd! An `EmptyCart` that is not empty? Nonsense. So, we just return a new cart! One that has a product in it! `remove` is implemented on the same way, we return a new cart **without** the product on it. Let's update our abstract shopping cart now:

```scala
case class Product(code: String, name: String, price: Double)

abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
  // For now, let's skip this method. We'll implement it later,
  // when things become clearer
  //def products: ?
}
```

See something interesting? Althrough the `ShoppingCart` is an abstract class, we can still return objects of its type. The reason is simple: we'll return concrete implementations of this abstract class (for example, `EmptyCart` is one). This is how a contract is done: we say that we're passing an object that *implements* these methods, and Scala makes sure that we'll obey the contract. So, now to the implementation of `Empty`:

```scala
class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = ???
  def remove(product: Product): ShoppingCart = new EmptyCart
}
```

Well, `remove` was simple: there is nothing on the cart, so we remove nothing. But, `add` is not possible to implement yet: we have no concrete implementation of **any** cart that has a product on it. So, we could define one! Let's define a cart where we have a single product on it:

```scala
class SingleProductCart(product: Product) extends ShoppingCart {
  def total: Double = ???
  def numberItems: Int = ???
  def add(product: Product): ShoppingCart = ???
  def remove(product: Product) = ???
}
```

Now, we can add a product into an `EmptyCart`:

```scala
class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new SingleProductCart(product)
  def remove(product: Product): ShoppingCart = new EmptyCart
}
```

#### A single product cart

Now that we've defined a single product cart, we need to implement it's methods. Two of then are quite simple: we just need to return the price of the product for `total` and as for the number of items, we only have one:

```scala
class SingleProductCart(product: Product) extends ShoppingCart {
  def total: Double = product.price
  def numberItems: Int = 1
  def add(product: Product): ShoppingCart = ???
  def remove(product: Product) = ???
}
```

But there are still problems: could we remove a product? Well, we can, but **only if** the product that we have on cart is the product we're trying to remove: in this case, the cart becomes *empty* again. But, if it is not, then the cart remains unchanged. How?

There is a special keyword in Scala named `this`. `this` simply returns the class we're in. So, if inside the `SingleProductCart` we simply return `this`, we're not creating a new class: we're just refering to itself. We could, for instance, avoid the creation of a new `EmptyCart` on the `remove` method of it, and we could avoid the creation of a new `SingleProductCart` if the product we're removing is not the same that this cart holds:

```scala
class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new SingleProductCart(product)
  def remove(product: Product): ShoppingCart = this
}

class SingleProductCart(product: Product) extends ShoppingCart {
  def total: Double = product.price
  def numberItems: Int = 1
  def add(product: Product): ShoppingCart = ???
  def remove(product: Product) = 
    if(product == this.product) new EmptyCart else this
}
```

We've seen too a good way of using `this` on the above code: in the `remove` method, the parameter name is `product`. But, the product we're holding (the one that we passed to the constructor) is named `product` too... To differentiate between then, we've used `product` to refer to the parameter, and `this.product` to refer the one that we've passed on the constructor. In a way, this makes sense: the one we've passed to the constructor is now *part* of the class, so we access it with `this.<name>`

We're still missing a way to put another product on cart... we could create a class named `TwoProductsCart`, but this would go on and on... so, what to do?

#### A cart for more products

Imagine you're going to travel somewhere for a whole month, and you discover you don't have a big suitcase! You only have a bunch of very small ones. Well, what you could do is just put things in one, then continue putting things on another... and, when you get to your destination, you unpack the first, then the second, then the third... you get the idea.

What we'll do with this code is **exactly** the same: we're going to create a cart that will just hold a single product, but somehow will tell us that there are **more** items, and then we could find these ones!

```scala
class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = ???
  def numberItems: Int = ???
  def add(product: Product): ShoppingCart = ???
  def remove(product: Product): ShoppingCart = ???
}
```

Well, now we can updated our `SingleProductCart` with the new cart

```scala
class SingleProductCart(product: Product) extends ShoppingCart {
  def total: Double = product.price
  def numberItems: Int = 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product) = 
    if(product == this.product) new EmptyCart else this
}
```

But, still, we need to implement the methods of our contract. What's the `total` price? This one is simple: we have the `total` of our previous cart, don't we? Well, let's just add the price of the current product into the `total` of the previous cart! Let's work the same way on the `numberItems`:

`add` is simple too: we just add another cart! Let's see it in action:

```scala
class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = ???
}
```

Well, `remove` is missing. How would we remove this product? Well, the first case is kinda simple: if the product we're trying to remove is the that we have on this cart, we could just return the previous cart, and it's done. It's the same as if you organize your travel's suitcases in a way that every clothes of the same color would stay in a single suitcase. Let's say we have these suitcases, one in top of the other (this makes things kinda simple). If the one on top is the one that contains only the red clothes, and you're tired of these old same red clothes, you could just discard it! Easy, and you'll still all your other clothes.

```scala
class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart
    else ???
}
```

The second case is quite more complicated: if the product we're trying to remove is *not* the same we have now, we need to see if it is on the previous carts. If it is, we discard these carts, and reconstruct the list of carts. If it is not, we mantain things are they are. That is the first though that comes in our minds, I think. And it is **wrong**.

It is **not** this cart's responsability to check if the products on other carts are present or not. It is the **other cart's** responsability. So, what we could do is simple: to create a new cart that will hold our product, and then the other cart will simply be the cart with the product removed:

```scala
class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart 
    else new AdditionalCart(product, cart.remove(product))
}
```

##### **Understading, and proving**

To understand this kind of code, imagine movies when they show Las Vegas casinos, when people come handcuffed with their suitcases. Let's imagine the same thing: imagine we have two kinds of suitcases: one of then is the one you and I know, and the other has a un-detachable string that ends in a grip clip or something. The idea is that we **cannot** detach this second suitcase from any other by any means, other than destroying the clip (and invalidating the suitcase on the process). I know it is a bit extreme, but that is how working with immutable objects is.

 Now, `SingleProductCart` and `EmptyCart` are like the first kind of suitcase: it contains a product inside or it is empty, and that's it. The second kind of suitcase is like the `AdditionalCart`. So, imagine we have the following: three suitcases, the first contains red shirts and it is bound to the second, that contains blue shirts. That one is bound to the third, that is a simple suitcase that contains only black pants. Imagine we want to get rid of all red shirts. In this case, we look at the first suitcase, see it contains red shirts, and we destroy that suitcase and pick the next on the list. Now, we have no more red shirts. 

Now, suppose we want to get rid of blue shirts. In this case, we look at the first suit, see it does **not** contains blue shirts. Now, we pick up a new suitcase of the same kind, we transfer all the clothes we had on this first suitcase(the red shirts, in this case), and then we destroy this suitcase. Now, we look at the second suitcase. We see it indeed contains blue shirts, then we destroy it, and pick the next on the list. We bind the new first suitcase with this one, and now we have a **new** suitcase with red shirts, bound to one that has only black pants.

At last, we want to get rid of our black pants. We look at the first suit, and it does not contains black pants. We transfer its contents to a new suitcase, destroy it, and look at the next suitcase. We see it not contains black pants, then we transfer the clothes to a new suitcase, and we destroy it too. This **new** suitcase (with blue shirts) is bound to the **previous new** suitcase (the one with red shirts), and we look at the next suitcase. This one indeed contains black pants, and then we empty it, and this (now empty) suitcase is bound to the **previous new** suitcase (the one with blue shirts). Now, we have no more black pants.

#### Removing unused code.

Our full code is the following:

```scala
case class Product(code: String, name: String, price: Double)

abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
}

class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new SingleProductCart(product)
  def remove(product: Product): ShoppingCart = this
}

class SingleProductCart(product: Product) extends ShoppingCart {
  def total: Double = product.price
  def numberItems: Int = 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product) = 
    if(product == this.product) new EmptyCart else this
}

class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart 
    else new AdditionalCart(product, cart.remove(product))
}
```

If we look at this code, we can see something strange: there is duplicated code! Look at the implementation of `total` and `numberItems` in both `AdditionalCart` and `SingleProductCart`. They're almost the same, except that `AdditionalCart` sums with the previous cart's content! What if we remove this more generic cart from the code, will it still work?

Well, a `SingleProductCart` is nothing more than a `AdditionalCart` where the previous cart is `Empty`. Well, we could easily get rid of it in this way: just make `EmptyCart` return an `AdditionalCart` with itself as previous, and be done with it.

```scala
case class Product(code: String, name: String, price: Double)

abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
}

class EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = this
}

class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart 
    else new AdditionalCart(product, cart.remove(product))
}
```

The usage of this code is kinda simple: we just create a new `EmptyCart` and add products to it:

```scala
val p1 = new Product("1", "Milk", 8.0)
val p2 = new Product("2", "Chocolate", 4.5)
val p3 = new Product("3", "Rice", 7.0)
val cart = new EmptyCart

val cartWithP1 = cart.add(p1)
cartWithP1.numberItems // Returns 1
cartWithP1.total // Returns 8.0

val cartWithMore = cartWithP1.add(p3)
cartWithMore.numberItems // Returns 2
cartWithMore.total // Returns 15.0
```

> **Notice**

> This kind of dynamic is common: we create code that, sometime after, we discover we don't really need. This does **not** mean we wasted time! Creating that code gave us an insign of how to implement `AdditionalCart`. When creating programs, please, try no to overdesign: imagine the whole code at once. This tends to code that is difficult to understand, and that if we tried building it using simpler cases, it would result in easier code. But **please** don't avoid the deletion of unused code. Unused code (or duplicated code) is just another point of failure-remeber, there is no easier and safer code that no code at all.

What more can we improve? Well, `EmptyCart` really has no kind of behavior. It is just a collection of methods, it is constructed without parameters, and if we call any of its methods a bunch of times, it'll **always** behave the same. It just doesn't need to be a class when we declare new instances, we can declare a single instance of `EmptyCart` and reuse always.

These kind of classes that have only one instance are called **singletons**. A *singleton*, in Scala, can be easily declared using the `object` keyword, in place of `class` one. As a *singleton* is only a single object, we cannot create then with `new`, we just use the name of then and that's it.

```scala
case class Product(code: String, name: String, price: Double)

abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
}

object EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = this
}

class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart 
    else new AdditionalCart(product, cart.remove(product))
}

val p1 = new Product("1", "Milk", 8.0)
val p2 = new Product("2", "Chocolate", 4.5)
val p3 = new Product("3", "Rice", 7.0)

val cartWithP1 = EmptyCart.add(p1)
cartWithP1.numberItems // Returns 1
cartWithP1.total // Returns 8.0

val cartWithMore = cartWithP1.add(p3)
cartWithMore.numberItems // Returns 2
cartWithMore.total // Returns 15.0
```
 Please notice that *singletons* are **not** classes, nor they are types-they are objects, and **will work** as objects. For instance, in `AdditionalCart`, we expect in the constructor a parameter of type `ShoppingCart`. `EmptyCart` is a `ShoppingCart` (because it extends `EmptyCart`), so we can pass it as a parameter to the constructor like this: `new AdditionalCart(product, Empty)`.
 
> **Notice**

> When you use a singleton, in reality you are **always** using the same object. Beware of that. If you declare a *mutable singleton*, one that changes its internal state in the middle of the program, you can end with a **very difficult** program to understand, and end with **very dificult** bugs to find.

We'll implement a way to pick up all our products in a shopping cart in the next chapters. The idea will be, basically, the same thing we did here, but without needing to create additional classes. We created new classes here because we needed to instantiate then. To return all products in the cart, we could create a kind of iterator: something that returns the products until there are no products left. But first, let's try a simpler version

### Functions as parameters

We saw, earlier, that functions can behave as parameters. As an example, let's look at `ShoppingCart`'s method `add`: it expects a `Product`, and returns a `ShoppingCart`. We saw that the type of this function is `Product => ShoppingCart` (or `(Product) => ShoppingCart`, the parenthesis are optional when we have only one attribute). Well, we could create a new kind of method in our ShoppingCart, let's say, `foreachProduct`, that receives a function that receives a `Product` and do something with it. As we don't really want to return anything from this method, and we don't care about the function's return, we'll just make both return `Unit`. The declaration of this new method, then, would be `foreachProduct(function: Product => Unit): Unit`. As an interesting fact, the *type* of this new method is `(Product => Unit) => Unit`. 

Now, when we implement this method, we could pass a function that will simply receive all the products, and then it could print it on the screen in a way it wants! Let's try this approach! Here's our function:

```scala
def printProducts(p: Product) = println(p.name + " costs: R$ " + p.price)
```

Now, let's see how to implement it on our `ShoppingCart`.

```scala
abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
  def foreachProduct(function: Product => Unit): Unit
}
```

If we try to run our code right now, we'll see that we **need** to implement this method on `EmptyCart` and `AdditionalCart`. This is a something we must **always** be aware of: when we're defining code that is meant to be inherited, if we add a new abstract method, we will need to add this abstract method to all subclasses, and this can be **really** problematic. But for now, let's implement it for `EmptyCart`:

```scala
object EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = this
  
  def foreachProduct(function: Product => Unit) {}
}
```

What? It is just this? But, of course! An `EmptyCart` has no products, so it will not call the function at all! Then, how it would be in the `AdditionalCart`, when we have products? Well, we need to call the function in our product, and then, pass the function to the previous cart so it could (or not) call it on theirs.

```scala
class AdditionalCart(product: Product, cart: ShoppingCart) extends ShoppingCart {
  def total: Double = product.price + cart.total
  def numberItems: Int = cart.numberItems + 1
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = 
    if(product == this.product) cart 
    else new AdditionalCart(product, cart.remove(product))

  def foreachProduct(function: Product => Unit) {
    function(product)
    cart.foreachProduct(function)
  }
}
```

Now, we have a way of printing products on the screen!

```scala
def printProducts(p: Product) = println(p.name + " costs: R$ " + p.price)

val p1 = new Product("1", "Milk", 8.0)
val p2 = new Product("2", "Chocolate", 4.5)
val p3 = new Product("3", "Rice", 7.0)

val cartWithP1 = EmptyCart.add(p1).add(p3)
cartWithP1.foreachProduct(printProducts) // OR
cartWithP1 foreachProduct printProducts // OR
```

This will print on the screen:

```
Rice costs: R$ 7.0
Milk costs: R$ 8.0
```

### Anonymous classes

Not all classes need to have names. We can create classes without names, and use then as if they are their superclasses. This is useful if we have abstract classes that we want to instantiate, but don't want to pass through the process of defining a new class and instantiating then. This is **important**: don't create anonymous classes for more complex cases-this can lead to code which is difficult to understand. That being said, let's imagine the following case: an *iterator*:

Imagine we have structure that concentrates some kind of element, like our `ShoppingCart`. A possible implementation of an *iterator* is something that, when we have a new element, return it. If we have no element, we have an undefined behaviour. So, to see if we have new elements, we can use `hasNext`, that returns if we have, or not, new elements to return.

```scala
abstract class ProductIterator {
  def hasNext: Boolean
  def next: Product
}
```

Now, we see that we have to implement these two methods. So, our abstract `ShoppingCart` is:

```scala
abstract class ShoppingCart {
  def total: Double
  def numberItems: Int
  def add(product: Product): ShoppingCart
  def remove(product: Product): ShoppingCart
  def products: ProductIterator
}
```

If we try to run our code right now, we'll see that we **need** to implement these methods on `EmptyCart` and `AdditionalCart`. This is a something we must **always** be aware of: when we're defining code that is meant to be inherited, if we add a new abstract method, we will need to add this abstract method to all subclasses, and this can be **really** problematic. But for now, let's implement it for `EmptyCart`:

```scala
object EmptyCart extends ShoppingCart {
  def total: Double = 0.0
  def numberItems: Int = 0
  def add(product: Product): ShoppingCart = new AdditionalCart(product, this)
  def remove(product: Product): ShoppingCart = this
  
  def products: ProductIterator = new ProductIterator {
    def hasNext: Boolean = false
    def next: Product = ???
  }
}
```

[^camelCase]: when we write identifiers, we need the camelCase notation. In this notation, every identifier starts with a lower case character, and is preceded by lowercase characters until we hit a space - then, we remove the space and the following word starts with a upper case character. So, for example, if we want an identifier to be named "ammount of money", in camelCase notation we write it as `ammountOfMoney`. It is possible to use numbers in camelCase, but not as the first character. So, for instance, `sumWith2` is a valid identifier, but `2ForOne` is not. camelCase is a convention used in Scala, Javascript, Java, C# and other languages. 

[^answer1]: The first code doesn't work because we're passing a decimal to a function that expects an integer. Scala doesn't knows what to do with the decimal number - should it round up? Round down? Discard the decimal part altogether? As for the second function, it'll work because we're passing an integer to a function that expects a decimal - converting from integer to decimal is a simple matter of adding a decimal part to it. To understand better, try to imagine that if I want a decimal, and passes it the number `2`, I can convert it to a decimal simply: `2.0` is a valid decimal. But, if I want an integer, and get a `2.4`, I don't have a sane way to automatically convert it to an integer.

[^application]: We call "function application" when we have a function defined, and we call it with a number of parameters. It is **very** important to understand that *function application* and *function calling* are **exactly** the same thing, but we call it "application" because it is a more mathematical-correct term, and because we'll see it in action how the computer uses the parameters that we pass to the function to compute, in fact, a result.

[^bit]: Remember, a bit can only store two single values: `0` and `1`. So, in this case, `1 + 1` is `10`, `10 + 1` is `11`, `11 + 1` is `100`, and so on.

[^UpperCamelCase]: In most programming languages, when defining a type (creating a new class, for instance), we use CamelCase too, but in this case the first character is in upper case. So, if we need to create a class to represent printers, we could name a class for inkjet printers as `InkjetPrinter`, for instance.

[^caseClassProblem]: Here we see a **very** interesting thing: sometimes, programming languages' creators make some decisions that not all people agree. This is normal, and it's the work of programmers to know, and circunvent, programming languages' limitations.