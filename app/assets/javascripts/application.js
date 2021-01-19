// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery.raty.js
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function() {
    $('.hamburger').click(function() {
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) {
            $('.globalMenuSp').addClass('active');
        } else {
            $('.globalMenuSp').removeClass('active');
        }
    });
});

//sns share
$(function(){
  var url = location.href;
  var title = $('title').html();

  // twitter
  var text = encodeURIComponent(title);
  var tweet_url = 'http://twitter.com/share?url=' + url + '&text=' + text;
  $('a.js-twitter-share').attr("href", tweet_url);

  // facebook
  var facebook_url = 'https://www.facebook.com/sharer/sharer.php?u=' + url;
  $('a.js-facebook-share').attr("href", facebook_url);

  // LINE
  $('.js-line-share').off('click');
  $('.js-line-share').on('click', function(){
    var message = title + ' ' + url;
    var shareLink = 'http://line.me/R/msg/text/?' + encodeURIComponent(message);
    window.open(shareLink, '_blank');
  });
});
