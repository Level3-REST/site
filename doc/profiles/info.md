---
layout: default
title: Info
parent: Profiles
nav_order: 3
permalink: /profiles/info
---
# Info

##### `Profile: <http://level3.rest/profiles/info>`

An Info resource profile provides read-only information. A Client does not edit the data in an Info resource, nor does a Client `DELETE` an Info resource. Info resources can be used to present calculated state about another resource, like tour dates for a concert, or details of past events like an purchasable item's price or a city's historical temperature. If the related resource changes, the Info resource will likely change as well. Similarly if the related resource is deleted, the Info resource will be deleted. 

Info resources often take the place of nested data objects in non-hypermedia APIs. They exist as separate resources for easier delivery and management. The Info’s data may be sourced from a separate service or data store, and thus can be expensive to produce. The client can decide to fetch this related information if they want, or choose not to if it is unnecessary. Or, they may want to refetch the Info resource more often than the related resource if the Info resource’s data changes more often. For instance, a stock’s current market price changes rapidly, but the stock itself does not change. The Client can refetch the price Info resource without refetching the stock resource.

### Discovery

The Info profile presents the required `Profile` and `Allow` headers.

![](info/discovery.svg){: .center-image}

### Fetch Info

A Client can fetch the Info’s data with a GET request. The Info’s data will be in the payload. If the Info is related to another resource the `Link` header will contain a link to the related resource.

![](info/fetch.svg){: .center-image}

# Mixins

## Entity Mixin

Info resources, especially those that present dynamic information, benefit from the Entity Profile’s validation headers. These headers enable Entity's [Cache-Aware Fetch](entity.md#cache-aware-fetch) flow.

## Specifications

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- 200 OK: [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)

{% include footer.html %}