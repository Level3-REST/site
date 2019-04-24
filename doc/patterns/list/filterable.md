---
layout: default
title: Filterable
parent: List
grand_parent: Patterns
nav_order: 3
permalink: /patterns/list/filterable
---
# Filterable List Pattern

Extends [List](../list.md) pattern by adding filtration affordances. A filtered list has a [Filter Info](#filter-info-resource) resource that describes the filter configuration. Clients can change the filter configuration with the [Filtration](#filtration-resource) resource. The entries in the list should share the filterable properties for the filtered list to make sense to the client.

![](filterable/relations.svg){: .center-image}

### Operands

Filter declarations use logical operands to describe how to filter the entries in a list by property values. String value comparisons should be case-insensitive if possible, though the resource implementation decides this rule based on the field's semantics. The resource's data types guide the applicability of the listed operands to filtered fields.

| Operand | Purpose                          |
| ------- | -------------------------------- |
| `eq`    | Equal                            |
| `ne`    | Not equal                        |
| `lt`    | Less than                        |
| `lte`   | Less then or equal               |
| `gt`    | Greater than                     |
| `gte`   | Greater than or equal            |
| `px`    | String prefix                    |
| `npx`   | Not this string prefix           |
| `sx`    | String suffix                    |
| `nsx`   | Not this string suffix           |
| `in`    | In a list of possible values     |
| `nin`   | Not in a list of possible values |

## List Resource

`Profile: <http://level3.rest/patterns/list/filterable#list-resource>`

The filterable List resource inherits the base [List](../list.md#list-resource) resource's profile requirements. The profile choice does not effect filtering options.

### filter-info

```
rel="http://level3.rest/patterns/list/filterable#filter-info"
```

Points to a [Filter Info](#filter-info-resource) resource that describes the configuration of the current list's entry filtering.

## Filter Info Resource

`Profile: <http://level3.rest/patterns/list/filterable#filter-info-resource>`

The Filter Info resource describes the filtering configuration used in the current List. The configuration representation consists of an array of filter declarations assigned to a top-level `filters` element.

A filtering declaration in the `filters` array has these properties:

| Property   | Purpose                                |
| ---------- | -------------------------------------- |
| `property` | The Entity property being filtered by. |
| `operand`  | The filtering operand.                 |
| `value`    | Filter value.                          |

Each filter declaration further filters the elements by that declaration. The array of declarations `AND`s together to create an element list that matches every filter. Consider this filters array:

```json
{ 
  "filters": [
    { "property": "age", "operand": "gte", "value": 30 }, 
    { "property": "team", "operand": "in", "value": ["Bruins", "Canucks"] }
  ]
}
```

The list contains entries filtered by `age` (>= 30) and a `team` of either "Bruins" or "Canucks."

The XML representation looks like this:

```xml
<filters>
  <filter property="age" operand="gte" value="30"/>
  <filter property="team" operand="in">
    <value>Bruins</value>
    <value>Canucks</value>
  </filter>
</filters>
```

### filter

```
rel="http://level3.rest/patterns/list/filterable#filter"
```

Points to a Filtration resource that can configure the entry filters of the list.

## Filtration Resource

`Profile: <http://level3.rest/patterns/list/filterable#filtration-resource>`

The Filtration resource affordances change the list's filtration configuration. It is a Form resource that starts with the current configuration in its schema representation, or its template object if the form does not use a schema. If only a subset of the Entry properties is filterable, then the Filtration resource should present a schema to help the client submit a successful filtration change.

The Form creates a filters array. This array has objects with these properties:

| Property   | Purpose                                |
| ---------- | -------------------------------------- |
| `property` | The Entity property being filtered by. |
| `operand`  | The filtering operand.                 |
| `value`    | Filter value.                          |

### filters-list

```
rel="http://level3.rest/patterns/list/filterable#filters-list"
```

Points to the List that this Filtration resource filters. The URL may not be the same after the Filtration resource's controls execute.

{% include footer.html %}