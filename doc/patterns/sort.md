---
layout: default
title: Sort
description: Control pattern to manage list and tree sorting.
parent: Patterns
nav_order: 4
permalink: /patterns/sort
---
# Sort Pattern

The Sort pattern provides sorting affordances. It often complements List and Tree patterns but can also be used to sort any resource with sortable element aspects. The Sort pattern has a [Sort Info](#sort-info-resource) resource that describes the sorting configuration. Clients can change the sorting configuration with the [Sorter](#sorter-resource) resource. The elements in the resource should share the sortable properties for the [Sorted](#sorted-resource) resource to make sense to the client.

![](sort/relations.svg){: .center-image}

The client changes sort configuration by `POST`ing a new configuration form to the [Sorter](#sorter-resource) resource. Sorter returns the updated [Sorted](#sorted-resource) resource URL in its `Location` response header.

![](sort/interactions.svg){: .center-image}

## Sorted Resource

```
Profile: <https://level3.rest/patterns/sort#sorted-resource>
```

The Sorted resource can present any profile. The profile choice does not effect filtering options.

### sort-info

```
rel="https://level3.rest/patterns/sort#sort-info"
```

Points to a [Sort Info](#sort-info-resource) resource that describes the configuration of the [Sorted](#sorted-resource) resource’s element order.

## Sort Info Resource

```
Profile: <https://level3.rest/patterns/sort#sort-info>
```

The Sort Info resource describes the ordering configuration used in the [Sorted](#sorted-resource) resource. This configuration consists of an array of sorting declarations, which Sort Info’s representation assigns to a top-level `sort-order` element.

A sorting declaration in the `sort-order` array has these properties:

| Property    | Purpose                       |
| ----------- | ----------------------------- |
| `property`  | The property being sorted by. |
| `direction` | Either `ascend` or `descend`. |

Each additional sorting declaration sub-sorts the elements by that declaration. Consider this sort order array:

```json
{
  "sort-order": [
    { "property": "age", "direction": "descend" },
    { "property": "last-name", "direction": "ascend" }
  ]
}
```

The elements are sorted first by `age` (oldest first), and inside each age group, the elements are sorted by `last-name` in ascending order (alphabetical).

The XML representation looks like this:

```xml
<sort-order>
  <sort-by property="age" direction="descend"/>
  <sort-by property="last-name" direction="ascend"/>
</sort-order>
```

### sorter

```
rel="https://level3.rest/patterns/sort#sorter-resource"
```

Points to a [Sorter](#sorter-resource) resource that can configure the element order of the [Sorted](#sorted-resource) resource.

## Sorter Resource

```
Profile: <https://level3.rest/patterns/sort#sorter-resource>
```

The Sorter resource changes the [Sorted](#sorted-resource) resource’s sort configuration. It is a [Lookup](../profiles/lookup.md) resource that starts with the current configuration in its schema representation, or its template object if the lookup does not use a schema. If only a subset of the properties are sortable, then the Sorter resource should present a schema to help the client submit a successful sorting change.

A Sorter's content is the same as the [Sort Info](#sort-info-resource) content. Clients edit the configuration to reflect the desired sort configuration. When this new configuration is submitted to the Sorter resource, the lookup redirects to the newly-configured [Sorted](#sorted-resource) resource.

### sorts

```
rel="https://level3.rest/patterns/sort#sorts"
```

Points to the [Sorted](#sorted-resource) resource that this Sorter resource configures.

{% include footer.html %}
