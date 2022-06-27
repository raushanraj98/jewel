const facebook = document.querySelector('.facebook');
const instagram = document.querySelector('.instagram');
const pinterest = document.querySelector('.pinterest');

const url = location.href;

facebook.addEventListener('click',()=>{
  let shareUrl = `http://www.facebook.com/sharer/sharer.phpu=${url}`;
  window.open(shareUrl,"NewWindow" );  
})

pinterest.addEventListener('click',()=>{
  let shareUrl = `http://pinterest.com/pin/create/button/?url=${url}`;
  window.open(shareUrl,"NewWindow" );  
})

instagram.addEventListener('click',()=>{
  let shareUrl = `http://www.instagram.com/?url=${url}`;
  window.open(shareUrl,"NewWindow" );  
})
