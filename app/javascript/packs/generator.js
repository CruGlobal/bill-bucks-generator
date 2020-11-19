$(() => {
  console.log("dom ready")

  $('.heart-btn').on('click', () => {
    $('body').addClass('love-font');
  });
});