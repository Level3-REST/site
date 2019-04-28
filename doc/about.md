---
layout: default
title: About
nav_order: 5
permalink: /about
---

### About The Author

Few enjoy talking about themselves, but it would be unfair not to describe my experiences and how Level 3 REST came to be. I have been working in the REST API field since 2008 and in SOAP, XML-RPC and other internet-based API technologies ([IIOP](https://en.wikipedia.org/wiki/General_Inter-ORB_Protocol), anyone?) since the days of Compuserve and Netscape. I have spent countless hours and days struggling with building API servers, consuming APIs in clients and wishing this wasn’t all so damn hard.

In 2011 I was working at SAP Business Objects in a software research group when [Sal Visca](https://www.linkedin.com/in/salvisca/), CTO of [Elastic Path](https://www.elasticpath.com), asked me leave my comfort zone and join him to build an entirely new API for their commerce engine. They wanted to create an easy-to-use, extensible, modern API that would drive all kinds of touchpoints, from web sites to watches. I met the team and found their energy and enthusiasm impossible to resist.

For the next year we worked hard, mostly on a whiteboard, and then in code, to discover and create a HATEOAS API. We had developed reusable patterns along the way and built a coding framework that eased the process of building resources and links. We made it fast, fast enough to support enterprise-grade customers in their shopping experiences.

While our form of REST met our needs, when I looked around at the REST community at large, I felt that we were mostly alone. Many talked about hypermedia as the right way to build APIs, and some specs and API platforms delivered linking requirements and technology to bring them to life. Nonetheless, it seemed to me that no “fires” had started. People were still developing “level 2” APIs with few links between resources.

I concluded that REST needed an opinionated set of resources and patterns that gives API clients and developers a language above the HTTP protocol. We needed a way out of the genuinely tired arguments about the meaning of status codes and media types.

Level 3 REST is my offering to the REST community. I hope it will become a useful pattern language and help make REST fun again.

### Acknowledgements

I want to thank so many talented people who have been a part of discovering the concepts in Level 3 REST. First and foremost, my thanks go to the original “Shapi” team including [Ashley Thomas](https://www.linkedin.com/in/ashleydthomas), [Ivan Jensen](https://twitter.com/ivanjensen), [Mehran Heidarzadeh](https://twitter.com/mh8h), [Ronald Chen](https://twitter.com/pyrolistical), [Drewz Lau](https://twitter.com/drewzie) and the late, great Jeremy Skelton. I also want to thank the brilliant minds of [Sebastian Schulz](https://www.linkedin.com/in/sschulz-engineering/), [David Clark](https://www.linkedin.com/in/clarkdavid/) and [Deepak Azad](https://twitter.com/deepakazad) who shaped our more recent hypermedia design patterns in Elastic Path.

Special thanks go to [Mark Williams](https://twitter.com/MarkWilliams52) and [Harry Chemko](https://twitter.com/hchemko) who bet their company on hypermedia. They gave us space, time and funding to figure hypermedia out and make it great for Elastic Path.

{% include footer.html %}