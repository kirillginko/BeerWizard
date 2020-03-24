//= require rails-ujs
//= require_tree .
reviewRating =
$(document).ready(function() {
  $('.review-rating').raty({
      readOnly: true,
      score: function() {
          return $(this).attr('data-score');
      },
      path: '/assets/'
  });
});

averageRating =
$(document).ready(function() {
  $('.average-review-rating').raty({
      readOnly: true,
      path: '/assets/',
      score: function() {
          return $(this).attr('data-score');
      },
  });
});


