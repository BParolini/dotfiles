# [systemd unit file creating a service](https://linuxhint.com/systemd_unit_file_service/)

---
###### tags: `Dev` `Article` `systemd`
---

Service management is something you don’t even think of when you use your Linux workstation or Linux server everyday, but when it’s not there you will really hate it. When you create for example a new server program that needs to run 24/7, doing this challenge without service management is a nightmare where you create in fact a small service system yourself, which will be obviously not as good as the manager developed by a full team during years, anyway.

With its services, systemd makes all of this easier, really easier. As soon as you want something monitoring your application and easy control of it, systemd is the way to go, and that’s what I’m going to explain here!

## Where are Systemd Services
To add a new service, well, you need to answer this question. As always in systemd, it depends if the service is only for your user or the whole system. We’ll focus on how systemd works for whole system services.

The exact location depends of why and how the service got installed. If the service is installed by a package manager, it will be generally in /usr/lib/systemd/system. For software you develop or the ones that doesn’t support systemd by itself, you will put the service file in /usr/local/lib/systemd/system. Please keep in mind though that some distributions doesn’t support this folder in /usr/local. Finally, if you want to configure an existing systemd service, /etc/systemd/system is the way to go.

Inside these folders you can find multiple file extension such as *.socket, *.target or *.service. Obviously we’re going to focus on the last. systemd uses the filename as the name of the service when starting it or stopping it etc. So generally filenames in service only contains alphanumeric characters along with hyphens and underscores. During development I recommend to create it in your documents and then copy it to systemd location when done, that would avoid you problems if you save in middle of editing.

OK so please create your service file in your documents. Now we’re ready to review how to write this file.

```
[Unit]
Description=Penguins Web Application HTTP server (running in port 8080)
WantedBy=multi-user.target
 
[Service]
Type=simple
ExecStart=/usr/bin/python3 /usr/local/bin/penguin-web-app/main.py
Restart=always
```

The file format is in fact close to ini. I know it may be weird given ini files are often found in Windows but that’s how it works. The service file is first divided in 2 sections: \[Unit\] and \[Service\]. Each section configures a specific aspect of systemd: \[Unit\] contains elements shared by all systemd unit files while \[Service\] is only for configuration specific to setting up a new service.

Then the section is configured with properties such as Description= or ExecStart=. The value is separated from property name by the equal sign = without any space.

Let’s go back to the file shown above. It describes a service designed to run a web app written in Python about penguins. systemd will restart it whenever the process exits and starts the server upon server’s start-up if you enable it with systemctl enable command. Cool eh?

But you’re maybe your next web app isn’t about penguins — and that’s a shame — and it’s not written in Python. In this case you’ll want to learn more about the possible configurations.

## Properties of Systemd Services
Let’s first focus about the properties in \[Unit\]:

Description= is just about giving a clear description of what service is doing. It’s displayed in service list, service logs so you want it to be descriptive but it should stay in one line and one sentence.

WantedBy= allows to say to systemd: when this thing is started, starts me as well. Generally you’ll put the name of a target. Examples of common targets:

1. multi-user.target: when server is OK and is ready to run command line applications
2. graphical.target: when GNOME or KDE is ready
3. network-up.target: when server is connected properly to a network

OK for the beginning these properties of [Unit] is enough. Let’s take a look on [Service] now.

Type= helps systemd in how to know if a service is running. Here are common types:

1. simple is probably the most commonly used: systemd considers the process you launch as the one doing the service. If the process stops, it considers the service stopped as well, etc.
2. forking is preferred for applications that were written to be a server but without the help of a service management system. Basically it expects the launched process to fork and that fork is considered the final process for the service. In order to be more accurate, you may also help systemd with a PID file, where the PID of the process to track is written by the launched application.

ExecStart= is probably the most important for a service: it precises what application to launch when starting the service. As you can see in the Penguin service, I have used /usr/bin/python3 and not python3 straight away. It’s because systemd documentation explicitly recommends to use absolute paths in order to avoid any surprises.

