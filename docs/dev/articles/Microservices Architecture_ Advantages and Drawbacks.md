# [Microservices Architecture: Advantages and Drawbacks](https://cloudacademy.com/blog/microservices-architecture-challenge-advantage-drawback/)

---
###### tags: `Dev` `Article` `Microservices`
---

Microservices are a way of breaking large software projects into loosely coupled modules, which communicate with each other through simple Application Programming Interfaces (APIs).
Microservices have become increasingly popular over the past few years. The modular architectural style, based on the philosophy of breaking large software projects into smaller, independent, and loosely coupled modules, has gained prominence among developers for its dynamic and agile qualities in API management and execution of highly defined and discrete tasks.

Simply stated, microservices are really nothing more than another architectural solution for designing complex – mostly web-based – applications. Microservices have gained prominence as an evolution from SOA (Service Oriented Architecture), an approach that was designed to overcome the disadvantages of traditional monolithic architectures. In this blog post, we’ll explore the evolution of development from monolithic architectures towards microservices and its underlying justifications.

## The Evolution from Monolithic Architecture

Let’s start with a simple example.

Suppose I need to build a classic web application using Java. The first thing I will do is design a Presentation Layer (the user interface), followed by an Application Layer, which handles all of the business logic. This is followed by an Integration Layer to enable loose coupling between various components of the Application Layer. Finally, I will design a Database Layer that will be accessible to the underlying persistence system.

To run the entire application, I will create either a WAR or EAR package and deploy it on an application server (like JBoss, Tomcat, or WebLogic). Because I have packaged everything as an EAR/WAR, my application becomes monolithic in nature, which means that even though we have separate and distinguishable components, all are packaged together.

Here’s an illustration:

<img src="https://d1o2okarmduwny.cloudfront.net/wp-content/uploads/2015/10/113.png" alt="Traditional web application" style="display: block; margin: auto" />

You may already be familiar with the characteristics of monolithic applications depending on your development experience. However, this example also stands to illustrate some of the challenges developers and architects face with this kind of design.

Here are the flaws:

- As the application grows, so does the associated code base, which can overload your development environment each time it loads the application, reducing developer productivity.
- Because the application has been packaged in one EAR/WAR, changing the technology stack of the application becomes a difficult task. With this kind of architecture, refactoring the code base becomes difficult because it’s hard to predict how it will impact application functionality.
- If any single application function or component fails, then the entire application goes down. Imagine a web application with separate functions including payment, login, and history. If a particular function starts consuming more processing power, the entire application’s performance will be compromised.
- Scaling monolithic applications such as the one described in the example can only be accomplished by deploying the same EAR/WAR packages in additional servers, known as horizontal scaling. Each copy of the application in additIonal servers will utilize the same amount of underlying resources, which is inefficient in its design.
- Monolithic architecture impacts both the development and application deployment stage. As applications increase in size, it’s even more important that developers be able to break their applications down into smaller components. Because everything in the monolithic approach is tied together, developers cannot work independently to develop or deploy their own modules and must remain totally dependent on others, increasing overall development time.

With these thoughts in mind, let’s explore the value of microservices and how they can be used to provide the flexibility that’s lacking in monolithic architectures.

## Exploring Microservices
One of the major driving forces behind any kind of architectural solution is scalability. While I was first exploring microservices, I observed that peers seemed to gravitate towards a book called [The Art of Scalability](http://theartofscalability.com/). The book’s defining model was the Scale Cube, which describes three dimensions of scaling:

<img src="https://d1o2okarmduwny.cloudfront.net/wp-content/uploads/2015/10/114.png" alt="Three dimensions of scaling" style="display: block; margin: auto" />

As you can see, the X-axis represents horizontal application scaling (which we have seen is possible even with monolithic architecture), and the Z-axis represents scaling the application by splitting similar things. The Z-axis idea can be better understood by using the sharding concept, where data is partitioned and the application redirects requests to corresponding shards based on user input.

The Y-axis represents functional decomposition. In this approach, various functions can be seen as independent services. Instead of deploying the entire application once all the components are available, developers can deploy their respective services independently. This not only improves developer time management but also offers greater flexibility to change and redeploy their modules without worrying about the rest of the application’s components. You can see how this is different from the earlier diagram which showed a monolithic design:

<img src="https://d1o2okarmduwny.cloudfront.net/wp-content/uploads/2015/10/115.png" alt="Monolithic design" style="display: block; margin: auto" />

## The Advantages of Microservices
The advantages of microservices seem strong enough to have convinced some big enterprise players such as Amazon, Netflix, and eBay to adopt the methodology. Compared to more monolithic design structures, microservices:

- Improve fault isolation: Larger applications can remain mostly unaffected by the failure of a single module.
- Eliminate vendor or technology lock-in: Microservices provide the flexibility to try out a new technology stack on an individual service as needed. There won’t be as many dependency concerns and rolling back changes becomes much easier. With less code in play, there is more flexibility.
- Ease of Understanding: With added simplicity, developers can better understand the functionality of a service.

## Deployment of Microservices
Now that we understand microservices, how are they deployed?

The best way to deploy microservices-based applications is within containers, which are [complete virtual operating system environments](https://cloudacademy.com/blog/container-virtualization/) that provide processes with isolation and dedicated access to underlying hardware resources. One of the biggest names in container solutions right now is [Docker](https://www.docker.com/), which you can learn more about in our [Getting Started course](https://cloudacademy.com/cloud-computing/introduction-to-docker-course/).

Virtual machines from infrastructure providers like Amazon Web Services (AWS) can also work well for microservices deployments, but relatively lightweight microservices packages may not leverage the whole virtual machine, potentially reducing their cost effectiveness.

Code deployments can also be completed using an Open Service Gateway Initiative (OSGI) bundle. In this use case, all application services will be running under one Java virtual machine, but this method comes with a management and isolation tradeoff.

## The Disadvantages of Microservices
Microservices may be a hot trend, but it does not come without its drawbacks.

Here’s a list of some potential pain areas associated with microservices designs:

- Developing distributed systems can be complex. Since everything is now an independent service, you have to carefully handle requests traveling between your modules. In one such scenario, developers may be forced to write extra code to avoid disruption. Over time, complications will arise when remote calls experience latency.
- Multiple databases and transaction management can be painful.
- Testing a microservices-based application can be cumbersome. In a monolithic approach, we would just need to launch our WAR on an application server and ensure its connectivity with the underlying database. With microservices, each dependent service needs to be confirmed before testing can occur.
- Deploying microservices can be complex. They may need coordination among multiple services, which may not be as straightforward as deploying a WAR in a container.

Of course, with the right kind of automation and tools, all the above drawbacks can be addressed.

## Closing Thoughts

As application development trends continue to evolve, the debate between using microservices or leveraging traditional monolithic architectures will only become more pronounced. In the end, developers must do their due diligence and understand what works for their specific use cases.

If you’re looking to use microservices, get started today with these resources on Cloud Academy:

- Build Microservices on AWS Using Serverless: Watch this on-demand webinar to learn how to [build event-driven microservices](https://cloudacademy.com/webinars/building-microservices-aws-using-serverless-framework-58/) on top of AWS Lambda, Twilio, Amazon Rekognition, and IMDbPy API using the Serverless framework.
- Use this hands-on lab to [build RESTful microservices with AWS Lambda and API Gateway](https://cloudacademy.com/lab/restful-microservices-aws-lambda-api-gateway/)
- Explore all of our microservices courses in the [Cloud Academy Content Library](https://cloudacademy.com/library/?q=microservices).
