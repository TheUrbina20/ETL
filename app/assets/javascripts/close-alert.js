document.addEventListener('turbolinks:load', function() {
  setTimeout(() => {
    $('.alert').fadeOut();
  }, 3000);
});
