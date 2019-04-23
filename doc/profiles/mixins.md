---
layout: default
title: Mixins
parent: Profiles
nav_order: 10
has_children: true
permalink: /profiles/mixins
---
# Mixin Profiles

Mixin profiles add behaviour and capabilities to other profiles. A resource offers additional capabilities to clients by adding additional `Profile` headers indicating the presence of a mixin. A client uses mixin profiles to interpret the responses from a resource as well as create requests that utilize the mixin's capabilities.
Level 3 profiles specify their possible mixins in a Mixin section. This section teaches a client how to interact with the profile’s mixins in the context of the resource.

{% include footer.html %}