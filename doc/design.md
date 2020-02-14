---
layout: default
title: Design
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
nav_order: 2
permalink: /design
---
# Level 3 Design

Software designs communicate their architectural qualities and the technical constraints they work within to support these qualities. This pairing of qualities and constraints is what enables the components of the design to work together to build software that scales to meet the complexity and challenges designers face over time. Level 3 APIs deliver their capabilities consistently in both small-scale applications and large, organic networks of services driven by many teams across large organizations.

Hypermedia _linking_ is the key to a successful Level 3 API. Links bind resources together and give them relationships to each other. These relationships help the client understand how an API works and how it connects to other APIs in the ecosystem. The client learns about and consumes an API through the links rather than extensive documentation. They “follow their nose” and discover the possibilities an API provides them.

## Architectural Qualities

Links bring four architectural qualities to API design: *Discoverability, Contextuality, Extensibility* and *Stability.*

### Discoverability

First and foremost, links deliver *API Discoverability.* Links give the consumer pathways through the resources and teaches them where to find their capabilities. Links contextually knit the overall API together into a coherent relational graph that can be followed as-needed for different application journeys. Level 3 does not rely on an external schema or document to act as its map; the map is the API itself.

### Contextuality

Links not only provide discoverability, but they also provide *API Contextuality.* When a link is visible in a resource, the client can assume it is contextually relevant and can follow it immediately. The client does not have to parse the link text or construct a URL string from other data. Links are ready-made for use. Conversely, the absence of a link can indicate unsuitability in the context of the current resource. If a link makes no sense in the current context, then the API will leave it out.

### Extensibility

Linking provides *API Extensibility.* As a designer builds an API, they leave things out for reasons of necessity or undiscovered requirements. When a new requirement comes in for the API to support, it is usually simpler to create a new resource and link it to existing resources rather than grow existing resources with new data values.

### Stability

Finally, links lead to *API Stability* as old clients do not need to change their use of the API when a new link appears on a resource. If one follows the principle of never changing existing fields, but only adding fields and new linked resources, a client would never have to be upgraded to support these changes. A truly versionless API is achievable from linking.

## Resource Profile Constraints

Level 3 resource profiles operate inside a set of universal constraints that work within the HTTP specifications. These constraints support the Level 3 architectural qualities across an entire API. One may find some of them restrictive given other API practices in regular use, but Level 3’s constraints come from experience and help both the API designer and client alike.

### Always Respond to `HEAD` and `GET`

The headers contain information a client needs to understand and operate Level 3 resources. The `Profile` header identifies the profiles the resource supports. The `Link` header provides relevant, pre-computed URLs to follow. A consumer who encounters an unknown URL is free to `HEAD` that URL to learn about it.

Similarly, when a client requests a resource representation with `GET`, the resource provides a 2xx response. The resource may have no content and vend only headers for `GET`, but it accepts the request. Using `GET` is the most natural discovery mechanism for client developers and they use it to learn about a resource.

