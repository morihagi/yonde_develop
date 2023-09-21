import Cookies from 'js-cookie';

document.addEventListener('turbo:load', () => {
  const tabs = document.querySelectorAll('#myTab .nav-link');

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

      const targetPane = document.querySelector(tabId);
      if (targetPane) {
        targetPane.classList.add('active');
      } else {
        console.error(`No element found for selector ${tabId}`);
      }
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
