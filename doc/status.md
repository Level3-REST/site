---
layout: default
title: Status Codes
description: Reusable, Client-Centric Hypermedia Patterns for Any REST API
nav_order: 5
permalink: /status_codes
---
## HTTP Response Status Codes

HTTP response status codes are numerous, and only a few apply to API interactions. This section details relevant HTTP status codes to API consumers and the [Profiles](profiles/profiles.md) that specify their use. The status codes are broken into two sections—[Processing and Success Codes](#processing-and-success-codes) and [Client Failure Codes](#client-failure-codes).

### Processing and Success Codes

| Status Code              | Meaning                                                      | Profiles                                                     | Source                                                       |
| ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `100 Continue`           | The client can send a full request given the headers provided in the first, headers-only request. Used in “look before you leap” operations with large, expensive client payloads. | [Preflight](profiles/preflight.md)                           | RFC 7231, [section 6.2.1](https://tools.ietf.org/html/rfc7231#section-6.2.1) |
| `200 OK`                 | The request was processed successfully, and the body contains content for the client. A typical response for `HEAD` and `GET` operations but used with other operations, such as resources that support the [Representation](profiles/representation.md) profile. | [Content](profiles/content.md), [Data](profiles/data.md), [Form](profiles/form.md), [Info](profiles/info.md), [Nexus](profiles/nexus.md),   [Representation](profiles/representation.md) | RFC 7231, [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1) |
| `201 Created`            | Creation request was processed successfully. `201` is the usual response to a `POST` operation. In Level 3 REST, the body contains no content. A resource may offer the [Representation](profiles/representation.md) profile to give the client the ability to return content with the response. | [Form](profiles/form.md), [Upload](profiles/upload.md)       | RFC 7231, [section 6.3.2](https://tools.ietf.org/html/rfc7231#section-6.3.2) |
| `202 Accepted`           | A state modification/creation operation (`PUT`, `POST`, `PATCH` or `DELETE`) has been accepted for processing but is not complete. The body contains no content. | [Async](profiles/async.md)                                   | RFC 7231, [section 6.3.3](https://tools.ietf.org/html/rfc7231#section-6.3.3) |
| `204 No Content`         | The request was processed successfully, but the body contains no content. A resource may offer the [Representation](profiles/representation.md) profile to give the client the ability to return content with the response. | [Action](profiles/action.md), [Form](profiles/form.md), [Representation](profiles/representation.md), [Root](profiles/root.md) | RFC 7231, [section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5) |
| `206 Partial Content`    | The request contains a portion of the full content of the resource. It is used in content download responses. | [Content](profiles/content.md)                               | RFC 7233, [section 4.1](https://tools.ietf.org/html/rfc7233#section-4.1) |
| `307 Temporary Redirect` | The client should retry their request at the URL found in the `Location` header. The new location is temporary so clients should re-request at the original URL to ensure they have the latest URL. | [Alias](profiles/alias.md)                                   | RFC 7231, [section 6.4.7](https://tools.ietf.org/html/rfc7231#section-6.4.7) |
| `308 Permanent Redirect` | The client should retry their request at the URL found in the `Location` header. The new location is permanent so clients can replace their use of the original URL with the new URL. Often used to migrate API endpoints without breaking older clients. | [Alias](profiles/alias.md)                                   | [RFC 7538](https://tools.ietf.org/html/rfc7538)              |

### Client Failure Codes

Client requests are rejected for various reasons, and the client may be able to attempt their operation again with a corrected request.

| Status Code                | Meaning                                                      | Profiles                                                     | Source                                                       |
| -------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `400 Bad Request`          | Incorrect message formatting.                                | [Content](profiles/content.md), [Data](profiles/data.md), [Form](profiles/form.md), [Upload](profiles/upload.md) | RFC 7231, [section 6.5.1](https://tools.ietf.org/html/rfc7231#section-6.5.1) |
| `422 Unprocessable Entity` | Message format is correct, but the data presents unknown or incorrect semantics. The resource does not understand the message. | [Data](profiles/data.md), [Form](profiles/form.md)           | RFC 4918, [section 11.2](https://tools.ietf.org/html/rfc4918#section-11.2) |
| `409 Conflict`             | Business rule failure. For instance, in a hotel API, a client cannot book a room that is not available. | [Action](profiles/action.md), [Data](profiles/data.md), [Form](profiles/form.md) | RFC 7231, [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8) |

