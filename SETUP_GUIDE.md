# Bluefluff Setup Guide for Modern Node.js

## Problem
The original `xpc-connection` package has compatibility issues with modern Node.js versions (12+) due to V8 API changes. The gyp compilation errors are caused by outdated native bindings.

## Solution
The good news: **You don't need `xpc-connection`** to use bluefluff! The package was never actually used in the code, and `@abandonware/noble` provides all the Bluetooth functionality you need.

## Setup Instructions

### 1. Clean Install
```bash
cd /Users/A1B35FA/IdeaProjects/bluefluff/fluffd
rm -rf node_modules package-lock.json
npm install
```

### 2. Verify Installation
```bash
npm list
```

You should see `@abandonware/noble` and `winston` installed successfully.

### 3. Run Fluffd
```bash
node fluffd.js
```

If you see output like:
```
[timestamp] info: Scanning for Furby...
```

Then it's working! Your Furby should appear when it's in Bluetooth range and advertising.

### 4. Optional: Reduce Warnings
Run this to address optional security issues (not critical for functionality):
```bash
npm audit fix
```

## Troubleshooting

### Still seeing xpc-connection errors?
Make sure you:
1. Deleted `node_modules` and `package-lock.json` completely
2. Ran `npm install` fresh
3. Check that `package.json` has `xpc-connection` in `optionalDependencies` (not `dependencies`)

### Furby not connecting?
1. Make sure Bluetooth is enabled on your Mac
2. Make sure your Furby is powered on and in Bluetooth range
3. Try running with `sudo` if permissions are an issue:
   ```bash
   sudo node fluffd.js
   ```

### Client not loading?
Once fluffd is running, open the client:
```
file:///Users/A1B35FA/IdeaProjects/bluefluff/fluffd-client/index.html
```
in your web browser. The HTTP API server runs on `localhost:3872`.

## What Changed
- Updated `package.json` to use exact version `1.9.2-26` for `@abandonware/noble` (pre-release versions don't support caret specifiers)
- Moved `xpc-connection` to `optionalDependencies` so it won't fail the installation if the compilation fails
- The actual code doesn't use `xpc-connection`, so removing it has no functional impact

## Next Steps
1. Verify fluffd.js works with `node fluffd.js`
2. Open the web client and try commanding your Furby
3. Refer to `/doc/flashdlc.md` if you want to flash custom DLC files

Good luck controlling your Furby from 2015!

