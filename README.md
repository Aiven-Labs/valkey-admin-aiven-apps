Valkey Admin on Aiven Apps

This is a sample dockerfile to deploy Valkey-Admin on Aiven Apps.

Learn More about [Aiven Apps]
Learn More about [Valkey Admin]

Instructions:

- Fork this Repo
- Create a New App in the Aiven Console
- Point to either the Dockerfile or the docker-compose of this repo
- In the environment variables - Enter the information for the Valkey instance

![Valkey Host Port and Password Information](/assets/aiven-valkey-connection-information.png)

![Valkey-Admin Environment Variable Locations]()

> [!NOTE]
> You will still need to re-enter this information on the connections page on first load. The information is so that the metrics backend is configured, but has no control of the frontend.

[Aiven Apps]: https://aiven.io/blog/developers-guide-to-aiven-apps
[Valkey Admin]: https://valkey-admin.valkey.io/
