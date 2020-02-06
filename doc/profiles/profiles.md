---
layout: default
title: Profiles
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
nav_order: 3
has_children: true
has_toc: false
permalink: /profiles
---
# Profiles

A profile is a client-centric interaction definition that gives an API client information on how to use a resource. The HTTP `Profile` header declares the Level 3 profiles that a resource supports. The profiles link to documentation describing the profile’s interaction model and semantics. 

### Mixins
Resource implementations can support multiple Level 3 profiles in a single resource. Each profile definition encourages implementations to support related mixin profiles. For example, the [Content profile](content.md) recommends supporting the [Preflight profile](preflight.md) to provide a better user upload experience. These mixin profiles are defined to be used in conjunction with other profiles to improve their capabilities but do not make sense as standalone resource profiles.

### Diagram Headers

The profile definitions contain multiple diagrams that show the interactions between a client and the resource. Each definition contains a “Discovery” section which declares the headers it returns with all operation responses. For clarity, all subsequent diagrams do not repeat these headers unless they are relevant to the discussion. In practice, a client can expect to see the full set of headers in every operation.

HTTP has additional headers and status codes to represent authorization, content-negotiation and other concerns. An API may respond with these to inform the client of its interaction requirements. Level 3 profiles do not describe these universally, but a client can expect to encounter them and operate accordingly.

## Profile Listing

- Structure and Information
  - [Home](home.md)
  - [Nexus](nexus.md)
  - [Info](info.md)
  - [Data](data.md)
  - [Content](content.md)
  - [Alias](alias.md)
- Controls
  - [Action](action.md)
  - [Form](form.md)
  - [Upload](upload.md)
- [Mixins](mixins.md)
  - [Entity](entity.md)
  - [Preflight](preflight.md)
  - [Representation](representation.md)
  - [Async](async.md)

## Specifications

See [WebDAV’s `Profile` header](https://www.greenbytes.de/tech/webdav/draft-nottingham-http-link-header-00.html#rfc.section.4) for details on the inspiration of Level 3’s `Profile` header.

See [RFC 6906](https://tools.ietf.org/html/rfc6906) for an explanation of the profile concept. 

{% include footer.html %}
