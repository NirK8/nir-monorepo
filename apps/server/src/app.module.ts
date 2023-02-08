import { Module } from '@nestjs/common';

import { CatsModule } from './resources/cats/cats.module';
import { HealthModule } from './resources/health/health.module';

export const AppModules = [CatsModule, HealthModule];

@Module({
  imports: [...AppModules],
  controllers: [],
  providers: [],
})
export class AppModule {}
