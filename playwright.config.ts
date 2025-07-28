import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  timeout: 60000,
  expect: {
    timeout: 10000
  },
  reporter: [
    ['html'],
    ['json', { outputFile: 'test-results/results.json' }],
    ['list']
  ],
  use: {
    baseURL: 'https://stage-api.ecarehealth.com/api/master',
    extraHTTPHeaders: {
      'Content-Type': 'application/json',
      'X-TENANT-ID': 'stage_aithinkitive'
    },
    ignoreHTTPSErrors: true,
    trace: 'on-first-retry',
  },
  projects: [
    {
      name: 'api-tests',
      testDir: './tests',
      use: { ...devices['Desktop Chrome'] },
    }
  ]
});
