README
------

In this folder I'll be going step by step from the Chapter 3 forwards with the patterns and projects from the book Pro Design Patterns in Swift by Adam Freeman.

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
*Caution: concurrency -> dispatch_asyn, dispatch_sync, queue and others
*branch: TheSingletonPattern

5. The Object Pool Pattern
--------------------------
In this part, I made NetworkConnection and NetworkPool to simulate a server and a ProductDataStore to store all the products
*Ideea: Simillarly with the Singleton Pattern but in this case, we have more than one resource, but a finite amount
*Caution: Singleton.Caution + possible semaphores
*branch: TheObjectPoolPattern

6. Object Pool Variation
------------------------
In this part, I changed from the eager strategy to the lazy strategy got the NetworkPool, which means that I create a new network connection only if one is not available 
*Ideea: Understanding the Object Creation Strategy, Object Reuse Strategy, Empty Pool Strategy, Allocation Strategy, Expectaton Gap Pitfall and Over- and Under utilization Pitfalls of the pattern
*Caution: Pool.Caution + knowing when the pattern may cause more harm than good
*branch: ObjectPoolVariations


