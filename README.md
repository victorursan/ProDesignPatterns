README
------

In this folder I'll be going step by step from the Chapter 3 forwards with the patterns and projects from the book Pro Design Patterns in Swift by Adam Freeman.


**I - The Creation Patterns
-------------------------

1. Creating an Unstructured iOS App Project
-------------------------------------------
In this part, I, with the help of the book, will create a basic iOS App Project with no specific pattern or structure
*branch: master

2. The Object Template Pattern
------------------------------
In this part, I divide everything, conforming to the pattern, into classes/ structures
*Ideea: Group everything with the same purpose into classes or structures
*Caution: Carefull with reference types
*branch: TheObjectTemplatePatter

3. The Prototype Pattern
------------------------
In this part, I created a Logger and made the Product class copyable, conform the pattern
*Ideea: Create an instance of a class named the prototype and clone the other instances needed off of it
*Caution: Implement NSObject and NSCopying to classes such that they can be cloned and pay attention to deep copying and shalow copying 
*branch: ThePrototypePattern

4. The Singleton Pattern
------------------------
In this part, I made the Logger a singleton and fixed any possible concurrency issues that it may incounter
*Ideea: Create a global instance of the class or better said, only one instance of the object may exist in the app.
*Caution: concurrency -> dispatch_async, dispatch_sync, queue and others
*branch: TheSingletonPattern

5. The Object Pool Pattern
--------------------------
In this part, I made NetworkConnection and NetworkPool to simulate a server and a ProductDataStore to store all the products
*Ideea: Simillarly with the Singleton Pattern but in this case, we have more than one resource, but a finite amount
*Caution: Singleton.Caution + possible semaphores
*branch: TheObjectPoolPattern

6. Object Pool Variation
------------------------
In this part, I changed from the eager strategy to the lazy strategy on the NetworkPool, which means that I create a new network connection only if one is not available 
*Ideea: Understanding the Object Creation Strategy, Object Reuse Strategy, Empty Pool Strategy, Allocation Strategy, Expectaton Gap Pitfall and Over- and Under utilization Pitfalls of the pattern
*Caution: Pool.Caution + knowing when the pattern may cause more harm than good
*branch: ObjectPoolVariations

7. The Factory Pattern
----------------------
In this part, I added 2 product types that conform to the Product class and made the Product class be able to create the other 2 classes
*Ideea: Make the same type of objects conform to the same protocol or base class
*Caution: Careful with delegating some functionality down the tree
*branch: TheFactoryMethodPattern

8. Abstract Factory Pattern
---------------------------
In this part, I added a currency formatter and a converter by creating 2 factories (one for each)
*Ideea: Make a factorie that manages more than one object
*Caution: Use this pattern when you have to create objects of the same nature but containt objects of different kind
*branch: AbstractFactoryPattern

9. The Builder Pattern
----------------------
In this part, I added a ChangeRecord module with a ChangeRecord class and a ChangeRecordBuilder that creates the desired object. With does 2 I changed the Logger.
*Ideea: For a class that in use has general value for some properties, create a builder to manage them and not the class or the caller.
*Caution: When objects are in general different from each other (all properties and so on), don't use this pattern
*branch: TheBuilderPattern

**II - The Structural Patterns
------------------------------

10. The Adapter Pattern
-----------------------
In this part, I added an Euro Handler and considered it as an inaccessible class and with the use of the Adapter pattern made it like the other 2 currency
*Ideea: If you have 2 or more classes that have the same or similar scope but different api, adapt one to the other with an extension or with a wraper
*Caution: Don't adapt classes that don't have the same purpose 
*branch: TheAdapterPattern

11. The Bridge Pattern
----------------------
In this part, I added an EventBridge class to separate the input callback from the output callback of the app
*Ideea: It's applied to the exploding class hierarchy problem, create a bridge class ties other classes together
*Caution: don't use it if you need the bridge just for a specific job, in that case Collapse the Bridge
*branch: TheBridgePattern

12. The Decorator Pattern
-------------------------
In this part, I added a ProductDecorator module with decorators for the price such that if there are less than 4 items, the price is higher or if the item is in the soccer category, the item is cheaper
*Ideea: Create a base decorateor to initialize a wrapper of the product to be decorated, and each decorateor will inherit from it and overrite the necesary elements 
*Caution: try to keep the decorator for a single purpose
*branch: TheDecoratorPattern

13. The Composite Pattern
-------------------------

*Ideea:
*Caution:
*branch: