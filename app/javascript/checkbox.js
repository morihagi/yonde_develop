document.addEventListener('turbo:render', function() {
  // Get the checkbox element
  var checkBox = document.getElementById('check_default');

  // Get each input element
  var zipCodeInput = document.getElementById('post_zip_code');
  var prefectureInput = document.getElementById('post_prefecture');
  var cityInput = document.getElementById('post_city');
  var otherAddressInput = document.getElementById('post_other_address');
  var phoneInput = document.getElementById('post_phone');
  var legalNameInput = document.getElementById('post_legal_name');

  // Handling the change of the checkbox state
  checkBox.addEventListener('change', function() {
    // Check if the checkbox is checked
    var isChecked = checkBox.checked;

    // Enable or disable the disabled property for each input
    zipCodeInput.disabled = !isChecked;
    prefectureInput.disabled = !isChecked;
    cityInput.disabled = !isChecked;
    otherAddressInput.disabled = !isChecked;
    phoneInput.disabled = !isChecked;
    legalNameInput.disabled = !isChecked;
  });

  // Handling form submission
  var form = document.getElementById('submit_form');
  form.addEventListener('turbo:click', function(event) {
    // Check if the checkbox is checked and adjust the form data accordingly
    var isChecked = checkBox.checked;

    // Modify the form data based on the checkbox state
    if (!isChecked) {
      // If the checkbox is not checked, add the logic to clear default information
      zipCodeInput.value='';
      zipCodeInput.value ='';
      prefectureInput.value ='';
      cityInput.value ='';
      otherAddressInput.value ='';
      phoneInput.value ='';
      legalNameInput.value ='';
    }
  });
});
