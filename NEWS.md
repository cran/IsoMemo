# IsoMemo 23.10.1

## Features
- optional parameter in `getFields()` to receive the column names as they come from the 'IsoMemo' API

## Bug Fixes
- fix missing column name in `getFields()`

# IsoMemo 23.10.0

## Features

- The main function `getData()` has got a new optional parameter `mapping` to change the mapping that is applied for the combination of data sources that can be retrieved using the 'IsoMemo' API.
- Currently the 'IsoMemo' API understands one mapping called "IsoMemo".
- More mappings that combine different sources of data, will be added in the future.
- Switch from SemVer to CalVer

# IsoMemo 1.0.6

## Corrections with name changes and corrections:
- Name changes:
  - Where it says "Retrieve Data using the Max Plank Institute 'IsoMemo' API" change this to: "Retrieve Data using the 'IsoMemo' API". This is in the pdf and in the title of the webpage.

- Where it says"database options: "14CSea" , "IntChron" , "IsoArcH" , "LiVES" change to "examples of database options: "14CSea" , "IntChron" , "CIMA" , "LiVES"

- Where it says "Data retrieval for the IsoMemo App Project https://isomemoapp.com/ Given the parameters Database
name, category names, and field names." changed to "Data retrieval for databases within the IsoMemo initiative (https://isomemo.com/). Given the parameters Database name, category names, and field names."

# IsoMemo 1.0.5

## Features
The main function that facilitate the data retrieval and aggregation from the API is: `getData()`

The following are its sub-functions contained in this package: 
- `getRemoteDataAPI()` retrieves the API to query the data
- `getMappingAPI()` calls the mapping for the fields needed from the user API calls
- `getDatabaseList()` returns a list of database names linked to the API call
- `callAPI()` initiates the request to call 
