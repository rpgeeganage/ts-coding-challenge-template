# for your information

## Config
* This repo has predefined config file `./src/configs.ts`.
* It uses `zod` library to validate schema.
(https://zod.dev/)

## Path Alias
* This project support `path alias` in `TypeScript`.
* So you can import files as follows.
```
import { Configs } from 'src/configs';

console.log(Config.PORT);
```

## npm commands
```sh
npm i               # install packages
npm run build       # Build project
npm t               # Run tests
npm start           # Run the app.
npm run lint        # Run lint
npm run fix:ling    # Fix lint issues
```
 
## Make file
```sh
make install    # Install dependencies
make up         # Run service in the background
make cmd        # Run the service and connect to the `bash`
make down       # Tear down the service
make clean      # Clean containers in `exited` status.
```

## Pre commit hook
* Run `chmod +x ./husky/pre-commit` to enable pre commit hook.