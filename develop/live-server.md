---
title: live-server
date: 2023-06-07 14:23
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #终端工具
- #前端开发
- #命令行

# 3 simple servers to run your site locally (Mac)

Running Python’s SimpleHTTPServer

We all have been there. You want to build a website but you have no idea how to start or how to see your changes. I’m going to share with you my favorite ways to run sites locally. Hopefully you will get some insight out of this post and with start creating your website. Keep in mind this is directed to people building sites from scratch **without** using a Content Management System like Wordpress.

# **1. Python’s SimpleHTTPServer**

When I first started creating websites locally this was the first method I opted for. I’ll admit this isn’t the best way to develop a website but it is simple and really good if you want to make some minor changes. You need to have python installed on your machine.

**INSTALL PYTHON or PYTHON3**

```
brew install python
```

For Python3

```
brew install python3
```

**Alright lets run it**

navigate to the the folder that contains your index.html file for your website. Run the below command

**python**

```
python -m SimpleHTTPServer [PORT NUMBER]
```

**python3**

```
python3 -m http.server [PORT NUMBER]
```

If you don’t provide the port number then the server will automatically run on `localhost:8000`

Thats it! Simple right?!

## 20.19. SimpleHTTPServer - Simple HTTP request handler - Python 2.7.14rc1 documentation

### The module has been merged into http.server in Python 3. The tool will automatically adapt imports when converting your…

docs.python.org

# 2. Node.js http-server

Similar to python’s SimpleHTTPServer, Node’s http-server module will serve files on localhost and you will be able to access it in any of you browser’s. In order install this you will need Node and npm installed on you machine. The easiest way to do is through HomeBrew.

**Install Node and npm**

```
brew install node
```

Thats it! HomeBrew will install both node and npm with this command. you can verify you version of node and npm by running the following

```
node -vnpm -v
```

Now its time install http-server using npm

**Install http-server**

```
npm install http-server -g
```

the `-g` flag will install http-server globally so you can run it from anywhere in your terminal.

**Lets run it!**

So we finally got everything installed lets run your website on it! run the following command

```
http-server [path] [options]
```

the [path] would be the root folder in which you want to run your website (probably the one with you index.html file).

http-server offers a lot of `[options]` that you can use to configure your server. you can leave this field blank and the server will run on port `localhost:8080`. Use the below link as reference for other `[options]`

## http-server

### A simple zero-configuration command-line http server

www.npmjs.com

# 3. Node.js live-server

Node is a powerful tool and comes with a lot of useful modules. This is my favorite simple server to run on my projects because it will actually watch your files as you reload the browser for you every time you save a change! If you haven’t installed node yet please refer to #2 and follow the instructions.

So if you have any memory of how we install “node packages” you know what to do! To install **live-server** run the following command.

**Install live-server**

```
npm install live-server -g
```

once again `-g` the flag will install it globally so that you can run the from any location on your computer. Once the server is installed you can run the following command from the root directory of your project.

**run the live-server command**

```
live-server [options]
```

live-server also offers a lot of `[options]` that you can run in the command line to configure. if you leave it blank it will automatically run on `localhost:8080`. Use the below link as reference for other `[options]`

```shell
mikeshinoda@MikedeMacBook-Air ~/reference-pages (gh-pages) [SIGINT]> live-server -h
Usage: live-server [-v|--version] [-h|--help] [-q|--quiet] [--port=PORT] [--host=HOST] [--open=PATH] [--no-browser] [--browser=BROWSER] [--ignore=PATH] [--ignorePattern=RGXP] [--no-css-inject] [--entry-file=PATH] [--spa] [--mount=ROUTE:PATH] [--wait=MILLISECONDS] [--htpasswd=PATH] [--cors] [--https=PATH] [--https-module=MODULE_NAME] [--proxy=PATH] [PATH]
```
