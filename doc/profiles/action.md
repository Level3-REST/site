---
layout: default
title: Action
description: Execute an Action Without Data
parent: Profiles
nav_order: 7
permalink: /profiles/action
---
# Action Profile

```
Profile: <http://level3.rest/profiles/action>
```

An Action resource is a hypermedia control that triggers a state change. They act like buttons to execute an action on the server. Actions do not accept a payload; the URL contains all the Action’s identifying information.

### Discovery

The Action profile presents the required `Profile` and `Allow` headers.

![](action/discovery.svg){: .center-image}

### Trigger Action

Clients trigger an Action by `POST`ing to it. The resource responds with `204 No Content` and the `Location` header points to the state that was changed by the triggered action. The resource returns a `409 Conflict` status if the action cannot be completed because the system state will not accept it. 

![](action/trigger.svg){: .center-image}

# Mixins

## Representation Mixin

The [Representation profile](representation.md) mixin enables the client to receive the target representation in the Action response.

## Specifications

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- 204 No Content: [section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5)
- 409 Conflict: [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8)


{% include footer.html %}
