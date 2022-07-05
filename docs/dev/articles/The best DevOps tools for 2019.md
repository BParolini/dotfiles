# [The best DevOps tools for 2019](https://raygun.com/blog/best-devops-tools/)

---
###### tags: `Dev` `Article`
---

## 1. [Gradle][gradle]

<img src="https://raygun.com/blog/images/best-devops-tools/gradle.png" alt="Gradle" style="display: block; margin: auto" />

Your DevOps tool stack will need a reliable build tool. Apache Ant and Maven dominated the automated build tools market for many years, but [Gradle][gradle] showed up on the scene in 2009, and its popularity has steadily grown since then. Gradle is an incredibly versatile tool which allows you to write your code in Java, C++, Python, or other languages. Gradle is also supported by popular IDEs such as Netbeans, Eclipse, and IntelliJ IDEA. If that doesn’t convince you, it might help to know that Google also chose it as the [official build tool](https://developer.android.com/studio/build/) for Android Studio.

While Maven and Ant use XML for configuration, Gradle introduces a Groovy-based DSL for describing builds. In 2016, the Gradle team also released a [Kotlin-based DSL](https://github.com/gradle/kotlin-dsl), so now you can write your build scripts in Kotlin as well. This means that Gradle does have some learning curves, so it can help a lot if you have used Groovy, Kotlin or another JVM language before. Besides, Gradle uses Maven’s repository format, so dependency management will be familiar if you have prior experience with Maven. You can also [import your Ant builds](https://docs.gradle.org/current/userguide/ant.html) into Gradle.

The best thing about Gradle is [incremental builds](https://blog.gradle.org/introducing-incremental-build-support), as they save a nice amount of compile time. According to Gradle’s [performance measurements](https://gradle.org/gradle-vs-maven-performance/), it’s up to 100 times faster than Maven. This is in part because of incrementality, but also due to Gradle’s [build cache](https://blog.gradle.org/introducing-gradle-build-cache) and [daemon](https://docs.gradle.org/current/userguide/gradle_daemon.html). The build cache reuses task outputs, while the Gradle Daemon keeps build information hot in memory in-between builds.

All in all, Gradle allows faster shipping and comes with a lot of configuration possibilities.

## 2. [Git][git]

<img src="https://raygun.com/blog/images/best-devops-tools/git.png" alt="Git" style="display: block; margin: auto" />

[Git][git] is one of the most popular DevOps tools, widely used across the software industry. It’s a distributed SCM (source code management) tool, loved by remote teams and open source contributors. Git allows you to track the progress of your development work. You can save different versions of your source code and return to a previous version when necessary. It’s also great for experimenting, as you can create separate branches and merge new features only when they’re ready to go.

To integrate Git with your DevOps workflow, you also need to host repositories where your team members can push their work. Currently, the two best online Git repo hosting services are [GitHub](https://github.com/) and [Bitbucket](https://bitbucket.org/). GitHub is more well-known, but Bitbucket comes with free unlimited private repos for small teams (up to five team members). With GitHub, you get access only to public repos for free—which is still a great solution for many projects.

Both GitHub and Bitbucket have fantastic integrations. For example, you can integrate them with Slack, so everyone on your team gets notified whenever someone makes a new commit.

## 3.[Jenkins][jenkins]

<img src="https://raygun.com/blog/images/best-devops-tools/jenkins.png" alt="Jenkins" style="display: block; margin: auto" />

[Jenkins][jenkins] is the go-to DevOps automation tool for many software development teams. It’s an open source CI/CD server that allows you to automate the different stages of your delivery pipeline. The main reason for Jenkins’ popularity is its huge plugin ecosystem. Currently, it offers [more than 1,000 plugins](https://plugins.jenkins.io/), so it integrates with almost all DevOps tools, from Docker to Puppet.

With Jenkins, you can set up and customize your CI/CD pipeline according to your own needs. I found the following example in the [Jenkins Docs](https://jenkins.io/doc/book/pipeline/). And, this is just one of the possibilities. Nice, isn’t it?

<img src="https://raygun.com/blog/images/best-devops-tools/jenkins-pipeline.png" alt="Jenkins pipeline" style="display: block; margin: auto" />

It’s easy to [get started with Jenkins](https://jenkins.io/download/), as it runs out-of-the-box on Windows, Mac OS X, and Linux. You can also easily [install it with Docker](https://wiki.jenkins.io/display/JENKINS/Installing+Jenkins+with+Docker). You can set up and configure your Jenkins server through a web interface. If you are a first-time user, you can choose to install it with frequently used plugins. However, you can create your own custom config as well.

With Jenkins, you can iterate and deploy new code as quickly as possible. It also allows you to measure the success of each step of your pipeline. I’ve heard people complaining about Jenkins’ “ugly” and non-intuitive UI. However, I could still find everything I wanted without any problem.   

## 4. [Bamboo][bamboo]

<img src="https://raygun.com/blog/images/best-devops-tools/bamboo.png" alt="Bamboo" style="display: block; margin: auto" />

[Bamboo][bamboo] is Atlassian’s CI/CD server solution that has many similar features to Jenkins. Both are popular DevOps tools that allow you to automate your delivery pipeline, from builds to deployment. However, while Jenkins is open source, Bamboo comes with a price tag. So, here’s the eternal question: is it worth choosing proprietary software if there’s a free alternative? It depends on your budget and goals.

Bamboo has many pre-built functionalities that you have to set up manually in Jenkins. This is also the reason why Bamboo has fewer plugins (around 100 compared to Jenkins’ 1000+). In fact, you don’t need that many plugins with Bamboo, as it does many things out-of-the-box.

Bamboo seamlessly integrates with other Atlassian products such as Jira and Bitbucket. You also have access to built-in Git and Mercurial branching workflows and test environments. All in all, Bamboo can save you a lot of configuration time. It also comes with a more intuitive UI with tooltips, auto-completion, and other handy features.

## 5. [Docker][docker]

<img src="https://raygun.com/blog/images/best-devops-tools/docker.png" alt="Docker" style="display: block; margin: auto" />

[Docker][docker] has been the number one container platform since its launch in 2013 and continues to improve. It’s also thought of as one of the most important DevOps tools out there. Docker has made containerization popular in the tech world, mainly because it makes distributed development possible and automates the deployment of your apps. It isolates applications into separate containers, so they become portable and more secure. Docker apps are also OS and platform independent. You can use Docker containers instead of virtual machines such as VirtualBox.

What I like the most about Docker is that you don’t have to worry about dependency management. You can package all dependencies within the app’s container and ship the whole thing as an independent unit. Then, you can run the app on any machine or platform without a headache.

Docker integrates with Jenkins and Bamboo, too. If you use it together with one of these automation servers, you can further improve your delivery workflow. Besides, Docker is also great for cloud computing. In recent years, all major cloud providers such as AWS and Google Cloud added support for Docker. So, if you are planning a cloud migration, Docker can ease the process for you.

## 6. [Kubernetes][kubernetes]

<img src="https://raygun.com/blog/images/best-devops-tools/kubernetes.png" alt="Kubernetes" style="display: block; margin: auto" />

This year, everyone is talking about [Kubernetes][kubernetes]. It’s a container orchestration platform that takes containerization to the next level. It works well with Docker or any of its alternatives. Kubernetes is still very new; its first release came out in 2015. It was founded by a couple of Google engineers who wanted to find a solution to manage containers at scale. With Kubernetes, you can group your containers into logical units.

You may not need a container orchestration platform if you have just a few containers. However, it’s the next logical step when you reach a certain level of complexity and need to scale your resources. Kubernetes allows you to automate the process of managing hundreds of containers.

With Kubernetes, you don’t have to tie your containerized apps to a single machine. Instead, you can deploy it to a cluster of computers. Kubernetes automates the distribution and scheduling of containers across the whole cluster.

A Kubernetes cluster consists of one master and several worker nodes. The master node implements your pre-defined rules and deploys the containers to the worker nodes. Kubernetes pays attention to everything. For instance, it notices when a worker node is down and redistributes the containers whenever it’s necessary.

## 7. [Puppet Enterprise][puppet]

<img src="https://raygun.com/blog/images/best-devops-tools/puppet.png" alt="Puppet Enterprise" style="display: block; margin: auto" />

[Puppet Enterprise][puppet] is a cross-platform configuration management platform. It allows you to manage your infrastructure as code. As it automates infrastructure management, you can deliver software faster and more securely. Puppet also provides developers with an [open-source tool](https://puppet.com/download-open-source-puppet) for smaller projects. However, if you are dealing with a larger infrastructure, you may find value in Puppet Enterprise’s [extra features](https://puppet.com/products/why-puppet/puppet-enterprise-and-open-source-puppet), such as:

- Real-time reports
- Role-based access control
- Node management

With Puppet Enterprise, you can manage multiple teams and thousands of resources. It automatically understands relationships within your infrastructure. It deals with dependencies and handles failures smartly. When it encounters a failed configuration, it skips all the dependent configurations as well. The best thing about Puppet is that it has [more than 5,000 modules](https://forge.puppet.com/) and integrates with [many popular DevOps tools](https://puppet.com/products/managed-technology).

## 8. [Ansible][ansible]

<img src="https://raygun.com/blog/images/best-devops-tools/ansible.png" alt="Ansible" style="display: block; margin: auto" />

[Ansible][ansible] is a configuration management tool, similar to Puppet and Chef. You can use it to configure your infrastructure and automate deployment. Its main selling points compared to other similar DevOps tools are simplicity and ease of use. Ansible follows the same Infrastructure As Code (IAC) approach as Puppet. However, it uses the super simple YAML syntax. With Ansible, you can define tasks in YAML, while Puppet has its own declarative language.

Agentless architecture is another frequently mentioned feature of Ansible. As no daemons or agents run in the background, Ansible is a secure and lightweight solution for configuration management automation. Similar to Puppet, Ansible also has [several modules](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html).

If you want to better understand how Ansible fits into the DevOps workflow take a look at [this post](https://www.redhat.com/en/blog/integrating-ansible-jenkins-cicd-process) by the Red Hat Blog. It shows how to use Ansible for environment provisioning and application deployment within a Jenkins pipeline.

## 9. [Nagios][nagios]

<img src="https://raygun.com/blog/images/best-devops-tools/nagios.png" alt="Nagios" style="display: block; margin: auto" />

[Nagios][nagios] is one of the most popular free and open source DevOps monitoring tools. It allows you to monitor your infrastructure so that you can find and fix problems. With Nagios, you can keep records of events, outages, and failures. You can also keep an eye on trends with the help of Nagios’ graphs and reports. This way, you can forecast outages and errors and detect security threats.

Although there are many DevOps tools for infrastructure monitoring, Nagios stands out due to its rich [plugin ecosystem](https://exchange.nagios.org/). As Nagios has been around for a while (since 2002), there’s a vast community around it. Besides plugins, they also make add-ons, tutorials, translations, and other goodies—all for free.

Nagios offers four open source monitoring solutions:
- Nagios Core
- Nagios XI
- Nagios Log Server
- Nagios Fusion

Nagios Core is a command line tool, with all the basic functionalities. You can also opt for Nagios XI that comes with a web-based GUI and monitoring wizard. Nagios writes a handy [comparison of their capabilities](https://www.nagios.org/downloads/nagios-core/).

Nagios Log Server lets you search log data and set up alerts about potential threats. And, Nagios Fusion allows you to monitor multiple networks at the same time.

On the whole, Nagios provides DevOps teams with an infrastructure monitoring solution. However, it can take a while to set it up and make it compatible with your environment.

## 10. [Raygun][raygun]

<img src="https://raygun.com/blog/images/best-devops-tools/raygun.png" alt="Raygun" style="display: block; margin: auto" />

[Raygun][raygun] is a world-class error monitoring and crash reporting platform. [Application performance monitoring](https://raygun.com/platform/apm) (APM) is its most recent product. Raygun’s DevOps tool helps you diagnose performance issues and tracking them back to the exact line of code, function, or API call. The APM tool also fits well with Raygun’s error management workflow. For example, it automatically identifies your highest priority problems and creates issues for you.

Raygun APM can help you make the most out of other DevOps tools, as you are always notified about the problems. Since it automatically links errors back to the source code, Raygun brings Development and Operations together by providing one source of truth for the whole team the cause of errors and performance problems.

[gradle]: https://gradle.org/
[git]: https://git-scm.com/
[jenkins]: https://jenkins.io/
[bamboo]: https://www.atlassian.com/software/bamboo
[docker]: https://www.docker.com/
[kubernetes]: https://kubernetes.io/
[puppet]: https://puppet.com/products/puppet-enterprise
[ansible]: https://www.ansible.com/
[nagios]: https://www.nagios.org/
[raygun]: https://raygun.com/
