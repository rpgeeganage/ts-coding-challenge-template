import { z } from 'zod';

const envSchema = z.object({
  PORT: z.number(),
});

const parsedConfig = envSchema.safeParse(process.env);
if (!parsedConfig.success) {
  throw new Error(`Configuration failuer. ${JSON.stringify(parsedConfig.error.format())}`);
}

export const Configs = parsedConfig.data;
export type ConfigsType = z.input<typeof envSchema>;
