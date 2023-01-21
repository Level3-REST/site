---
layout: default
title: Introduction
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
nav_order: 1
permalink: /
---
# Introduction

Front-end developers struggle with consuming REST APIs. Not surprisingly, API developers struggle to design and build those REST APIs. REST, as an architectural style, has not enjoyed clear design and build paths. When JSON-based APIs started replacing SOAP everyone felt like the way to build these interfaces would be pretty much like the rest of the web—HTTP specifications would guide the way for all.

Unfortunately, that is not how things have turned out. The HTTP specs are not especially helpful to the production or consumption of an API. HTTP is a document-oriented specification, geared towards pages and web sites. HTTP has evolved along with HTML, and the two have sympathetic conceptual models. APIs, though, need a state-oriented specification. An API presents state and affordances to manipulate state, which is not the same thing as document manipulation.

Level 3 REST provides clear guidelines on how to make HTTP’s specifications work for a state-oriented API. These guidelines take the form of [Profiles](profiles/profiles.md) and [Patterns](patterns/patterns.md), which are client-oriented expectations of how to interact with the resources in an API. APIs that offer these profiles can be built using many of the technology platforms that exist today, while clients can consume these profiles with existing HTTP client technologies. No special libraries or platforms are required for either side of a Level 3 REST API to find success.

Level 3 profiles and patterns are easy to understand by client and server-side developers. They solve real-world problems with consistency and agility. Resources that support them can be woven together into rich, discoverable experiences. A Level 3 API is easy to describe, straightforward to build and a joy to use.

##### “Level 3?”

The term “Level 3” refers to Leonard Richardson’s [Richardson Maturity Model](https://www.crummy.com/writing/speaking/2008-QCon/act3.html) of API styles. Therein he describes four levels of API maturity, from level 0 through 3. APIs mature through these levels by the nature of how well they utilize the HTTP protocol and deliver link relations between resources to share state and provide state change affordances. Level 3 APIs, as [described by Martin Fowler](https://martinfowler.com/articles/richardsonMaturityModel.html), deliver “The Glory of REST” to all participants.

### Level 3 Profiles and Patterns

A Level 3 API delivers [Profile resources](profiles/profiles.md) that work together to present repeatable interaction [Patterns](patterns/patterns.md). These resource patterns provide rich experiences that are consistent across the different domains in an API. When a client discovers the same profiles and patterns in a different part of the API, they can immediately interact with the new domain because the resource-interaction experiences are the same.

A client can only work with a single resource at a time, so the resource’s profile is their contextual workspace. That workspace contains links to other resources in the pattern and links to related resources across the ecosystem. The overall effect is a connected, easy-to-navigate graph of information and capabilities.

## Standing on the Shoulders of Standards

The Level 3 profiles and patterns utilize HTTP semantics as well as curated concepts from published specifications, selected books and real-world experience in Level 3 API construction. Much work was done to adhere to the specs to achieve broad applicability and technical success with the internet technology we employ today and are transitioning to, like [HTTP/2](https://http2.github.io/). The profiles and patterns contain references to these standards to support their design.

The reader is invited to post their thoughts, especially those that disagree with the content, on twitter. Specifications, while usually well-written, can be misinterpreted and misunderstood. Please make Level 3 better by identifying errata via my twitter handle [@MattBishopL3](https://twitter.com/MattBishopL3).

{% include footer.html %}
