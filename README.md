Valkey Admin on Aiven Apps

This is a sample dockerfile to deploy Valkey-Admin on Aiven Apps.

Learn More about [Aiven Apps]
Learn More about [Valkey Admin]

## The Dockerfile

Aiven's apps must load from a `dockerfile`([:link:](/Dockerfile)) (compose
apps need to reference a dockerfile that exists in the repo).

Our `Dockerfile` pulls the valkey-admin image, creates
the base environment variables needed to begin metrics capture.
Lastly, the dockerfile runs `entrypoint.sh` which looks for the environment
variable `REDIS_URL` and expands it to fill the `VALKEY_HOST`,
`VALKEY_USERNAME`, `VALKEY_PASSWORD`, and `VALKEY_PORT`.

> [!NOTE]
> `REDIS_URL` is the environment variable valkey provides to provide general
> backwards compatablity with legacy redis tooling that is still compatible
> with Valkey.

## Docker Compose

The preferred way to build the app and connect to an existing Valkey Instance
(or create a new Valkey instance) is to use the included docker-compose.

## Instructions

- clone from template or Fork this Repo
- create a New App in the Aiven Console
- point to either the docker-compose (preferred) or the Dockerfile of this repo

If you selected the docker-compose:

- add the valkey instance (or create a new valkey service)
- ensure that `REDIS_URL` is set to the service's connection string

Otherwise:

- add the information for the valkey instance that ou

> [!NOTE]
> You will still need to re-enter this information on the connections page on
> first load. The information is so that the metrics backend is configured,
> but has no control of the frontend.

[Aiven Apps]: https://aiven.io/blog/developers-guide-to-aiven-apps
[Valkey Admin]: https://valkey-admin.valkey.io/
