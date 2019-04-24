---
layout: default
title: Editable
parent: List
grand_parent: Patterns
nav_order: 1
permalink: /patterns/list/editable
---
# Editable List Pattern

Extends [List](../list.md) pattern by adding editing controls. An editable list pattern may not enable all editing controls. An editable list can choose to omit a control, like [Add Entry](#add-entry-resource), in favour of another approach that is more intuitive to the semantics of the list. 

This diagram includes the existing List resources [List](../list.md#list-resource) and [Entry](../list.md#entry-resource) and adds additional relationships to new resources to make it an editable list. The List resource's profiles includes both the [editable/list-resource](#list-resource) profile and the base [list-resource](../list.md#list-resource) profile.

The Entry resource in the diagram is unchanged from the base list's [Entry](../list.md#entry-resource) and has no extension profile.

![](editable/relations.svg){: .center-image}

## List Resource

`Profile: <http://level3.rest/patterns/list/editable#list-resource>`

The Editable List resource inherits the base [List](../list.md#list-resource) resource's profile requirements. If the List is a [Nexus](../../profiles/nexus.md) resource, it accepts a `DELETE` operation to remove the list.

### *empty-list*

```
rel="http://level3.rest/patterns/list/editable#empty-list"
```

Leads to an [Empty List](#empty-list-resource) action that empties the list when triggered.

### *add-entry*

```
rel="http://level3.rest/patterns/list/editable#add-entry"
```

Points to an Add Entry resource to add an entry to the list.

## Empty List Resource

`Profile: <http://level3.rest/patterns/list/editable#empty-list-resource>`

[Action](../../profiles/action.md) resource that empties the list. Triggering the action returns a `Location` pointing to the list.

### empties-list

```
rel="http://level3.rest/patterns/list/editable#empties-list"
```

Links to the list that is emptied by this action.

## Add Entry Resource

`Profile: <http://level3.rest/patterns/list/editable#add-entry-resource>`

Add Entry resource adds an entry to the list. The profile is undefined, but it is often a [Form](../../profiles/form.md) resource.

### adds-to-list

```
rel="http://level3.rest/patterns/list/editable#adds-to-list"
```

Links to the list into which the Add Entry resource adds entries.

{% include footer.html %}