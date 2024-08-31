// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// import 'bootstrap'
//= require rails-ujs
//= require activestorage
//= require_tree .
// //= require popper
// //= require bootstrap-sprockets

document.querySelectorAll('.estate').forEach(element => {
    element.addEventListener('mouseover', () => {
      element.style.transform = 'scale(1.1)';
      element.style.transition = 'transform 0.3s ease';
    });
  
    element.addEventListener('mouseout', () => {
      element.style.transform = 'scale(1)';
    });
  });
  