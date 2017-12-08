console.log("response from AJAX");
console.log("<p> <%= @flats.name%> <p>" );

var jsCardsWrapper = $(".js-cards-wrapper")[0];

console.log(jsCardsWrapper );


jsCardsWrapper.html("hello");
