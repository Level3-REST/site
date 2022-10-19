---
layout: default
title: Chooser
description: Control pattern for selecting one or more choices, like a dropdown, a radio button or a checkbox.
parent: Patterns
nav_order: 6
permalink: /patterns/chooser
---
# Chooser Pattern

Chooser is a hypermedia control that presents one or more choices for clients to select. A Chooser has two types that determine how many selections are possible. The types are patterned after HTML’s selection `<input>` formats. The [Radio](#radio-chooser-resource) type accepts a single selection. The [Multi](#multi-chooser-resource) type can accept multiple choices.

A client examines the [Description](#description-resource) resource of each [Choice](#choice-resource) and makes their selection by triggering the Choice’s Action resource. The result of this `POST` changes the state of the Choice, depending on the type of chooser. The client can determine the chooser type by looking at the `Profile` header.

The list of choices in the Link header list maintains the application’s desired ordering so choice ordering does not change during selection actions.

![](chooser/relations.svg){: .center-image}

The Choice’s state is changed on the action, as is the state of the Chooser overall. For a `radio` chooser, selecting a choice deselects a previously-selected choice. For a `multi` chooser, the overall chooser’s state may change, depending on the business rules the chooser is representing. For this reason, the `Location` response header from choice actions points to the Chooser resource so that the client can fetch the overall chooser state again.

This behavior is consistent with how UI elements like radio button groups, dropdown menus, and checkboxes operate in a user experience. Clients can associate `POST` requests directly to the choice elements and trigger them from user events.

![](chooser/interactions.svg){: .center-image}

## Radio Chooser Resource

```
Profile: <https://level3.rest/patterns/chooser#radio-chooser-resource>
```

The Radio Chooser resource presents either the [Info](../profiles/info.md) or [Nexus](../profiles/nexus.md) profile. A Chooser resource has 0 or more `choice/chosen` links pointing to [Choice](#choice-resource) resources in its list. The ordering of the links is intentional, meaning they should be considered the presentation order of the choices. The HTTP specifications require [header order](https://tools.ietf.org/html/rfc7230#section-3.2.2) to be maintained so clients can expect consistent link order.

If the Chooser resource presents the [Nexus](../profiles/nexus.md) profile, then it can be deleted with a `DELETE` operation. The Choice resources are deleted as well. The Description resources may not be part of the domain, and if they are not, then they are not deleted.

## Multi Chooser Resource

```
Profile: <https://level3.rest/patterns/chooser#multi-chooser-resource>
```

Like the Radio Chooser, the Multi Chooser presents either the [Info](../profiles/info.md) or [Nexus](../profiles/nexus.md) profile.

If the Chooser resource presents the [Nexus](../profiles/nexus.md) profile, then it can be deleted with a `DELETE` operation. The Choice resources are deleted as well. The Description resources may not be part of the domain, and if they are not, then they are not deleted.

### *choice*

```
rel="https://level3.rest/patterns/chooser#choice"
```

Link to a possible [Choice](#choice-resource) for the Chooser. The state of the choice is unselected.

### *chosen*

```
rel="https://level3.rest/patterns/chooser#chosen"
```

Link to a selected [Choice](#choice-resource) for the Chooser.

## Choice Resource

```
Profile: <https://level3.rest/patterns/chooser#choice-resource>
```

The Choice resource presents the [Action](../profiles/action.md) profile. `POST`ing to this resource will trigger an appropriate state change in the Chooser.

### *choice-for*

```
rel="https://level3.rest/patterns/chooser#choice-for"
```

This link points to either a [Radio](#radio-chooser-resource) or [Multi](#multi-chooser-resource) Chooser to which this Choice belongs.

### *description*

```
rel="https://level3.rest/patterns/chooser#description"
```

This link points to a [Description](#description-resource) that describes this Choice. This relation is similar to the registered IANA relation `describedby`.

## Description Resource

Describes the [Choice](#choice-resource). Its profile is undefined as it could point to any resource in any domain. As an example, if the Chooser selects addresses, this Description resource links to an entry in an address list. Because of this, the Description resource has no choice-specific links or profile and is unaware that it participates in a Chooser pattern.

## Specifications

HTML 5.2: [Input Element](https://www.w3.org/TR/html52/sec-forms.html#the-input-element)

- Checkbox: [section 4.10.5.1.15](https://www.w3.org/TR/html52/sec-forms.html#checkbox-state-typecheckbox)
- Radio Button: [section 4.10.5.1.16](https://www.w3.org/TR/html52/sec-forms.html#radio-button-state-typeradio)

HTTP/1.1 Message Syntax and Routing: [RFC 7230](https://tools.ietf.org/html/rfc7230)

- Header Field Order: [section 3.2.2](https://tools.ietf.org/html/rfc7230#section-3.2.2)

Protocol for Web Description Resources: [POWDER](https://www.w3.org/TR/powder-dr/)

- The `describedby` Link Relation Type: [Appendix D](https://www.w3.org/TR/powder-dr/#appD)

{% include footer.html %}
