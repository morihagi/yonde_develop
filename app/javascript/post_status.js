var csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

document.addEventListener('click', function(event) {
  if (event.target.matches('#mail-link')) {
    var postId = event.target.getAttribute('data-post-id');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/posts/' + postId + '/update_status', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-CSRF-Token', csrfToken);
    xhr.onload = function() {
      if (xhr.status === 200) {
        var badge = document.getElementById('post-status-badge');
        badge.innerHTML = 'メールアプリに転送済み';
        badge.className = 'badge text-bg-light border';
      } else {
        console.error('Error updating post status:', xhr.responseText);
        alert('An error occurred while updating the post status. Please try again.');
        }
        };
        xhr.onerror = function() {
        console.error('Request failed:', xhr.responseText);
        alert('An error occurred while sending the request. Please check your network connection and try again.');
        }
      };
    xhr.send();
  });
