---
layout: default
title: Form
parent: Profiles
nav_order: 8
permalink: /profiles/form
---
# Form

##### `Profile: <http://level3.rest/profiles/form>`

Form is a hypermedia control that provides a form for the client to fill in and then accepts that form back in a `POST` request. Anyone who has ever filled out and submitted a paper form in the real world already knows how the Form profile works. The basic concept with Form is to `GET` it's representation, fill it in, and `POST` it back.

HTML has had `<form>` controls since the beginning and they have proven useful for capturing information and state from users in many applications. Over time, HTML forms have added valuable capabilities like client-side field validation and semantic field presentations like "password" and "email". In a similar spirit, Level 3 forms can supply Client-oriented schemas to assist the Client with creating user presentations and valid form payloads.

Forms often create new resources, but can also be used to direct a client to a pre-existing resource that matches the submitted form's content. A Form resource can also represent an API command that changes system state. 

##### Form Content

Forms in Level 3 supply their form representation in two ways. One is to deliver a simple object template with fields that are either empty or prepopulated. The other is to supply a form schema that the client uses to construct a form payload to submit. The Client can learn what representation is being provided during Discovery.

### Discovery

The Form profile presents the required `Profile` and `Allow` headers as well as a `Content-Type` indicating the type of the request payload. The resource may provide a `Content-Type` like [`application/schema+json`](https://json-schema.org/latest/json-schema-core.html),  [`application/prs.hal-forms+json`](https://rwcbook.github.io/hal-forms/) or [`application/xml-dtd`](https://www.w3.org/2006/02/son-of-3023/draft-murata-kohn-lilley-xml-04.html) that can be used to construct a form payload. The Client will need to understand the content type and how to use the schema to produce a submission payload from it. 

Alternately the Form can send a template object with empty fields, which is a sufficient approach for simple forms. In this case the `Content-Type` will reflect the format of the template object, like `application/json` or `application/xml`.

![](form/discovery.svg){: .center-image}

### Form Submission

A Client will `GET` the representation from the Form resource. The representation could be a schema definition or a template object with empty fields. The form template include default or existing values.

If the representation is a schema then it should be used to construct a form object. If the representation is a template object then it should be filled in by the Client. The completed object is then `POST`ed back to the Form resource.

Clients should always `GET` the representation for every request rather than reusing the schema or form template from a previous request. The Form’s data requirements may have changed since the Client last fetched the representation.

Once the form has been submitted, the resource will respond with a success message and a `Location` header pointing to a relevant resource. If the submission was unacceptable, then the resource will respond with a client error status code and error messages indicating the problem. Common problems include missing required fields, or incorrect data in the fields.

##### Rejections

| Status Code                | Explanation                                                  |
| -------------------------- | ------------------------------------------------------------ |
| `400 Bad Request`          | The forms's syntax is malformed                              |
| `422 Unprocessable Entity` | Values in the form are not accepted by business validation rules |

![](form/submit.svg){: .center-image}

# Mixins

## Representation Mixin

Form can provide the [Representation profile](representation.md) as a mixin so the client can receive the relevant `Location`'s representation in the submission response.

## Entity Mixin

Forms can provide the [Entity profile](entity.md) as a mixin so the client can benefit from cached Form requests as well as stable submission schema via the [Conditional Operation](entity.md#conditional-operation) flow. The client can be sure the Form's schema and requirements have not changed since the form was fetched.

## Specifications

HTTP Extensions for WebDAV: [RFC 4918](https://tools.ietf.org/html/rfc4918)

- 422 Unprocessable Entity: [section 11.2](https://tools.ietf.org/html/rfc4918#section-11.2)

HTML 5.2: [Forms](https://www.w3.org/TR/html52/sec-forms.html)

HTTP/1.1 Semantics and Content: [RFC 7231](https://tools.ietf.org/html/rfc7231)

- Content-Type: [section 3.1.1.5](https://tools.ietf.org/html/rfc7231#section-3.1.1.5)
- 200 OK: [section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)
- 201 Created: [section 6.3.2](https://tools.ietf.org/html/rfc7231#section-6.3.2)
- 204 No Content: [section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5)
- 400 Bad Request: [section 6.5.1](https://tools.ietf.org/html/rfc7231#section-6.5.1)
- Location: [section 7.1.2](https://tools.ietf.org/html/rfc7231#section-7.1.2)

{% include footer.html %}