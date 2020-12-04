$(() => {
  preload();
  console.log("dom ready");

  $(".heart-btn").on("click", () => {
    $("body").addClass("love-font");
  });

  $(".radio").on("click", () => {
    var bill_value = $(".radio:checked").val();
    document.getElementById("img").src = eval(bill_value + ".src");
  });
});

function preload() {
  bill = new Image();
  bill.src = "/bill.png";
  vonette = new Image();
  vonette.src = "/vonette.png";
  mary = new Image();
  mary.src = "/mary.png";
  roman = new Image();
  roman.src = "/roman.png";
}
