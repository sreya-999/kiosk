'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ad56b775ee72329279e23d6dff89a2d5",
"assets/AssetManifest.bin.json": "bc7d20d22d57a9c1d8b005bea6357c9a",
"assets/AssetManifest.json": "7c3addc29c895a7be6be6854b8d6f128",
"assets/assets/fonts/inter_bold.ttf": "ba74cc325d5f67d0efbeda51616352db",
"assets/assets/fonts/inter_extrabold.ttf": "72ac147c98056996b2a31e95a56d6e66",
"assets/assets/fonts/inter_medium.ttf": "cad1054327a25f42f2447d1829596bfe",
"assets/assets/fonts/inter_regular.ttf": "ea5879884a95551632e9eb1bba5b2128",
"assets/assets/fonts/inter_thin.ttf": "4558ff85abeab91af24c86aab81509a7",
"assets/assets/fonts/Lobster-Regular.ttf": "c3191f3b933ae0bd46335e178744326e",
"assets/assets/fonts/OleoScriptSwashCaps-Regular.ttf": "cedd93aff0900036032396ae5ba6fee2",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/fonts/ReemKufi-Regular.ttf": "c71ba9425dce6fbf6b4545af10d6b472",
"assets/assets/icons/1%2520(1).svg": "1be45a2d1357250dde3230f1f063ca81",
"assets/assets/icons/banner1.png": "99da2ea5f5b62453a04f0237d88b34e9",
"assets/assets/icons/Brand.svg": "33ab5c1dfae1f28ab8b8aeb2bf361c61",
"assets/assets/icons/burger.png": "027d55208ccdbf7a958d05bdeb1e2a76",
"assets/assets/icons/combobadge.png": "b5df9bd6ac971155224687971bdfdac5",
"assets/assets/icons/dinein.svg": "ac55a06fb40f8cf3d74ea2ad85a05be6",
"assets/assets/icons/Group%25202087326791%2520(1).svg": "084bbfa51c03fe18a94a49670377041d",
"assets/assets/icons/Group%25202087326791%2520(2).svg": "084bbfa51c03fe18a94a49670377041d",
"assets/assets/icons/Group%25202087326791.svg": "35bd3f7dd023bcacb10299e4646eb08d",
"assets/assets/icons/home1.png": "e88a0f15ea672c018967a16bab942e0c",
"assets/assets/icons/home2.png": "6d9525b16eab2e209fe68aea4a426253",
"assets/assets/icons/image-removebg-preview%2520-%25202025-07-31T170653.574%25203.svg": "2f637462ead7487f8a9b826938541773",
"assets/assets/icons/logo.svg": "b0e407497223b3f875e0a88b071fcf88",
"assets/assets/icons/m8_cravia_sample_logo__1_-removebg-preview%25203.svg": "93277e579c9e893bb5bc6bfd819623a6",
"assets/assets/icons/offer1.png": "8c03c7ba5f372f40c5d6671272bfcf63",
"assets/assets/icons/onboard1.png": "e6a3e851a40ee1d7f1b364d1c1698cfd",
"assets/assets/icons/onboard2.png": "8e101346296f0f7f579c340a19460721",
"assets/assets/icons/onboard3.png": "b32f225d54a900a86fc8697f0711be0c",
"assets/assets/icons/payment.png": "7d61c77636434008d6f93e933a308fe9",
"assets/assets/icons/qrcode.png": "8eaab4272c3c174320515043d03c3cb9",
"assets/assets/icons/receipt.png": "565bcc0a1021436090adcac9c86ef087",
"assets/assets/icons/Rectangle%2520121.svg": "7818833e744d6688dcb263ab6d6bb7b6",
"assets/assets/icons/splash.png": "c023c826579ce8cdcc7636b3c391727d",
"assets/assets/icons/sucess.png": "9e2fcb96f6580fd6a96457421edd1cd2",
"assets/assets/icons/takeaway.svg": "46f6c9c7ac30100a61accb6091372d88",
"assets/assets/icons/Untitled%25201%25201.svg": "62b298b7299fad61365a6eac96edd2a0",
"assets/FontManifest.json": "097c3693c7fe82ea6872f4a92e557c7d",
"assets/fonts/MaterialIcons-Regular.otf": "e56ef127f01bb847f76e0a11f7a1a682",
"assets/NOTICES": "42b312a42177804fd5db57b61f518b01",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "16ddffe0be869c393c3d21bd56a05263",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "8696dc9ddf97f83321e7bcc8081ee7e6",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7b4a8affdcf502da7c21871388bd0117",
"/": "7b4a8affdcf502da7c21871388bd0117",
"main.dart.js": "033665e25723b1e595d5c0a73c7d9f6e",
"manifest.json": "4853a8b081138af042599da5ea1d8bc9",
"version.json": "c46152c6c163c8e7c7698cc6918586c0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
