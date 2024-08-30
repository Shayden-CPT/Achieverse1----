const CACHE_NAME = 'cache-v3';
const PRIORITY_CACHED_ASSETS = [
  '/',
  '/index.html',
  '/styles/main.css',
  '/flutter_bootstrap.js',
  '/icons/Icon-192.png',
  '/favicon.png',
  '/manifest.json',
  'https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap',
  // Add other critical assets here
];

// Array for dynamic caching
const DYNAMIC_CACHE_NAME = 'dynamic-cache-v1';

// Install event: Cache priority assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Pre-caching priority assets');
        return cache.addAll(PRIORITY_CACHED_ASSETS);
      })
  );
});

// Fetch event: Serve from cache with dynamic caching and offline fallback
self.addEventListener('fetch', event => {
  const requestUrl = new URL(event.request.url);

  // Strategy for navigating requests (HTML)
  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .then(response => {
          // Cache navigations for offline use
          const responseClone = response.clone();
          caches.open(CACHE_NAME).then(cache => {
            cache.put(event.request, responseClone);
          });
          return response;
        })
        .catch(() => {
          // Fallback to cached HTML
          return caches.match('/index.html');
        })
    );
    return;
  }

  // Use cache-first strategy for critical assets, network-first for dynamic content
  event.respondWith(
    caches.match(event.request)
      .then(cachedResponse => {
        if (cachedResponse) {
          return cachedResponse;
        }

        return fetch(event.request)
          .then(networkResponse => {
            // Cache only non-HTML responses
            if (!event.request.url.endsWith('.html')) {
              const responseClone = networkResponse.clone();
              caches.open(DYNAMIC_CACHE_NAME)
                .then(cache => {
                  cache.put(event.request, responseClone);
                });
            }

            return networkResponse;
          })
          .catch(() => {
            // Optional: Fallback for specific requests if needed
            return new Response('Offline', {
              status: 503,
              statusText: 'Offline',
              headers: new Headers({ 'Content-Type': 'text/plain' })
            });
          });
      })
  );
});

// Activate event: Clean up old caches and handle cache prioritization
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME, DYNAMIC_CACHE_NAME];
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (!cacheWhitelist.includes(cacheName)) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

// Optional: Background Sync
self.addEventListener('sync', event => {
  if (event.tag === 'mySyncTag') {
    event.waitUntil(
      // Add your sync logic here
      // For example: resync failed requests
      fetch('/sync-endpoint')
        .then(response => response.json())
        .then(data => {
          console.log('Background sync successful', data);
        })
        .catch(error => {
          console.log('Background sync failed', error);
        })
    );
  }
});
