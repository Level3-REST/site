---
layout: default
title: Alias
parent: Profiles
nav_order: 9
permalink: /profiles/alias
---
# Alias

##### `Profile: <http://level3.rest/profiles/alias>`

Alias redirects to another resource. Alias resources act as a stable reference to another resource. That other resource may be unstable and thus not the same on every request. For instance, Alias can be used to point to the current cell tower a mobile phone is connected to, or the airport gate a flight is currently parked.

Alias can also redirect to moved resources, which provides a way to support old versions of a resource in a way that helps the Client learn about the new version. All operations are supported in by an Alias resource in the same way—a `3xx` status code is returned with a `Location` header pointing to the new resource.

Alias supports two kinds of redirection:

| Intent                       | Status Code              |
| ---------------------------- | ------------------------ |
| Stable URL, dynamic resource | `307 Temporary Redirect` |
| Permanent change             | `308 Permanent Redirect` |

An Alias resource supports all the operations of the target resource: `HEAD`, `GET`, `PUT`, `POST`, `PATCH`, `DELETE`.

### Discovery

The Alias profile offers it's `Profile` header as well as the profile of the target resource. The `Location` header points to the aliased resource. It also shows the `Allow` header <u>for the target resource</u>. The status code matches the intent of the Alias--dynamic or permanent redirect.

![](alias/discovery.svg){: .center-image}

### Operate Alias

A Client can operate an Alias resource as if it were the target resource if their client supports automatic redirection. The Client will essentially be operating against the target resource through the Alias resource. If the Client does not support automatic redirection then they will need to be aware of the Alias resource and make the operation directly against the URL in the `Location` header. Clients will need to be aware of the response code and act accordingly. For status code `307`, the Client should re-operate against the Alias URL for every request so as to work with the latest target URL. For status code `308`, the client can memoize the `Location` URL and reuse it for subsequent operations.

Some complications may arise in the automatic redirect experience if the target URL points to a different domain, such that the headers of the second request are stripped away. The API server may need to configure [CORS](https://www.w3.org/TR/cors/) to allow necessary headers to be applied to the cross-origin request.

![](alias/operate.svg){: .center-image}

## Specifications

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- 307 Temporary Redirect: [section 6.4.7](https://tools.ietf.org/html/rfc7231#section-6.4.7)

The Hypertext Transfer Protocol Status Code 308: [RFC 7538](https://tools.ietf.org/html/rfc7538)

{% include footer.html %}