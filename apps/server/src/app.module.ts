import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';

import { CatsModule } from './resources/cats/cats.module';
import { HealthModule } from './resources/health/health.module';

export const AppModules = [CatsModule, HealthModule];

@Module({
  imports: [...AppModules, MongooseModule.forRoot(process.env.DATABASE_URI)],
  controllers: [],
  providers: [],
})
export class AppModule {}
