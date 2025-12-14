
# Run the docker:
`docker run -e REWINGED_CONFIGFILE=config.json -p 8080:8080 -v ./config.json:/config.json:ro -v ./certs:/certs:ro -v ${PWD}/packages:/packages:ro -v ${PWD}/installers:/installers ghcr.io/jantari/rewinged:stable`

# [Look at this repo](https://github.com/jantari/rewinged)

take your package manifets from [here](https://github.com/microsoft/winget-pkgs/tree/master)


## add sources to winget
```winget source add -n rewinged_local -a https://localhost:1234/api -t "Microsoft.Rest"```

## install from the new source
winget install --source my_rewinged git.git

## [how to add new installers](doc/packages_explained.md)



## remove all old winget sources:
- ```winget source remove msstore```
- ```winget source remove winget```
- ```winget source remove winget-font```