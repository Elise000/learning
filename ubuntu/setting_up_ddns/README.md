# Setting Up Dynamic DNS
This note is about setting up a server locally to host for internet.
Mentioned here are general guidelines to get things work since it involves a
number of variables, such as router type, server host etc.

<br>
There are 3 stages of milestones you need to attain:

## 1st Milestone - Local Access
This involves setting up your router to port-forward or to have a virtual server
that route the incoming request to your local machine.

<br>
You'll need:

1. 2 computers (1 to view, 1 to host) with browser
2. Router admin access

<br>

Your goal is to ensure the viewer computer is able to view the host computer.

<br>

### Steps
#### 1) Access your router
Access to your router using your admin access.


<br>

#### 2) Go to Private Server / Port Forwarding
Head to a section commonly known as 'port forwarding'.

<br>

#### 3) Setup your Private Server if it's available in your router
If your router has a private server, go for it. The setup is very
straight-forward.

You''ll just need to add a new entry by:

1. Name of the server (name is as you want)
2. List the protocol (HTTP, UTP etc.)
3. Provide the IP Address of the host server.
4. Set the external port number (e.g: 80 for internet).

An example would be like the following:

![private-server](https://lh3.googleusercontent.com/-CmzSK8WrdHAmSWKeyLnI_l-WBm9hTzAukRtACX4cMh3rrpDFkTx9b2iNmtRCVx9JJY3jDuAUJOTMOLJ0OQ0iSjSrepjcujha6APVGinIVgboEnX_oqWcHz6lIEjD9Kk-xE2-PBQzs-bit5gf9ADpkBdYdD6USXrmhxTesY9AFs_pYozKyrMxdUVl93ds_mi-UwZ3lDUd_GS7pzSSHfDmQKgKpP5Ry25Kg8qGEFHByzA58ul8qEMMsXYwL7gFalB_hpoXINZkDoDjpavsz6WWCAutT6az9ijhGurXHtOGweXpeIqWbgz-cdZOwgcwZokHCtBYCyx-rv-FiNP2n17W05GpLVosL9IB3w81i8TaCBEZFGmQufIeHX74wJG6Dq1X_BBNtgygyFKKuYd7NSnOOqPPcoWYk8pPG4FtdCyTWL-bPFzHw4mFVCuoo84v7stA6pi9RUA4IbDEbVT4iAD26xHXEhNl_dyNnot6ZOG78xXhS6qCZKmLOeEvryQX47wgzuhioSDqfpgU8YP0k9S7dqiYv-7h3yhiK6XhatW-dEdq7ET5iBUHgo42rQRqYqF7R43fg=w1960-h1160-no)

<br>

#### 4) Set your local server to bind against the universal IP Address (0.0.0.0)

Example, on rails, use:

```
rails server -b 0.0.0.0
```

<br>

#### 5) Use your view computer to visit to host website
Test out the network access. You can do it in this sequence:

<br>

*i) Test out using your host machine's IP address and port number.*

Example URL: 
```
http://192.168.1.523:3000
```

> If the connection is refused, you'll need to check your host firewall or network settings.
> This means your host is still unable to expose your server correctly, locally.
> Else, proceed to next sequence.

<br>

*ii) If your router provides auto port routing like the one shown above, proceed to try without the port number*

Example URL:
```
http://192.168.1.523
```

> If the connection is refused, you'll need to check your router settings for private server.
> This means that your router couldn't route the server port number to port 80.
> Else, if everything is okay proceed to next Milestone.

<br><br>

## 2nd Milestone - Check Your External Connection
Now your goal is to access the host server using your public IP. If you plan to host the IP pemanently, you should request a static IP from your internet service provider.

### Steps
#### 1) Get your public IP address
You can get it from https://www.whatismyip.com/. This web provide you your public IP. Example:

![public-address](https://lh3.googleusercontent.com/dVvNEHKC7KPHYGq9HpvD6Hn8UI1LtoEEa0PfBjS-QAAAykLN2RQYI7VNkoPT-IIomcne7h1zAmI2hTQ-f_Zfai8zpJ_3u1YJXWh3ZyH5_MwnTeOJQCdORlnSYywGdRctriwHdne5tIrxDpl1pZ5G6uiqmlOQpp4EiaUcQdCalvqTtUlHby10zflUOLsOL43-fejpE41KzT0L_JQ8QLdJkSpCNAlUVrTCvuiLeMUQ_2fzmp9rhAbdX9Mf8TLQdgT8n-Jg3sxxloKs-iO7LaA2btvo8oksZhmi5sSdGFHFRQqj_UpOj9oqDwFStDFC9iR8RVexbecwxuZ6xN8yHsK6LO3RXG8Voq00ZFp5_22ThECMF3NRCpOCD9sE9T2zXwO9qe3gxbjF17HjH1URd-Kh8OY0o1hCFStZY2kTOrAem8LQiAG7-5-2ltnXXC3_BaYYIKDUOGxquPpjoT6sN4gUq9uavIlI1AFoBGuKZzw_lVqULCuLMwzkQLPBCzGVPgLh3bPYZVJsp8uh48JpnPIfjyMWbev7VopZD1zfp0cnZSSMzpkhwkkAVCzIoNdVdF0-KZrU2g=w2490-h1806-no)

This will give me ***203.106.XXX.XXX***.

<br>

#### 2) Access the hosting web using the public IP.
On the view computer, use the public IP to access the same website. Perform this in sequence:

<br>

*i) Test out using your the public IP address and port number.*

Example URL: 
```
http://203.106.XXX.XXX:3000
```

> If the connection is refused, you'll need to check your router settings or with your internet service provider.
> This means your host is still unable to expose your server correctly, over the internet.
> Else, proceed to next sequence.

<br>

*ii) If your router provides auto port routing like the one shown above, proceed to try without the port number*

Example URL:
```
http://203.106.XXX.XXX
```

> If the connection is refused, you'll need to check your router settings for private server.
> This means that your router couldn't route the server port number to port 80.
> Else, if everything is okay proceed to next Milestone.

<br><br>

## 3rd Milestone - Connect to a DNS
Now it's time to connect to a domain name.

<br>

### Steps
#### 1) Get a domain name
If you have your own domain name you can proceed to link it with the IP.

Alternatively, for education purposes, you can get your freeDNS from a number of service provider, like http://www.noip.com/. You can sign up and obtain a test DNS from here.

<br><br>

#### 2) Test your hosting through the domain name
On the view computer, use the domain name to access the same website. Perform this in sequence:

<br>

*i) Test out using your the domain name and port number.*

Example URL: 
```
http://whatever.testdns.org:3000
```

> If the connection is refused but accessible via public IP without port number, you'll need to check with the domain name provider.
>
> If the connection is not accessible via public IP without port number, something went wrong with your router's private server.
>
> Else, proceed to next sequence.

<br>

*ii) If your router provides auto port routing like the one shown above, proceed to try without the port number*

Example URL:
```
http://whatever.testdns.org
```

> If the connection is refused but accessible via public IP without port number, you'll need to check with the domain name provider.
>
> If the connection is not accessible via public IP without port number, something went wrong with your router's private server.
>
> Else, if everything is okay, congratuations! You have link a domain name to a local physical server.

<br><br>



# References
1. https://www.whatismyip.com/
2. http://stackoverflow.com/questions/29132719/rails-application-not-visible-to-local-network
