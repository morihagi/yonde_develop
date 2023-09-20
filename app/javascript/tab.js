// import Cookies from 'js-cookie';

// document.addEventListener('turbo:load', () => {
//   const tabs = document.querySelectorAll('.nav-link');

//   tabs.forEach((tab) => {
//     tab.addEventListener('click', (event) => {
//       event.preventDefault();
//       const tabId = event.target.getAttribute('href');

//       // Save the ID of the selected tab to a Cookie
//       Cookies.set('selectedTab', tabId);

//       // Toggle the display of tabs
//       document.querySelectorAll('.tab-pane').forEach((pane) => {
//         pane.classList.remove('active');
//       });

//       document.querySelector(tabId).classList.add('active');
//     });
//   });

//   // Open the saved tab on page reload
//   const selectedTab = Cookies.get('selectedTab');

//   if (selectedTab) {
//     tabs.forEach((tab) => {
//       if (tab.getAttribute('href') === selectedTab) {
//         tab.click(); // Click the selected tab to make it active
//       }
//     });
//   }
// });

import Cookies from 'js-cookie';

document.addEventListener('turbo:load', () => {
  const tabs = document.querySelectorAll('.nav-link');

  tabs.forEach((tab) => {
    tab.addEventListener('click', (event) => {
      event.preventDefault();
      const tabId = event.target.getAttribute('href');

      // Save the ID of the selected tab to a Cookie
      Cookies.set('selectedTab', tabId);

      // Toggle the display of tabs
      document.querySelectorAll('.tab-pane').forEach((pane) => {
        pane.classList.remove('active');
      });

      document.querySelector(tabId).classList.add('active');
    });
  });

  // Open the saved tab on page load
  const selectedTab = Cookies.get('selectedTab');

  if (selectedTab) {
    tabs.forEach((tab) => {
      if (tab.getAttribute('href') === selectedTab) {
        tab.click(); // Click the selected tab to make it active
      }
    });
  }
});
