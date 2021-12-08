# diginole_utils
Scripts for assisting with digital curation of DigiNole

## `batch-regen-derivs.sh`
**Usage:** `./batch-regen-derivs.sh pidfile.txt [DSID]`   
This is a script that uses a list of Islandora PIDs (one per line) and, for each line, runs a drush command to regenerate that PID's derivatives. The relative path to the file containing the Islandora PIDs should be passed to this script as the first parameter. A second optional parameter of an Islandora datastream ID (DSID) may also be passed to limit the derivative regeneration to only the specified DSID; if no DSID argument is passed, all derivative datastreams will be regenerated.

## `getChildrenFromPid.php`
This is an example script for getting the children of a PID via the PHP UI. Swap the $pid variable with the PID you want to get children of, and the $relationship variable with the RDF relationship that defines the children.
