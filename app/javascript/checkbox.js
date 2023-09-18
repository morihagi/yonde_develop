document.addEventListener('turbo:load', function() {
  // チェックボックス要素を取得
  var checkBox = document.getElementById('check_default');

  // 各input要素を取得
  var zipCodeInput = document.getElementById('post_zip_code');
  var prefectureInput = document.getElementById('post_prefecture');
  var cityInput = document.getElementById('post_city');
  var otherAddressInput = document.getElementById('post_other_address');
  var phoneInput = document.getElementById('post_phone');
  var legalNameInput = document.getElementById('post_legal_name');

  // チェックボックスの状態が変更されたときの処理
  checkBox.addEventListener('change', function() {
    // チェックボックスがチェックされているかどうかを確認
    var isChecked = checkBox.checked;

    // 各inputのdisabledプロパティを無効または有効にする
    zipCodeInput.disabled = !isChecked;
    prefectureInput.disabled = !isChecked;
    cityInput.disabled = !isChecked;
    otherAddressInput.disabled = !isChecked;
    phoneInput.disabled = !isChecked;
    legalNameInput.disabled = !isChecked;
  });

  // フォームがサブミットされるときの処理
  var form = document.getElementById('submit_form');
  form.addEventListener('turbo:click', function(event) {
    // チェックボックスの状態をフォームデータに含めるかどうかを確認
    var isChecked = checkBox.checked;

    // チェックボックスの状態に基づいてフォームデータを調整
    if (!isChecked) {
      // チェックボックスがチェックされていない場合、デフォルト情報を削除する処理を追加
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
