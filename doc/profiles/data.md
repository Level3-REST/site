---
layout: default
title: Data
parent: Profiles
nav_order: 4
permalink: /profiles/data
---
# Data

##### `Profile: <http://level3.rest/profiles/data>`

A Data resource represents a [first-class](https://en.wikipedia.org/wiki/First-class_citizen) data object in the world. It’s properties are not computed from other resources, as are [Info](info.md) resources, but are directly created by a system actor. A Data resource is intended to be editable by the Client. It can offer the modification methods `PUT` and `PATCH`, and it can also offer `DELETE`. A Data resource will also have business validation rules on the server to ensure data correctness.

### Discovery

The Data profile provides it's `Profile` and `Allow` headers. If the resource supports `PATCH` operations, it will include the `Accept-Patch` header with a list of acceptable patch media types. The client will need to understand these formats in order to construct a patch document to submit with a modification request. Some possible patch media types include [application/json-patch+json](https://tools.ietf.org/html/rfc6902), [application/merge-patch+json](https://tools.ietf.org/html/rfc7386), [application/xml-patch+xml](https://tools.ietf.org/html/rfc7351) or [application/patch-ops-error+xml](https://tools.ietf.org/html/rfc5261).

![](data/discovery.svg){: .center-image}

##### Schema Discovery

A data resource is encourage to provide a data schema to help the client update the resource state. HTTP has no response headers that would point to the data representation’s schema, but the data resource could respond to schema `Content-Type` requests such as [`application/ld+json`](https://json-ld.org), [`application/schema+json`](https://json-schema.org/latest/json-schema-core.html), or [`application/xml-dtd`](https://www.w3.org/2006/02/son-of-3023/draft-murata-kohn-lilley-xml-04.html) by returning schema documents. XML representations that use [XML Schema](https://www.w3.org/standards/xml/schema) should declare their `schemaLocation` properties as reachable URLs.

### Fetch Data

A client uses a  `GET` operation to fetch the Data’s representation.

![](data/fetch.svg){: .center-image}

### Replace Data

A Client can use the `PUT` operation to replace the data in a Data resource. A Data resource cannot be created by using `PUT` on a URL. If the resource has been deleted, it will not be recreated with a subsequent `PUT` operation.

##### Rejections

| Status Code                | Explanation                                                  |
| -------------------------- | ------------------------------------------------------------ |
| `400 Bad Request`          | The data's syntax is malformed                               |
| `422 Unprocessable Entity` | Values in the data are not accepted by business validation rules |

![](data/replace.svg){: .center-image}

### Modify Data

A Client can use the `PATCH` operation to modify portions of the data in a Data resource. The Client will use a patch format supported by the resource (as discovered in the `Accept-Patch` header) and construct a patch payload that is submitted with the `PATCH` operation. It should send a `Content-Type` header indicating the patch format. If the resource supports more than one patch media type it may require this header for disambiguation.

If the patch cannot be processed successfully, the resource will return `409 Conflict`. The client should re-fetch the data resource and rebuild the patch payload.

##### Rejections

| Status Code                | Explanation                                                  |
| -------------------------- | ------------------------------------------------------------ |
| `400 Bad Request`          | The patch's syntax is malformed                              |
| `409 Conflict `            | The patch cannot be applied to the resource, usually because the resource has changed since the patch was created |
| `422 Unprocessable Entity` | Patch can be applied successfully, but the updated values in the data are not accepted by business validation rules |
| `428 Precondition Failed`  | `Content-Type` request header required                       |

![](data/modify.svg){: .center-image}

# Mixins

## Entity Mixin

The [Entity](entity.md) mixin will give Data fetch cacheability and safe modification.

## Async Mixin

The [Async](async.md) mixin provides a Client with “fire-and-forget” data modifications.

## Representation Mixin
The [Representation](representation.md) mixin allows the Client to receive the modified data representation in the `PUT` or `PATCH` response.

## Specifications

HTTP Extensions for WebDAV: [RFC 4918](https://tools.ietf.org/html/rfc4918)

- 422 Unprocessable Entity: [section 11.2](https://tools.ietf.org/html/rfc4918#section-11.2)

XML Patch Operations Framework: [RFC 5261](https://tools.ietf.org/html/rfc5261)

PATCH Method for HTTP: [RFC 5789](https://tools.ietf.org/html/rfc5789)

- Accept-Patch: [section 4.1](https://tools.ietf.org/html/rfc5789#section-4.1)

Additional HTTP Status Codes: [RFC 6585](https://tools.ietf.org/html/rfc6585)

- 428 Precondition Required: [section 3](https://tools.ietf.org/html/rfc6585#section-3)

JSON Patch: [RFC 6902](https://tools.ietf.org/html/rfc6902)

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- 200 OK: [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)
- 204 No Content: [section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5)
- 409 Conflict: [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8)

XML Patch: [RFC 7351](https://tools.ietf.org/html/rfc7351)

JSON Merge Patch: [RFC 7386](https://tools.ietf.org/html/rfc7386)

{% include footer.html %}