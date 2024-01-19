#!/bin/bash

# lastReleaseRevision:  LastReleaseRevision is the revision of the last successful Helm release.
# observedGeneration:   ObservedGeneration is the generation observed by the Helm controller.

# current lastReleaseRevision
postgres_lastReleaseRevision=32

# get the current lastReleaseRevision
current_postgres_lastReleaseRevision=$(kubectl -n proxy get hr postgres-server  -o jsonpath="{.status.lastReleaseRevision}")

if [ "$current_postgres_lastReleaseRevision" -gt "$postgres_lastReleaseRevision" ]; then
    echo "postgres-server has been updated"
    # update postgres_lastReleaseRevision
    postgres_lastReleaseRevision=$current_postgres_lastReleaseRevision
    # restart desired pods
else
    echo "postgres-server has not been updated"
fi
