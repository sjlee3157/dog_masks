# HTTP

## Requests and Responses

### Request
So what does an _HTTP Request_ look like?

Below is an example. The key components for us right now are the:
- HTTP Verb, **GET**
- request URL, `/orders`

```
GET /orders HTTP/1.1
User-Agent: curl/7.30.0
Host: localhost:3000
Content-Length: 6
Accept: */*
```

The data sent in the request allows the server to determine what type of data you want to see in the response. A combination of HTTP verbs and URLs will give us our application behavior.

### Response

Below is an example response to the request above. The key components for us right now are the:
- Status code, **200**
- Status phrase, **OK**
- Content type, **text/html**
- The "bunch of HTML"

```
HTTP/1.1 200 OK
Content-Type: text/html
Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
Date: Mon, 22 Sep 2014 19:19:57 GMT
Content-Length: 21
Connection: Keep-Alive

# then a bunch of HTML
```

When the server interprets the request, it constructs a response to send back. The status information in the response immediately tells the requestor what type of response this is. Common status codes that you've seen before are:

- 200 OK
- 404 Not Found
- 403 Forbidden
- 500 Internal Server Error

Oftentimes, the server's response also contains HTML. This is the HTML that will be displayed on the page when your browser renders the response. Even when there is a 404 Not Found error, the response often still contains HTML which will display this information to the user. One example, is GitHub's 404 page, which you've probably seen before.

## Protocols

How do clients and servers communicate? Protocols.
Hypertext Transfer Protocol (HTTP) functions as a request-response protocol.

A client sends a request and a server sends back an response. HTTP describes how that request and response are formatted. There are lots of different protocols that describe lots of different kinds of interactions. Common protocols utilized in networked or internet-based applications include HTTP and HTTPS (hypertext transfer protocol secured), IMAP, FTP, SSH, SMTP, LDAP, DHCP, NFS, and more.

All of these are, at the end of the day, text sent over the network. A suite of technologies take this text, carry it to the intended destination, and make sense of it. __The protocol is the definition of how the client and server understand the information they've received.__ Most protocols serve a single purpose--displaying web pages (HTTP), sending an email (SMTP), transmitting a file (FTP), etc.

# What Is A Web Server?
<https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server>

## Web Server  

- Stores web server software
- Stores a website's component files
    - HTML, CSS, images, JavaScript files
- Is connected to the internet
- Supports physical data interchange with other devices connected to the web

On the software side, a web server:
- Includes several parts that control how web users access hosted files (at minimum: HTTP server)

HTTP Server:
- A piece of software that understands URLS (web addresses) and HTTP (the protocol your browser uses to view webpages)
- Minimum web server
- It can be accessed through the domain names of the websites it stores
- It delivers their content to the end-user's device