But that’s also for another reason. Other services’ management system tend to be based on Shell scripts. However systemd, for performance reason, doesn’t run a shell by default. So you can’t provide directly a shell command in ExecStart=. You can however still use a shell script by doing:

```
ExecStart=/usr/bin/bash /usr/local/bin/launch-penguin-server.sh
```

Not that hard right? Note that if you need to run some process to signal your service to stop cleanly, ExecStop= exists, as well as ExecReload= for reloading services.

Restart= allows you to explicitly tell when the service should be restarted. This is one of the important features of systemd: it ensures that your service stays up as long as you wish to, so pay close attention to this option.

| Restart= | Meaning |
| - | - |
| always | systemd will keep restarting it whenever it terminates or crashes. Well, until you do systemctl stop service-name.service. It’s perfect for servers and online services as you prefer few useless restarts over having to manually restart the service without any reason. |
| on-abnormal | When the service process crashes, restart the service. However, if the application exits cleanly, don’t restart it. It’s more useful for cron-jobs like services that needs to do a task reliably but don’t need to run all the time. |
| on-failure | Much like on-abnormal, but it also restarts the service when the application exits cleanly but with a non-zero exit code. Non-zero exit codes generally means an error happened. |
| no | systemd will not restart the service automatically. Generally useful to get access to other systemd features such as logging without the restart feature. |

WorkingDirectory= can enforce a working directory when launching your application. The value must be an absolute directory path. Working directory is used when you use relative paths in your application’s code. For our penguins service, it could be:

```
WorkingDirectory=/srv/penguin-web-app/
```

Then, security is important so you generally want to not launch your service with root privileges. User= and Group= enables you to set the user or group name or UID/GID under which your application will be launched. For example:

```
User=penguin-web
Group=penguin-web
```

EnvironmentFile= is a powerful option. Applications running as services often needs configuration and environment files allows to set that configuration in two ways:

1. The application can read directly the environment variable.
2. But also you can set different command line arguments to your application without changing the service file.

The syntax of this file is simple: you type the environment variable name, the equal sign = and then its value. Then you put the absolute path of your environment file into EnvironmentFile property.

So example:
```
EnvironmentFile=/etc/penguin-web-app/environment
```

And the /etc/penguin-web-app/environment file contains:

```
LISTEN_PORT=8080
```

Then our penguins web app will have access to LISTEN_PORT environment variable and listen to the expected port.

## Save and Start the Newly Created Systemd Service
So if you followed my advice, you edited your service file in your home directory. Once you’re satisfied, copy that file to /usr/local/lib/systemd/system, assuming your distribution supports that path. The filename of your service file will be its service name. This filename have to end with .service. For example, for our penguins server, it would be penguin-web-app.service.

Then, you have to tell systemd you added a new service, so you need to type this command:

```
$ sudo systemctl daemon-reload
```

Okay now systemd is aware of your new service, assuming your file doesn’t contain a syntax error. After all, it’s your first file so it’s likely you’ll make mistakes. You have to run this command above on every update in your service file.

Now, time to start the service:

```
$ sudo systemctl start penguin-web-app.service
```

If it fails with a Unit not found error such as this one:

```
$ sudo systemctl start penguin-web-app.service
Failed to start penguin-web-app.service: Unit not found.
```

It means that your distribution doesn’t support the directory or you didn’t named correctly your service file. Be sure to check out.

If you set up your service with WantedBy= and wants that your service starts automatically, you have to enable it, with this command:

```
$ sudo systemctl enable penguin-web-app.service
```

The cool thing with a service is that it runs in background. The problem: how to know if it runs properly and if it’s running if it’s running in background? Don’t worry, systemd team thought about that too and provided a command to see if it runs properly, since how much time, etc:

```
$ systemctl status penguin-web-app.service
```

## Conclusion
Congrats! You can now have your applications managed without you caring about restarting it manually every time. Now, I recommend you to read our other article about systemd logs: [Master journalctl: understand systemd logs](https://linuxhint.com/understand_systemd_logs/). With that you can use the powerful logging system on your new service and build more reliable servers!
