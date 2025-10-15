# Vercel Alternative: Direct Static Deployment

Since we're having issues with the build process, here are alternative deployment methods:

## Option 1: Deploy build/web directory directly

1. **Drag & Drop to Netlify**
   - Go to [netlify.com](https://netlify.com)
   - Drag the `build/web` folder directly to the deploy area
   - Get instant URL!

2. **Firebase Hosting**
   ```bash
   npm install -g firebase-tools
   firebase login
   firebase init hosting
   # Point to build/web directory
   firebase deploy
   ```

3. **GitHub Pages**
   - Go to your repository settings
   - Enable GitHub Pages
   - Point to build/web directory
   - Get username.github.io/raksha-v0 URL

## Option 2: Fix Vercel Build

The build issue is because Vercel expects a dynamic build process, but we have pre-built files. 

### Quick Fix for Vercel:
1. The latest commit should fix the Vercel deployment
2. Redeploy on Vercel dashboard
3. Or try these manual steps in Vercel:
   - Build Command: `echo "Using pre-built files"`
   - Output Directory: `build/web`
   - Install Command: `echo "No install needed"`

## Option 3: Vercel CLI Direct Deploy
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy the build directory directly
cd build/web
vercel --prod
```

## Demo Credentials for Testing
- Email: demo@test.com
- Password: password123
- Admin: admin@raksha.ie / password123

The app is ready to test once deployed!