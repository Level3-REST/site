---
layout: default
title: List
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
parent: Patterns
has_children: true
has_toc: false
nav_order: 1
permalink: /patterns/list
---
# List Pattern

Lists are a common, central component in most APIs. A Level 3 list is an [ordered list of entries](https://en.wikipedia.org/wiki/List_(abstract_data_type)), rather than an unordered collection. The [HTTP spec](https://tools.ietf.org/html/rfc7230#section-3.2.2) is clear that multiple header values are considered sequences and their presentation order must be maintained. Lists take advantage of this requirement to present entries as an ordered list.

![](list/relations.svg){: .center-image}

The List pattern has an [Editable List](list/editable.md) extension that provides capabilities to add entries to the list and empty the list.

##### List Entry Domain Considerations

List entries may belong to the list's domain, or they may exist in a different domain. An example of list and entries in the same domain is a task list. Task list entries belong to the same domain as the task list itself and can support editing capabilities. When a client deletes a task, it is removed from the system. When a client deletes the list, all the tasks are deleted as well.

An example of external domain entries is a search results list. The entries in the list are links to resources in another domain, like a product catalogue or content database. The list is [filterable](filter.md), [sortable](sort.md) and [pageable](page.md), but those resources do not know that they participate in a list and do not bear the [Entry](#entry-resource) resource profile and [`list`](#list) link.

A List resource may want to offer editing capabilities, so it creates entries that link to resources in an external domain. The list has full editability without affecting the other domain's resources. The client can [add entries](list/editable#add-entry) to the list and remove entries with a `DELETE` operation.

For example, consider a product wish list. A wish list entry would reference a product resource via a linked relation, yet the entry resource itself is part of the wish list domain. This wish list entry can be deleted, modified, or otherwise manipulated as part of the wish list without affecting the product itself.

## List Resource

`Profile: <http://level3.rest/patterns/list#list-resource>`

The List resource presents either the [Info](../profiles/info.md) or [Nexus](../profiles/nexus.md) profile.

| Property | Purpose                            |
| -------- | ---------------------------------- |
| `count`  | The number of Entries in the list. |

If the List resource presents the [Nexus](../profiles/nexus.md) profile, then it can be deleted with a `DELETE` operation. The entries in the list are deleted as well if they are part of the same domain. See [List Entry Domain Considerations](#list-entry-domain-considerations) for details.

### list-entry

```
rel="http://level3.rest/patterns/list#list-entry"
```

A [List](#list-resource) resource has 0 or more `list-entry` links pointing to [Entry](#entry-resource) resources in its list. The client should consider the link order to be the current order of the list.

## Entry Resource

`Profile: <http://level3.rest/patterns/list#entry-resource>`

An Entry resource has no required profile. If the Entry's profile supports the `DELETE` operation, a client can remove the entry from the list by deleting the entry.

### *list*

```
rel="http://level3.rest/patterns/list#list"
```

The `list` link points to the [List](#list-resource) to which the entry is a member.

This link does not appear if the entry is not part of the List’s domain. See [List Entry Domain Considerations](#list-entry-domain-considerations) for details.

## Specifications

HTTP/1.1 Message Syntax and Routing: [RFC 7230](https://tools.ietf.org/html/rfc7230)

- Header Field Order: [section 3.2.2](https://tools.ietf.org/html/rfc7230#section-3.2.2)

{% include footer.html %}