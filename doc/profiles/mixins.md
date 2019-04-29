---
layout: default
title: Mixins
parent: Profiles
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
nav_order: 10
has_children: true
has_toc: false
permalink: /profiles/mixins
---
# Mixin Profiles

Mixin profiles add behaviour and capabilities to other profiles. A resource offers additional capabilities to clients by adding additional `Profile` headers indicating the presence of a mixin. A client uses mixin profiles to interpret the responses from a resource as well as create requests that utilize the mixin's capabilities.
Level 3 profiles specify their possible mixins in a Mixin section. This section teaches a client how to interact with the profile’s mixins in the context of the resource.

## Mixins Listing

- [Entity mixin](entity.md) provides cacheability and safe state change operations.
- [Preflight mixin](preflight.md) lets a client “look before they leap” with an expensive operation.
- [Representation mixin](representation.md) helps a client control the responses from a state change operation.
- [Async mixin](async.md) gives clients a way to send requests without blocking for them to complete.

{% include footer.html %}