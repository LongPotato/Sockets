#Web Server and Browser

A simple command line web server that receives and respond to GET & POST http requests and a browser client to issue those requests.

###Demo:

On one tab of terminal run `server.rb`

On the other tab run `browser.rb`

* GET request: The browser will send a request to the server to display the 'index.html' file. The server will respond with the file and a coresponding status code.

* POST request: The browser will send a request to the server to update the 'thanks.html' file with user input. The server will respond with the updated file and a coresponding status code.

###Sample Output:

```
Enter your request [GET, POST]? get
<html>
  <body>
    <h1>Welcome to My Home Page</h1>
  </body>
</html>
```

```
Enter your request [GET, POST]? Post
What is your name?
Potato
What is your email?
Potato@Vegettable.com
<html>
  <body>
    <h1>Thanks for Posting!</h1>
    <h2>Here's what we got from you:</h2>
    <ul>
      <li>Name: Potato</li><li>e-mail: Potato@Vegettable.com</li>
    </ul>
  </body>
</html>
```


