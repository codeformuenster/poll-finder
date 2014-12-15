# Poll Finder API
## Finde dein Wahllokal API
Eine einfache API mit aktuell nur einem Endpoint zum auffinden des Wahllokals.

```
/find/:strasse/:hausnummer
```

gibt JSON zurück in dem folgenden Format

```
{"wahlbezirk_nr":"09"}
```

## Setup with Docker

Install Docker and Fig.

Build the app:

    fig build

    fig up

The app should now be available at [http://localhost:8000](http://localhost:8000).

## Setup without Docker

    rackup

## Contributing
Issues are managed in [Github Issues](https://github.com/codeformuenster/poll-finder/issues?state=open). You can also view them on a [Kanban board](https://waffle.io/codeformuenster/poll-finder).

Either fork and pull-request or ask @kirel or @milafrerichs for access and work on feature branches.

Feature branches should be names `Issue#-descriptive-name` - see https://github.com/codeformuenster/codeformuenster.github.io/branches for examples.

# Deploying

Just send a PR and we will deploy when it is merged
