/* global $, Image */

const images = {}

function preload () {
  images.bill = new Image()
  images.bill.src = '/bill.png'
  images.vonette = new Image()
  images.vonette.src = '/vonette.png'
  images.mag = new Image()
  images.mag.src = '/mag.png'
  images.cap = new Image()
  images.cap.src = '/cap.png'
}

$(() => {
  preload()
  console.log('dom ready')

  $('.heart-btn').on('click', () => {
    $('body').addClass('love-font')
  })

  $('.radio').on('click', () => {
    const billValue = $('.radio:checked').val()
    document.getElementById('img').src = images[billValue].src
  })
})
