# Clean code

---
###### tags: `Dev` `Article` `Book`
---

## Meaningful names
- **Use searchable names**: the length of a name should correspond to the size of its scope (p. 22)
- **Avoid mental mapping**: In general programmers are pretty smart people. Smart people sometimes like to show off their smarts by demonstrating their mental juggling abilities. After all, if you can reliably remember that r is the lower-cased version of the url with the host and scheme removed, then you must clearly be very smart. (p. 23)
- One difference between a smart programmer and a professional programmer is that the professional understands that clarity is king. **Professionals use their powers for good and write code that others can understand**. (p. 25)
- **Don’t be cute**: say what you mean. Mean what you say. (p. 26)
- **Don’t pun**: avoid using the same word for two purposes. Using the same term for two different ideas is essentially a pun.
- Our goal, as authors, is to make our code as easy as possible to understand. We want our code to be a quick skim, not an intense study.

We want to use the **popular paperback** model whereby the author is responsible for making himself clear and not the academic model where it is the scholar’s job to dig the meaning out of the paper. (p. 27)

- **One level of Abstraction per Function**: in order to make sure our functions are doing “one thing”, we need to make sure that the statements within our function are all at the same level of abstraction. (p. 36)
- **Flag arguments**: flag arguments are ugly. Passing a boolean into a function is a truly terrible practice and a symptom that the function is doing multiple things at once therefore violating SRP (Single Responsibility Principle a.k.a. a class or module should have one, and only, one reason to change). (p. 41)
- **Dyadic functions**: we should never ignore any part of code. The parts we ignore are where the bugs will hide. (p.42)
- **Verbs and keywords**: in the case of a monad the function and argument should form a very nice verb/noun pair (i.e. write(name)). (p. 43)
- **Have no side effects**: side effects are lies. (p. 44)
- Anything that forces you to check the function signature is equivalent to a double-take. It’s **a cognitive break and should be avoided**. (p. 45)
- **Command query separation**: functions should either do something or answer something, but not both. (p. 45)
- **DRY**: duplication may be the root of all evil in software. (p. 46)

## Comments
- **Don’t comment bad code**  - rewrite it. (p. 53)
- **Comments are always failures**. Every time you express yourself in code, you should pat yourself on the back. Every time you write a comment, you should grimace and feel the failure of your ability of expression. (p. 54)

## Formatting
- As you scan down the listing, your **eye is drawn to the first line** that follows a blank line. (p. 78)
- **Variable declaration**: variables should be declared as close to their usage as possible. (p. 80)
- **Dependent functions**: if one function calls another, they should be vertically close, and the caller should be above the callee. (p. 82)

### Objects and data structures
- **Objects hide their data** behind abstractions and expose functions that operate on that data. **Data structures expose their data** and have no meaningful functions. (p. 95)

## Error handling
- **Error handling is important**, but if it obscures logic, it’s wrong. (p. 103)
- **Don’t pass null**: returning null from methods is bad, but passing null into methods is worse. (p. 111)

## Unit tests
### The three laws of TDD (p. 122):
>1. You may not write production code until you have written a failing unit test.
>2. You may not write more of unit test than is sufficient to fail, and not compiling is failing.
>3. You may not write more production code than is sufficient to pass the currently failing test.


- **Test code is just as important as production code**. It is not a second-class citizen. It requires thought, design and care. It must be kept as clean as production code. (p. 123)
- **What makes a clean test?** Three things. Readability, readability, readability. (p. 124)
- **Each test should be split into three parts** following the build-operate-check pattern. (p. 127)
- **You should minimize the number of asserts** per concept and test just one concept per test function. (p. 128)

### Clean tests follow five other rules (F.I.R.S.T.) (p. 133):
- **Fast**: when tests run slow, you won’t want to run them frequently.
- **Independent**: tests should not depend on each other.
- **Repeatable**: if your tests aren’t repeatable in any environment, then you’ll always have an excuse for why they fail.
- **Self-validating**.
- **Timely**: unit tests should be written just before the production code that makes them pass.

## Classes
- The first rule of classes is that **they should be small**. The second rule of classes is that they should be smaller than that. (p. 136)
- **If we cannot derive a concise name for a class, then it’s likely too large**. We should also be able to write a brief description of the class in about 25 words, without using the words “if”, “and”, “or”, or “but”. (p. 138)
- **Classes should have a small number of instance variables**. Each of the methods of a class should manipulate one or more of those variables. In general the more variables a method manipulates the more cohesive that method is to its class. A class in which each variable is used by each method is maximally cohesive. (p. 140)
- **When classes lose cohesion, split them!** (p. 141)
- **In an ideal system we incorporate new features by extending** the system, not by making modifications to existing code. (p. 149)

## Systems
- **Even well-designed APIs can be overkill when they aren’t really needed**. A good API should largely disappear from view most of the time, so the team expends the majority of its creative efforts focused on the user stories being implemented.(p. 167)
- **We often forget that it is also best to postpone decisions until the last possible moment**.

This isn’t lazy or irresponsible; it lets us make informed choices with the best possible information. A premature decision is a decision made with suboptimal knowledge. (p. 168)

- **An invasive architecture overwhelms the domain logic** and impacts agility. Whether you are designing systems or individual modules, never forget to use the simplest thing that can possibly work. (p. 169)

## Concurrency
- **Concurrency is a decoupling strategy**. It helps us decouple what gets done from when it gets done.
- **Keep your concurrency-related code separate from other code**.
- **Take data encapsulation to heart**; severely limit the access of any data that may be shared.
- **Attempt to partition data into independent subsets** that can be operated by independent threads, possibly in different processors.
- **Keep your synchronized sections as small as possible**.
- **Do not try to chase down non-threading bugs and threading bugs at the same time**. Make sure your code works outside of threads.

## Smell & Heuristics
- Every time you see **duplication in the code, it represents a missed opportunity for abstraction**. (p. 289)
- **A well-defined interface does not offer very many functions to depend upon**, so coupling is low. A poorly defined interface provides lots of functions that you must call, so coupling is high. (p. 291)
- **Finding a private function should just be a matter of scanning downward** from the first usage. (p. 292)
- **Follow the “one switch” rule**: there may be no more than one switch statement for a given type of selection. The cases in that switch statement must create polymorphic objects that take the place of other such switch statements in the rest of the system. (p. 299)
- **Boundary conditions are hard to keep track of**. Put the processing for them in one place. We don’t want swarms of +1s and -1s scattered hither and yon. (p. 304)
- **The statements within a function should all be written at the same level of abstraction** which should be one level below the operation described by the name of the function. (p. 304)
- **“Write shy code”** or follow the Law of Demeter: we don’t want a single module to know much about its collaborators. (p. 306)
- **Don’t be too quick to choose a name**. Make sure the name is descriptive. Remember that meanings tend to drift as software evolves. 
    - This is not just a “feel-good” recommendation. Names in software are 90% of what make software readable. (p. 309)
- **Don’t pick names that communicate implementation**. (p. 311)
- **The length of a name should be related to the length of the scope**. The longer the scope of the name, the longer and more precise the name should be. (p. 312)
- **A slow test is a test that won’t get run**. When things get tight, it’s the slow tests that will be dropped from the suite. So do what you must to keep your tests fast. (p. 314)

Clean code is not written by following a set of rules. You don’t become a software craftsman by learning a list of heuristics. Professionalism and craftsmanship come from values that drive disciplines. (p. 314)
