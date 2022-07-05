# [Benefits of Microservices Architecture Implementation](https://dzone.com/articles/benefits-amp-examples-of-microservices-architectur)
by [Ekaterina Novoseltseva](https://dzone.com/users/2948443/ekaterinan7.html)
With microservices, modules within software can be independently deployable. See why this decentralized approach to development is working worldwide.

---
###### tags: `Dev` `Article` `Microservices`
---

## What's So Good About Microservices Architecture?
 [Microservices](https://apiumhub.com/tech-blog-barcelona/microservices/) are also known as the microservices architecture. It is an architectural style, an approach to software development in which a large application is built as a suite of modular services; small, independently versioned, and scalable customer-focused services with specific business goals, which communicate with each other over standard protocols with well-defined interfaces. As they are independently deployable and scalable, each service also provides a firm module boundary, even allowing for different services to be written in [different programming languages](https://apiumhub.com/tech-blog-barcelona/new-programming-languages/) and can also be managed by different teams.

In microservices architecture, large software projects are broken down into smaller, more independent modules. Responsible for highly defined and discrete tasks, these individual modules communicate with each other through simple, universally accessible APIs. It is a distinctive method of developing software systems that has grown in popularity in recent years. Thanks to its scalability, this architectural method is considered particularly ideal when you have to enable support for a range of platforms and devices, for example: web, mobile, [Internet of Things](https://apiumhub.com/tech-blog-barcelona/iot-projects-will-change-world/), wearables, or simply when you’re not sure what kind of devices you’ll need to support in a cloudy future.

The main idea behind microservices architecture is that some types of applications become easier to build and maintain when they are broken down into smaller, composable pieces which work together. In other words, each component is developed separately, and the application is then simply the sum of its constituent components. In a microservices architecture, each service runs a unique process and usually manages its own database. This not only provides development teams with a more decentralized approach to building software, it also allows each service to be deployed, rebuilt, redeployed and managed independently.

The philosophy of the microservices architecture is: “Do one thing and do it well." Services might run within the same process, but they should be independently deployable and easy to replace. They can be implemented using different programming languages, databases, and software environment. The services are small and fine-grained to perform a single function. They embrace [automation of testing](https://apiumhub.com/tech-blog-barcelona/top-software-testing-techniques/) and deployment, continuous delivery software development process, failure and faults, similar to anti-fragile systems. Each service is elastic, resilient, composable, minimal, and complete.

Also, probably you have heard about [Docker](https://apiumhub.com/tech-blog-barcelona/top-benefits-using-docker/) if you are interested in microservices architecture. And you have heard that Docker or other container technologies are kind of enablers of microservice architecture. Containers are designed to be pared down to the minimal viable pieces needed to run whatever the one thing the container is designed to do, rather than packing multiple functions into the same machine. The ease of development that Docker provides helps make possible rapid development and testing. Using containers and microservices together enhances cloud capabilities. Microservices are scalable and reusable, while containers supply efficient resources. Both microservices and containers can work independently, but it has become clear that merging them has improved runtime frequency, cloud-hosting policies and cloud tools.

## Microservices Architecture Benefits
- Software built as microservices can be broken down into multiple component services, so that each of these services can be deployed and then redeployed independently without compromising the integrity of an application. That means that microservice architecture gives developers the freedom to independently develop and deploy services.
- Better fault isolation; if one microservice fails, the others will continue to work.
- Code for different services can be written in different languages.
- Easy integration and automatic deployment; using open-source [continuous integration](https://apiumhub.com/tech-blog-barcelona/benefits-of-continuous-integration/) tools such as [Jenkins](https://apiumhub.com/tech-blog-barcelona/best-jenkins-plugins/), etc.
- The microservice architecture enables continuous delivery.
- Easy to understand since they represent a small piece of functionality, and easy to modify for developers, thus they can help a new team member become productive quickly.
- The code is organized around business capabilities.
- Scalability and reusability, as well as efficiency. Easy to scale and integrate with third-party services.
- Components can be spread across multiple servers or even multiple data centers.
- Work very well with containers, such as Docker.
- Complement cloud activities.
- Microservices simplify security monitoring because the various parts of an app are isolated. A security problem could happen in one section without affecting other areas of the project.
- Increase the autonomy of individual development teams within an organization, as ideas can be implemented and deployed without having to coordinate with a wider IT delivery function.

## Successful Case Studies and Examples of Microservices Architecture Implementation
Netflix, eBay, Amazon, the UK Government Digital Service, Twitter, PayPal, The Guardian, and many other large-scale websites and applications have all evolved from monolithic to microservices architecture. Let’s look at some of the success stories to see the results:

### Walmart Successfully Revitalized Its Failing Architecture With Microservices
This is a good example of what should be done when aging architecture begins to negatively affect business. This is the multi-million dollar question which the IT Department of Walmart Canada had to address after they were failing on Black Fridays for two years in a row

The problem was that It couldn’t handle 6 million pageviews per minute and made it impossible to keep any kind of positive user experience anymore. Before embracing microservices, Walmart had an architecture for the internet of 2005, designed around desktops, laptops and monoliths. The company decided to replatform its old legacy system in 2012 since it was unable to scale for 6 million pageviews per minute and was down for most of the day during peak events. They wanted to prepare for the world by 2020, with 4 billion people connected and 25+ million apps available. So Walmart replatformed to a microservices architecture with the intention of achieving close to 100% availability with reasonable costs.

Migrating to microservices actually brought [notable results](https://blog.risingstack.com/how-enterprises-benefit-from-microservices-architectures/):

- Conversions were up by 20% literally overnight
- Mobile orders were up by 98% instantly
- No downtime on Black Friday or Boxing Day
- The operational savings were significant as well since the company moved off of its expensive hardware onto commodity hardware
- They saved 40% of the computing power and experienced 20-50% cost savings overall

### Spotify Builds Outstanding User Experience With Microservices
Kevin Goldsmith, VP of Engineering at Spotify, knows from his experience that an enterprise which intends to move fast and stay innovative in a highly competitive market requires an architecture that can scale.

Spotify serves more than 75 million active users per month, with an average session length of 23 minutes, while running incredibly complex business roles behind the scenes.

So, Spotify came to the conclusion that if you’re worried about scaling to hundreds of millions of users, you build your system in a way that you scale components independently. And Spotify built a microservice architecture with autonomous full-stack teams in charge in order to avoid synchronization hell within the organization. These teams are autonomous, and their mission does not overlap with other teams mission.

Now, Spotify has around 90 teams, 600 developers, and 5 development offices on two continents building the same product, so they needed to minimize these dependencies as much as possible.

What Spotify really likes about microservices is that they don’t have large failures; big services fail big, small services fail small. Building a microservices architecture allows Spotify to have a large number of services down at the same time without the users even noticing it. They’ve built their system assuming that services can fail all the time, so individual services that could be failing are not doing too much, so they can’t ruin the experience of using Spotify.

### Amazon Embraced The DevOps Philosophy With Microservices
Amazon has also migrated to microservices.They get countless calls from a variety of applications, including applications that manage the web service API as well as the website itself, which would have been simply impossible for their old, two-tiered architecture to handle.

In 2001, the Amazon.com retail website was a large architectural monolith. It was architected in multiple tiers, and those tiers had many components in them, but they were coupled together very tightly, and behaved like one big monolith. They had a large number of developers working on one big monolithic website, and even though each one of these developers only worked on a very small piece of that application, they still needed to deal with the overhead of coordinating their changes with everyone else who was also working on the same project. When they were adding a new feature or making a bugfix, they needed to make sure that the change was not going to break something else on that project. If they wanted to update a shared library to take advantage of a new feature, they needed to convince everyone else on that project to upgrade to the new shared library at the same time. If they wanted to make a quick fix – to push out to their customers quickly – they couldn’t just do it on their own schedule, they had to coordinate that with all the other developers who have been processed changes at the same time. In the early 2000’s Amazon even had an engineering group whose sole job was to take new versions of the application and manually push it across Amazon’s production environment.
It was a very long and complex process, it was hell. It was frustrating for the software engineers, and most importantly, it was slowing down the software development lifecycle, the ability to innovate, so they made architectural and organizational changes.

These big changes began on an architectural level: Amazon went through its monolithic application into a Service Oriented Architecture. Amazon also implemented changes in how their organization operated. They broke down their one, central, hierarchical product development team into small, “two-pizza teams." They wanted teams so small that they could feed them with just two pizzas. Each of these teams was given full ownership of one or a few microservices. So they were defining their own feature roadmap, designing their features, implementing their features, then testing, deploying and operating them.

After all these changes were made, Amazon dramatically improved its front-end development lifecycle. Now the product teams can quickly make decisions and crank out new features for their microservices. Now the company makes 50 million deployments a year, thanks to the microservice architecture and their continuous delivery processes.
