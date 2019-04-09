# cleanStart

BASH script to run when getting coffee in the morning. Automatically fetches, stashes, and pulls from upstream dev/devlop/development branch. Then runs yarn to install any package updates


## How to use:

Move file in root carecloud directory

run `./cleanStart.sh`

### Flags

-c: also removes all node_modules, yarn.lock, and package-lock.json files before installing

-f: tells the script to run only on a subset of folders passed in as an array under the first line of the app. open file and add/remove folder names that you desire to run the script on and then run this script with this flag.


