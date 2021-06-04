---
layout: default
title: Status Codes
description: HTTP status codes cross-referenced to Profiles
nav_order: 5
permalink: /status_codes
---
## HTTP Response Status Codes

HTTP response status codes are numerous, and only a few apply to API interactions. This section details relevant HTTP status codes to API consumers and the [Profiles](profiles/profiles.md) that specify their use. The status codes are broken into two sections—[Processing and Success Codes](#processing-and-success-codes) and [Client Failure Codes](#client-failure-codes).

### Processing and Success Codes

| Status Code              | Meaning                                                      | Profiles                                                     | Source                                                       |
| ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `100 Continue`           | The client can send a full request given the headers provided in the first, headers-only request. Used in “look before you leap” operations with large, expensive client payloads. | [Preflight](profiles/preflight.md)                           | RFC 7231, [section 6.2.1](https://tools.ietf.org/html/rfc7231#section-6.2.1) |
| `200 OK`                 | The request was processed successfully. All `HEAD` operations return this status code. | All profiles                                                 | RFC 7231, [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1) |
| `201 Created`            | Creation request was processed successfully. `201` is the usual response to a `POST` operation. In Level 3 REST, the body contains no content. A resource may offer the [Representation](profiles/representation.md) profile to give the client the ability to return content with the response. | [Form](profiles/form.md), [Upload](profiles/upload.md)       | RFC 7231, [section 6.3.2](https://tools.ietf.org/html/rfc7231#section-6.3.2) |
| `202 Accepted`           | A state modification/creation operation (`PUT`, `POST`, `PATCH` or `DELETE`) has been accepted for processing but is not complete. The body contains no content. | [Async](profiles/async.md)                                   | RFC 7231, [section 6.3.3](https://tools.ietf.org/html/rfc7231#section-6.3.3) |
| `204 No Content`         | The request was processed successfully, but the body contains no content. This status code is the normal result for `DELETE`, `PATCH` and `PUT` requests. A resource may offer the [Representation](profiles/representation.md) profile to give the client the ability to return content with the response. | [Form](profiles/form.md), [Home](profiles/home.md), [Nexus](profiles/nexus.md), [Representation](profiles/representation.md) | RFC 7231, [section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5) |
| `206 Partial Content`    | The request contains a portion of the full content of the resource. | [Content](profiles/content.md)                               | RFC 7233, [section 4.1](https://tools.ietf.org/html/rfc7233#section-4.1) |
| `303 See Other`          | The client should `GET` the URL found in the `Location` header. | [Action](profiles/action.md), [Lookup](profiles/lookup.md)   | RFC 7231, [section 6.4.4](https://tools.ietf.org/html/rfc7231#section-6.4.4) |
| `307 Temporary Redirect` | The client should retry their request at the URL found in the `Location` header. The new location is temporary so clients should re-request at the original URL to ensure they have the latest URL. | [Alias](profiles/alias.md)                                   | RFC 7231, [section 6.4.7](https://tools.ietf.org/html/rfc7231#section-6.4.7) |
| `308 Permanent Redirect` | The client should retry their request at the URL found in the `Location` header. The new location is permanent so clients can replace their use of the original URL with the new URL. Often used to migrate API endpoints without breaking older clients. | [Alias](profiles/alias.md)                                   | [RFC 7538](https://tools.ietf.org/html/rfc7538)              |

### Client Failure Codes

Resources reject client requests for various reasons, and the client may be able to attempt their operation again with a corrected request. These status codes give the client information to help them correct their request and try again.

| Status Code                  | Meaning                                                      | Profiles                                                     | Source                                                       |
| ---------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `400 Bad Request`            | Incorrect message formatting is incorrect. Examples include invalid JSON body and incorrect request parameters in URL and header values. The Client should examine their code and API docs to fix their request code before resubmitting. | All profiles                                                 | RFC 7231, [section 6.5.1](https://tools.ietf.org/html/rfc7231#section-6.5.1) |
| `403 Forbidden`              | Business rule failure. For instance, in a hotel API, a client cannot book a room that is not available. | [Action](profiles/action.md), [Data](profiles/data.md), [Form](profiles/form.md) | RFC 7231, [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8) |
| `404 Not Found`              | Resource does not exist and thus cannot be found. It may have been deleted via the API or removed by the backend system. | All profiles                                                 | RFC 7231, [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8) |
| `409 Conflict`               | Resource state conflict. Used in PATCH responses when the content cannot be patched successfully given the supplied patch body. | [Entity](profiles/entity.md)                                 | RFC 7231, [section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8) |
| `411 Length Required`        | The resource requires the `Content-Length` header to process a `PUT` request. | [Content](profiles/content.md)                               | RFC 7231, [section 6.5.10](https://tools.ietf.org/html/rfc7231#section-6.5.10) |
| `413 Payload Too Large`      | The request payload is too large for the resource to accept. | [Content](profiles/content.md)                               | RFC 7231, [section 6.5.11](https://tools.ietf.org/html/rfc7231#section-6.5.11) |
| `415 Unsupported Media Type` | The resource cannot accept the media type defined for the payload. | [Content](profiles/content.md), [Data](profiles/data.md), [Form](profiles/form.md), [Lookup](profiles/lookup.md) | RFC 7231, [section 6.5.13](https://tools.ietf.org/html/rfc7231#section-6.5.13) |
| `416 Range Not Satisfiable`  | Client requested a range for a representation that cannot be met. For instance, an image representation may have 4k of data, but the range asked for 8k of data. | [Content](profiles/content.md)                               | RFC 7233, [section 4.4](https://tools.ietf.org/html/rfc7233#section-4.4) |
| `417 Expectation Failed`     | The resource does not support the `Expect` header and cannot preflight a request. | [Preflight](profiles/preflight.md)                           | RFC 7231, [section 6.5.14](https://tools.ietf.org/html/rfc7231#section-6.5.14) |
| `422 Unprocessable Entity`   | Message format is correct, but the data presents unknown or incorrect semantics. The resource does not understand the message. Missing or incorrect request parameters are included in this category. The client has understood the typing and formatting of the API, but is sending incorrect values. | [Content](profiles/content.md), [Data](profiles/data.md), [Form](profiles/form.md), [Lookup](profiles/lookup.md) | RFC 4918, [section 11.2](https://tools.ietf.org/html/rfc4918#section-11.2) |
| `428 Precondition Required`  | The client did not send the required `Content-Type` header in a `PATCH` request. Examine the `Accept-Patch` header of the resource to determine the acceptable patch content types. | [Data](profiles/data.md)                                     | RFC 6585, [section 3](https://tools.ietf.org/html/rfc6585#section-3) |

