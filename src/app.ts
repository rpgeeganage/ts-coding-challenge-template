import 'module-alias/register';
import 'source-map-support/register';

import express from 'express';

import { Configs } from 'src/configs';

const app = express();
app.listen(Configs.PORT, () => {
  console.log(`Server started at port: ${Configs.PORT}`);
});
