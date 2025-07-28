@echo off
echo ========================================
echo Healthcare API Testing Framework Setup
echo ========================================

echo.
echo Cleaning existing installations...
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del package-lock.json

echo.
echo Installing dependencies...
npm install

echo.
echo Installing Playwright browsers...
npx playwright install

echo.
echo Compiling TypeScript...
npx tsc --noEmit

echo.
echo Running basic test to verify setup...
npx playwright test tests/basic-test.spec.ts --headed

echo.
echo ========================================
echo Setup completed!
echo ========================================
echo.
echo To run the healthcare workflow test:
echo npx playwright test tests/healthcare-workflow-fixed.spec.ts --headed
echo.
echo To run all tests:
echo npx playwright test --headed
echo.
pause
