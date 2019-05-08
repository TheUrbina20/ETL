document.addEventListener('turbolinks:load', function() {
  setTimeout(() => {
    $('.alert').slideUp(1000);
  }, 3000);
});
