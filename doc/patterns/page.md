---
layout: default
title: Page
description: Control pattern to navigate resource pagination.
parent: Patterns
has_children: true
has_toc: false
nav_order: 5
permalink: /patterns/page
---
# Page Pattern

The Page pattern adds pagination links to resources that have multiple elements. The [List](list.md) pattern often applies the Page pattern to give clients the ability to page through the list’s entries. However, another type of data-providing resource, like an [Info](../profiles/info.md) resource, may contain a large list of elements that can page its data with this pattern.

A [Paged](#paged-resource) resource has links to the previous and next pages. An API may add additional pagination links to specific page markers, like “first” and “last,” if their experience requires them.

![](page/relations.svg){: .center-image}

Clients manage Page size and placement in the list with either the [Offset Page](page/offset.md) pattern or the [Cursored Page](page/cursor.md) pattern. While not required, these patterns give the client control over how to formulate the pages. A Paged resource may choose to offer either pattern, depending on their data source and the desired user experience.

- [Offset Page](page/offset.md) pattern offers pagination with page size and page offset positioning. A client can position the page offset in the overall list and jump to any section of the Paged list.
- [Cursored Page](page/cursor.md) pattern paginates a list with a cursor and page size, but the client is unaware of their position in the whole list. 

## Paged Resource

```
Profile: <https://level3.rest/patterns/page#paged-resource>
```

The Paged resource can present any profile. The profile choice does not affect pagination.

### next

```
rel="https://level3.rest/patterns/page#next"
```

Points to another [Paged](#paged-resource) resource that contains the next page of elements. This relationship is similar in concept to IANA’s `next` link relation, which is defined by HTML 5 as the next document in a sequence.

### previous

```
rel="https://level3.rest/patterns/page#previous"
```

Points to another [Paged](#paged-resource) resource that contains the previous page of elements. This relationship is similar in concept to IANA’s `previous` link relation, which is defined by HTML 5 as the previous document in a sequence.

## Specifications

HTML 5 Link Types: [section 4.8.6](https://www.w3.org/TR/html5/links.html#sec-link-types)

- The `next` Link Relation Type: [section 4.8.6.13.1](https://www.w3.org/TR/html5/links.html#link-type-next)
- The `prev` Link Relation Type: [section 4.8.6.13.2](https://www.w3.org/TR/html5/links.html#link-type-prev)

{% include footer.html %}
