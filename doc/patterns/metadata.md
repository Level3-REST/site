---
layout: default
title: Content Metadata
parent: Patterns
nav_order: 4
permalink: /patterns/metadata
---
# Content Metadata Pattern

[Content profile](../profiles/content.md) resources are difficult to inspect because they contain metadata that is only discoverable after the content is downloaded to the Client. The Content Metdata pattern solves this by linking a [Content](#content-resource) resource to a [Metadata](#metadata) resource containing metadata describing the content. A Client can examine the metadata and then decide to download all the content.

If the Content resource changes, the metadata may change as well to reflect new metadata values. If the Content resource is deleted, the related Metadata resource will also be deleted.

Metadata's [Info](../profiles/info.md) profile means it cannot be edited or deleted directly. An API may wish to add user-editable resources like descriptions, tags or other information and link it to the Content resource. These additional resource relationships are outside the scope of this pattern.

![](metadata/relations.svg){: .center-image}

## Content Resource

`Profile: <http://level3.rest/patterns/metadata#content-resource>`

The Content resource presents the [Content profile](../profiles/content.md). It is the image, document or other content data described by the Metadata resource.

### metadata

```
rel="http://level3.rest/patterns/metadata#metadata"
```

The `metadata` link relation is similar to IANA's “[describedby](https://www.w3.org/TR/powder-dr/#appD)” link relation. It points to the Metadata resource that describes the Content Resource.

## Metadata Resource

`Profile: <http://level3.rest/patterns/metadata#metadata-resource>`

The Metadata resource presents the [Info profile](../profiles/info.md) and contains relevant details about the Content resource, depending on the type of content. Images can have metadata about the dimensions, resolution and color model. Documents may contain metadata about the page count and author. 

Metadata should be used in other API contexts like search results or directory listings as they provide usefiul information for the Client to select which Content resource they would like to interact with. The `content` link gives the Client navigability to the actual Content data should they choose to consume it.

### content

```
rel="http://level3.rest/patterns/metadata#content"
```

The `content` link relation is similar to IANA's “[describes](https://tools.ietf.org/html/rfc6892)” link relation. It points to the Content resource that Metadata describes.

## Specifications

Protocol for Web Description Resources: [POWDER](https://www.w3.org/TR/powder-dr/)

- “describedby”: [Appendix D](https://www.w3.org/TR/powder-dr/#appD)

The “describes” Link Relation Type: [RFC 6892](https://tools.ietf.org/html/rfc6892)

{% include footer.html %}