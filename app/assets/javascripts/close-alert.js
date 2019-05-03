document.addEventListener('turbolinks:load', function() {
  setTimeout(() => {
    $('.alert').slideUp(300);
  }, 3000);
});
