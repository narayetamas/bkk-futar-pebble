PebFUTÁR
========

Pebble watchapp for tracking public transport in Budapest, Hungary.

Not actively maintained anymore.

## Updates (2025)

This version has been updated to use the new BKK OpenData FUTÁR API.

### Getting Started

To use this app, you need to obtain a free API key from BKK:

1. Visit [BKK OpenData Portal](https://opendata.bkk.hu/)
2. Register and obtain your API key from the "Kulcskezelés" (Key Management) section
3. Open `src/js/app.js` and replace `YOUR_API_KEY_HERE` on line 9 with your actual API key:
   ```javascript
   var BKK_API_KEY = 'your-actual-api-key-here';
   ```
4. Build and install the app on your Pebble watch

### Features

- Find nearby transit stops based on GPS location
- View real-time departure predictions
- Save favorite stops for quick access
- Search for transit route details
- Bilingual interface (English and Hungarian)

### API Information

This app uses the BKK FUTÁR OpenData API:
- API Documentation: https://opendata.bkk.hu/
- OpenAPI Specification: https://opendata.bkk.hu/docs/futar-openapi.yaml
- License: Creative Commons 4.0 (CC BY 4.0)

### License

MIT License - See LICENSE file for details
