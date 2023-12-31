# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js'
pin 'stimulus-password-visibility', to: 'https://ga.jspm.io/npm:stimulus-password-visibility@2.1.1/dist/stimulus-password-visibility.mjs'
pin 'stimulus-notification', to: 'https://ga.jspm.io/npm:stimulus-notification@2.2.0/dist/stimulus-notification.mjs'
pin 'hotkeys-js', to: 'https://ga.jspm.io/npm:hotkeys-js@3.11.2/dist/hotkeys.esm.js'
pin 'stimulus-use', to: 'https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js'
pin 'checkbox', to: 'checkbox.js', preload: true
pin 'search', to: 'search.js', preload: true
pin 'tab', to: 'tab.js', preload: true
pin 'js-cookie', to: 'https://ga.jspm.io/npm:js-cookie@3.0.5/dist/js.cookie.mjs', preload: true
pin 'post_status', to: 'post_status.js', preload: true
