var c = document.getElementById('canv');
var $ = c.getContext('2d');

var w = c.width = window.innerWidth;
var h = c.height = window.innerHeight;
var my_gradient=$.createLinearGradient(0,0,0,940);
my_gradient.addColorStop(0,"#4036fb");
my_gradient.addColorStop(1,"#5b53ff");

var draw = function(a, b, t) {
  $.lineWidth = 0.5;
  $.fillStyle = my_gradient; //'hsla(243, 96%, 60%,0.1)';
  $.fillRect(0, 0, w, h);
  for (var i = -60; i < 30; i += 1) {
    $.strokeStyle = 'hsla(85, 25%, 100%, 0.1)';
    $.beginPath();
    $.moveTo(0, h);
    for (var j = -10; j < w; j += 7) {
      $.lineTo(10 * Math.cos(i / 10) +
        j + 0.008 * j * j,
        Math.floor(h / 2 + j / 2 *
          Math.sin(j / 50 - t / 80 - i / 118) +
          (i * 0.6) * Math.cos(j / 25 - (i + t) / 65)));
    };
    $.stroke();
  }
}
var t = 0;

window.addEventListener('resize', function() {
  c.width = w = window.innerWidth;
  c.height = h = window.innerHeight;
  $.fillStyle = 'hsla(277, 95%, 55%, 1)';
}, false);

var run = function() {
  window.requestAnimationFrame(run);
  t += 1.2;
  draw(33, 52 * Math.sin(t / 400), t);
};

run();