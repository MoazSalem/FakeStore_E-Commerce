'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"manifest.json": "704ce5fc4e06c2d9d7b6fe1016fe0e20",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js": "7db4623762e2fea1d06a99160597630d",
"version.json": "882561a23e46efb349f16f4735e1e14a",
"assets/NOTICES": "9c41cbfa0e0011050a01cd730b648fd8",
"assets/fonts/MaterialIcons-Regular.otf": "dda050ef5049f7a508c78d022c3ee424",
"assets/AssetManifest.json": "04693dd0bd09ff263746044296b8b805",
"assets/assets/fonts/encode_sans/EncodeSans-Black.ttf": "abed43a1b837cca92f90a440f3ab4171",
"assets/assets/fonts/encode_sans/EncodeSans-Medium.ttf": "f57cb8d8afcd649f6984219f306666fa",
"assets/assets/fonts/encode_sans/EncodeSans-Thin.ttf": "8caac0713270deb118c0bb88052f5904",
"assets/assets/fonts/encode_sans/EncodeSans-SemiBold.ttf": "bfa9f3d2b167bbd7328417bcc4742ee7",
"assets/assets/fonts/encode_sans/EncodeSans-Regular.ttf": "4ba3d8a808d9261be48cb262de3f76f5",
"assets/assets/fonts/encode_sans/EncodeSans-ExtraBold.ttf": "52333a89834cb210f88f84acca42753e",
"assets/assets/fonts/encode_sans/EncodeSans-ExtraLight.ttf": "bfe8eb8f0f40f83e61ccb23090d92b10",
"assets/assets/fonts/encode_sans/EncodeSans-Light.ttf": "f9913319935921eb276e94bd409670a1",
"assets/assets/fonts/encode_sans/EncodeSans-Bold.ttf": "45d5168962e2e0df461690130c279e93",
"assets/assets/images/svgs/brush.svg.vec": "8d66796cea3eb2695dbb38ebf5d91527",
"assets/assets/images/svgs/cart_filled.svg.vec": "c8a9c734a10a9c5daf86478154739556",
"assets/assets/images/svgs/home_filled.svg.vec": "11fdcc4098d25f0f5374797c89238b94",
"assets/assets/images/svgs/cart.svg.vec": "dafedf2c6ffa1ed72b46424bd3b9a82c",
"assets/assets/images/svgs/search.svg.vec": "d62ee4d786ce9e04589e1f9d55fc3aa9",
"assets/assets/images/svgs/home.svg.vec": "617a96baa41be4f58ef7641e83ba2d1b",
"assets/assets/images/svgs/heart_filled.svg.vec": "1d328e019e800d496f489e9f3a090791",
"assets/assets/images/svgs/heart.svg.vec": "b419dfed71a0e960702d6e0aa348c2c6",
"assets/assets/images/svgs/setting.svg.vec": "3dd57e2929db7b7d5addeb59d46b3547",
"assets/assets/images/svgs/unsave.svg.vec": "24d0a9213885673a0f45f64697f1f3f6",
"assets/assets/images/svgs/profile.svg.vec": "c4136afed328d8b6e71b1b043ab9cf81",
"assets/assets/images/svgs/profile_filled.svg.vec": "7c34ac7605f631f437cc00a66bd64f7d",
"assets/assets/images/svgs/back.svg.vec": "839e4089ff0e5986c07c7a324285e00c",
"assets/assets/images/svgs/star.svg.vec": "eb9b03658870164067176071472687f0",
"assets/FontManifest.json": "29556d861bc642f89e66880803b3ac75",
"assets/AssetManifest.bin.json": "98181d88d2b8d3cf584bb697fba7613b",
"assets/AssetManifest.bin": "8752ba2a9c667202616c5100f0e5f452",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"flutter_bootstrap.js": "621a224c4f0f8441adb4dfa7a0e15666",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "82112fbea15fbb161eb26723ac53c941",
"/": "82112fbea15fbb161eb26723ac53c941"};
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
