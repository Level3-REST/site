---
layout: default
title: Process
parent: Patterns
nav_order: 5
permalink: /patterns/process
---
# Process Pattern

Wikipedia describes a [process](https://en.wikipedia.org/wiki/Process) as “…a set of activities that interact to produce a result.” The Process pattern models this set of activites as resources. An API can use the Process pattern to model many sequence-oriented workflows such as inventory processing, appointment scheduling, commerce checkout, job applications, and customer surveys.

![](process/relations.svg){: .center-image}

The Process resource acts as the locus of one or more Activity resources representing steps or actions that are part of the overall process. Activities present controls like [Chooser](chooser.md) or [Forms](../profiles/form.md) that accept state change operations to complete the activity. When an activity is completed, the result's `Location` header should point to the top-level Process. (really?)

These activities can be dynamically added to a process, depending on other activity results. For instance, imagine a service signup process that allows minors, with their guardian's permission, to join the service. One activity uses an age check form that asks for the person's age. If the person indicates they are underage, a new activity called "guardian permission" joins the process to collect the guardian's consent for the signup.

Activities can block other activities to control sequence and activity flow. A blocking activity resource attaches to another activity with a "blocks" link to indicate a sequential activity requirement to unblock the next activity in a flow.

![](process/example.svg){: .center-image}

HOW DO I KNOW WHEN THE PROCESS IS COMPLETE? When all the Blockers are addressed, but what is the end result?

## Process Resource

`Profile: <http://level3.rest/patterns/process#process-resource>`

The Tree resource presents either the [Info](../profiles/info.md) or [Nexus](../profiles/nexus.md) profile.

If the Tree resource presents the [Nexus](../profiles/nexus.md) profile, then it can be deleted with a `DELETE` operation. The node resources in the tree are also deleted. For instance, if the tree represents a file system, then deleting the Tree resource also deletes the child file and directory resources because the individual files have no context to exist outside of their directory.

### activity

```
rel="http://level3.rest/patterns/process#activity"
```

Process resources have 1 or more `activity` links pointing to the list of activities. The order of the links is intentional and may be ordered in blocking sequence. The order of the activities is not strict, however, as many Activities can be completed in other sequences, or in parallel. Clients can choose to present a set of Activities as a step-by-step wizard, or they may present them all at once in a single view.

## Activity Resource

`Profile: <http://level3.rest/patterns/process#activity-resource>`

An Activity resource has no required profile. It often presents a hypermedia control.

### process

```
rel="http://level3.rest/patterns/process#process"
```

The `process` link points to the [Process](#process-resource) of which the activity is a member.

### blocks

```
rel="http://level3.rest/patterns/process#blocks"
```

Activities can block other activities, which indicate the client should execute the blocking activity before attempting to execute the blocked one. The `blocks` link declares such a sequence. An activity can have multiple `blocks` relationships to other activities.

### blocked-by

```
rel="http://level3.rest/patterns/process#blocked-by"
```

The `blocked-by` link points to an activity that blocks this activity. The client should execute the `blocked-by` resource before executing this activity.

## Specifications

HTTP/1.1 Message Syntax and Routing: [RFC 7230](https://tools.ietf.org/html/rfc7230)

- Header Field Order: [section 3.2.2](https://tools.ietf.org/html/rfc7230#section-3.2.2)

{% include footer.html %}