This requirement traces to [RFC 7231](https://tools.ietf.org/html/rfc7231#section-4.1) which states that servers are required to support `GET` and `HEAD`.

### Send `Allow` Header with `HEAD` and `GET` Responses

The HTTP specs do not explicitly state when `Allow` should be returned, and in practice, servers return it in the `OPTIONS` response. Unfortunately, clients must then make an extra call to learn what operations a resource allows. Instead, Level 3 APIs deliver `Allow` headers with `HEAD` and `GET` responses so the client learns this vital information with their discovery calls.

### Provide `Link` Headers

Links are the connective state that binds a Level 3 API together. They are available to the client in a consistent way that is independent of the response body’s media type. The consumer does not have to fully understand the media type to discover the relationships a resource possesses. Link headers deliver this relationship data in a way that meets this constraint as well as the [Disjoin Design from Content-Type](#disjoin-design-from-content-type) constraint.

Link headers follow the [Web Linking](https://tools.ietf.org/html/rfc8288) specification. When constructing a link, one can use a [registered relationship name](https://www.iana.org/assignments/link-relations/link-relations.xhtml) like “next” or “about” or one can use the extension model with an HTTP address for the `rel` name. This address points to a human-readable description of the relationship. A Level 3 API often uses the extension model to precisely define the relationship, or to disambiguate between two links that could use the same IANA `rel` name but need to differentiate themselves.

[Some concern exists](https://maxchadwick.xyz/blog/http-response-header-size-limits) that responses containing a large number of headers may breach their server’s limits on overall response header size (generally 8k). APIs should address this particular constraint by limiting the number of Links a resource may have. For instance, [List](patterns/list.md) resources should use [pagination](patterns/page.md) to control the number of items they present rather than listing out hundreds of item links. A client may not have the capability of processing hundreds of links and needs to consume digestible sets.

HTTP/2’s [header compression](https://http2.github.io/http2-spec/compression.html) and relaxation on header sizes eliminate this concern. Not all REST clients and servers support HTTP/2 yet, but the [list is growing](https://github.com/http2/http2-spec/wiki/Implementations). Nonetheless, response header size in HTTP/1.1 services remains a concern for the near future.

### Links are Ephemeral

The links between resources are not guaranteed to be present on every request and resource instance, even though a pattern may specify them. A link to another resource may not make sense given the state of the resource, so a client should always test for link existence at runtime and gracefully react when a link is absent. Links are the engine of application state, and they must reflect the system’s state with absence as well as presence.

### Backtrace to Root

Every resource is traceable back to the root resource of the API. The root is the “home page” of an API, and the first place clients visit when learning about an API. Every resource should be eventually [discoverable](#discoverability) from the root resource by following links. Naturally, other considerations like access rights and availability may restrict a consumer’s actual navigation, but the design of Level 3 API shows that every resource traces back to the root resource by reverse-navigating the links from every leaf resource.

### URL Templates are not Affordances

A Level 3 resource never requires a client to construct a URL string, be it from a URL template or other ad-hoc mechanism. A URL is an address, like a memory location, that should be entirely opaque to a Level 3 consumer.

URL templates put a significant burden on the client as they must both understand the template and know where to source and encode the parameters to insert into the template. Instead, Level 3 API designers create many productive search, lookup and editing experiences for their clients using the Level 3 [Patterns](patterns/patterns.md). They do not need to use URL templating as a shortcut. Any related resource URL is found in the links, precomputed for direct use.

This constraint also supports [API Stability](#stability) because it frees the API from having to support URLs as direct access points. The designer can change the shape of the URL, or substitute types in the URL’s segments as needed without breaking consumers. Server-supplied reified links are the stabilizing force in a Level 3 API.

### Identifier Data Belongs in the URL

One valuable benefit from [rejecting URL templates](#url-templates-are-not-affordances) is that representations do not have to contain identifier data. A client does not need system identifier values to construct URLs, so the data objects do not have to provide them. This constraint reduces payload size and information clutter. The client can interpret the representations as domain information exclusively.

This constraint does not mean that representations should omit all identifier-like data. Domains often include business identifiers that are useful to the API’s consumer. For instance, an Account ID can be found in representations because other non-API situations like customer service conversations or bill payments require the Account ID. The use cases for the API should guide the designer as to when a business identifier belongs in a representation.

### Disjoin Design From `Content-Type`

A Level 3 API works above the shape of the resource content itself and can be composed of multiple resources that vend different content types, like XML or various forms of JSON. Over the years, many content types have emerged for API purposes, and in a large organization one finds many of them employed across the ecosystem. A Level 3 API can work with all content types by bringing them together through links.

### Change Only One Domain’s State

Links give the client an impression of a combined whole from multiple resources. The client must be comfortable changing the state of a resource through a modification operation without unduly modifying the state of a related resource unless that related state change is a natural consequence of the first state change. The [Patterns](patterns/patterns.md) discuss how this constraint affects their interactions.

{% include footer.html %}
