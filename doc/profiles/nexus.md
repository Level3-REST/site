---
layout: default
title: Nexus
parent: Profiles
nav_order: 2
permalink: /profiles/nexus
---
# Nexus

##### `Profile: <http://level3.rest/profiles/nexus>`

A Nexus resource is a central "meeting point" for related resources. It is often identified by a shared business identifier, like invoice number or a book's ISBN. A Nexus resource may have state information, but it is read-only and should reflect an overall business state. For instance, an order resource can have the states "open" or "closed". Related states are discovered via the links attached to the Nexus. "Shipping" details, "payment" info and other order-related states are related to the Nexus resource but are linked, not embedded, in the Nexus resource. 

A Nexus resource offers the `DELETE` operation which "removes" the Nexus resource instance from the system. Related states are also removed as a result of a successful delete.

### Discovery

The Nexus profile presents the required `Profile` and `Allow` headers.

![](nexus/discovery.svg){: .center-image}

### Fetch Nexus

A Client can fetch the Nexus' state with a `GET` request. The state information will be in the payload.

![](nexus/fetch.svg){: .center-image}

### Remove Nexus

Nexus resources, as central points of business context, may not actually be deleted by the underlying system. Subsequent calls to the removed Nexus can return `410 Gone` to indicate it did exist once but no longer. Alternately `DELETE` can be represented as a terminal state like 'deleted'. Related resources may not have been deleted so their state can be retrievable via the 'deleted' Nexus resource. In this case, the Nexus resource should not be normally revivable as it is gone.

![](nexus/remove.svg){: .center-image}

## Specifications

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- 200 OK: [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)
- 410 Gone: [section 6.5.9](https://tools.ietf.org/html/rfc7231#section-6.5.9)

{% include footer.html %}