document.addEventListener('turbo:render', function() {
  // Get the URL parameters
  const urlParams = new URLSearchParams(window.location.search);

  // Get the button and accordion elements
  var button = document.querySelector('.accordion-button');
  var accordion = document.querySelector('.accordion-collapse');

  // Check if the URL contains the desired parameters
  if ( urlParams.has('q[segment_program_id_eq]') ||
      urlParams.has('q[segment_id_eq]') ||
      urlParams.has('q[body_cont]') ||
      urlParams.has('q[created_at_gteq]') ||
      urlParams.has('q[created_at_lteq_end_of_day]')
    )
    {
    // Open the accordion by removing the 'collapsed' class
    button.classList.remove('collapsed');
    button.setAttribute('aria-expanded', 'true');
    accordion.classList.add('show');
    }
});
