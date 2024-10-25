## CSV-ids
Sometimes you need to get a list of ids to use in another query from your database tool when you cannot use an inner query.
Often you could resort to making a SELECT with only the id as column, then have to open the file in an editor, 
remove the first line and then replace newlines with a comma.

CSV-ids does just that. It is a quick helper to get a list of ids from a csv file into your clipboard for macos or linux

### Requirements
- bash
- for linux: xclip (available in all package managers)

### Setup
1. Clone the repository
2. Make a symlink to the script in your bin directory
```bash
sudo ln -s $(pwd)/csv-ids.sh /usr/bin/csv-ids
```

### Usage
1. As a command:
```bash
csv-ids ~/Downloads/some-query-file.csv 
```
2. As a pipe:
```bash
cat ~/Downloads/some-query-file.csv | csv-ids
```

### Options: 
- --print: print the ids to the console instead of copying to clipboard

