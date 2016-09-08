# p360-sql

## Installation
```sh
$ npm install
```

## Usage - duplicate contacts
```sh
$ ./cli.js duplicateContacts
```
### Result

```json
[
  {"id":"0000000000"},
  {"id":"0000000001"}
]
```

## Usage - duplicate student folders
```sh
$ ./cli.js duplicateStudentFolders
```
### Result

```json
[
  {"tittel":"Elevmappe - Harald Havre","antall":3},
  {"tittel":"Elevmappe - Håvard Hode ","antall":2}
]
```


## Usage - users by access group
```sh
$ ./cli.js usersByAccessGroup
```
### Result

```json
[
  {"accessGroup":"Elev-Skien","name":"Testine Testen","userId":"01016101"},
  {"accessGroup":"Elev-Skien","name":"Hans Håve","userId":"1104hava"}
]
```

## Usage - users by role
```sh
$ ./cli.js usersByRole
```

### Result

```json
[
  {"role":"Lærer","name":"Guest User","userId":"GuestUser","enterpriseNumber1":"974568039","enterpriseNumber2":null},
  {"role":"Lærer","name":"Testine Testen","userId":"01016101","enterpriseNumber1":"974568039","enterpriseNumber2":null}
]
```

## Usage - access groups on case documents
```sh
$ ./cli.js accessGroupsOnCase
```
### Result

```json
[
  {"caseNumber":"14/02442","caseTitle":"elevmappe ","documentNumber":"14/02442-1","officialTitle":"Søknad om fritak fra vurdering i fag ","accessGroup":"Elev-Porsgrunn","personalIdNumber":"01010101010"},
  {"caseNumber":"14/02442","caseTitle":"elevmappe ","documentNumber":"14/02442-2","officialTitle":"Elevsamtale ","accessGroup":"Elev-Porsgrunn","personalIdNumber":"01010101012"}
]
```

