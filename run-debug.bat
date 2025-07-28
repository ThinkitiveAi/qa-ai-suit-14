@echo off
echo ========================================
echo Running API Debug Tests
echo ========================================

echo.
echo Testing different patient data formats...
npx playwright test tests/api-debug.spec.ts --headed

echo.
echo Debug test completed!
echo Check the console output above to see which format works.
echo.
pause
