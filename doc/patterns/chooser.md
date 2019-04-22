---
layout: default
title: Chooser
parent: Patterns
nav_order: 3
permalink: /patterns/chooser
---
# Chooser Pattern

Chooser is a hypermedia control that presents one or more choices for Clients to select from. A [Chooser](#chooser-resource) has two types that determine how many selections are possible. The types are patterned after HTML's selection `<input>` formats. The  `radio` type accepts a single selection. The `checks` type can accept multiple choices.

A Client examines the [Description](#description-resource) resource of each [Choice](#choice-resource) and makes their selection by triggering the Choice action resource. The result of the `POST` to choice will change the state of the Choice. If the Choice's `checked` property was `false`, it will be `true` after the action. If the Choice's `checked` property was `true` then it will be `false` after the action.

![](chooser/relations.svg){: .center-image}

The Choice's state is changed on the action, as is the the state of the Chooser overall. For a `radio` Chooser, selecting a Choice will "uncheck" another Choice if it had been previously selected. For a  `checks` Chooser, the overall chooser's state may change, depending on the business rules the Chooser is representing. For this reason, the `Location` response header from Choice actions will point to the Chooser resource so that the Client can refetch the overall Chooser state again.

![](chooser/interactions.svg){: .center-image}

## Chooser Resource

`Profile: <http://level3.rest/patterns/chooser#chooser-resource>`

The Choice resource presents either the [Info](../profiles/info.md) or [Nexus](../profiles/nexus.md) profile. It has the following state:

| Property | Purpose                                                      |
| -------- | ------------------------------------------------------------ |
| `type`   | `radio` for single selections, `checks` for 0 or more selections |

If the Chooser resource presents the [Nexus](../profiles/nexus.md) profile then it can be deleted with a `DELETE` operation. The Choice resources will be deleted as well. The Description resources may not be part of the domain, and if they are not, then they will not be deleted.

### choice

```
rel="http://level3.rest/patterns/chooser#choice"
```

A Chooser resource will have 0 or more `choice` links pointing to [Choice](#choice-resource) resources in it's list. The ordering of the links is intentional, meaning they should be considered the presentation order of the choices. The HTTP specification requires header order to be maintained so Clients can expect consistent link order.

## Choice Resource

`Profile: <http://level3.rest/patterns/chooser#choice-resource>`

The Choice resource presents [Action](../profiles/action.md) profile. It has the following state:

| Property  | Purpose                                                      |
| --------- | ------------------------------------------------------------ |
| `checked` | Indicates the selected state of the choice with `true` or `false` |

### choice-for

```
rel="http://level3.rest/patterns/chooser#choice-for"
```

This link points to the [Chooser](#chooser-resource) this Choice is part of.

### description

```
rel="http://level3.rest/patterns/chooser#description"
```

This link points to a [Description](#description-resource) that describes this Choice. This relation is similar to the registered IANA relation "describedby".

## Description Resource

Describes the [Choice](#choice-resource). It's profile is undefined as it could point to any resource in any domain. As an example, the Chooser may be an address selector, so this Description resource may be a link to an entry in an address list. Because of this, the Description resource has no choice-specific links or profile. It is unaware that it participates in a Chooser pattern.

## Specifications

HTML 5.2: [Input Element](https://www.w3.org/TR/html52/sec-forms.html#the-input-element)

- Checkbox: [section 4.10.5.1.15](https://www.w3.org/TR/html52/sec-forms.html#checkbox-state-typecheckbox)
- Radio Button: [section 4.10.5.1.16](https://www.w3.org/TR/html52/sec-forms.html#radio-button-state-typeradio)

HTTP/1.1 Message Syntax and Routing: [RFC 7230](https://tools.ietf.org/html/rfc7230)

- Header Field Order: [section 3.2.2](https://tools.ietf.org/html/rfc7230#section-3.2.2)

Protocol for Web Description Resources: [POWDER](https://www.w3.org/TR/powder-dr/)

- “describedby”: [Appendix D](https://www.w3.org/TR/powder-dr/#appD)

{% include footer.html %}