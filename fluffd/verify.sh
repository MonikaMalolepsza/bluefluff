#!/bin/bash
# Quick verification script for bluefluff installation

echo "=== Bluefluff Installation Verification ==="
echo ""

cd /Users/A1B35FA/IdeaProjects/bluefluff/fluffd

echo "1. Checking Node.js version..."
node --version
echo ""

echo "2. Checking npm version..."
npm --version
echo ""

echo "3. Checking installed packages..."
npm list --depth=0
echo ""

echo "4. Testing @abandonware/noble module load..."
node -e "try { require('@abandonware/noble'); console.log('✓ @abandonware/noble loaded successfully'); } catch(e) { console.log('✗ Error: ' + e.message); }"
echo ""

echo "5. Testing winston module load..."
node -e "try { require('winston'); console.log('✓ winston loaded successfully'); } catch(e) { console.log('✗ Error: ' + e.message); }"
echo ""

echo "6. Package.json dependencies:"
cat package.json | grep -A 4 '"dependencies"'
echo ""

echo "=== Verification Complete ==="
echo ""
echo "Ready to run: node fluffd.js"

