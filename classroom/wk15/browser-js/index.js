// index.js
// index.js
// console.log('This is a test');

// let target = document.getElementById('js-lecture-target');  // Find the HTML element where the ID is js-lecture-target
// target.innerHTML = '<p>I give you... content!</p>'; // Put this HTML inside the div we retrieved above
const pets = [
  {
    name: 'kylo', species: 'dog', human: 'kari', mammal: true
  },
  {
    name: 'gecky', species: 'lizard', human: 'dan', mammal: false
  },
  {
    name: 'hedwig', species: 'owl', human: 'harry', mammal: false
  },
  {
    name: 'crookshanks', species: 'cat', human: 'hermione', mammal: true
  },
  {
    name: 'scabbers', species: 'rat', human: 'ron', mammal: true
  },
];

function capitalizeString(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}

pets.forEach( pet => {
  Object.keys(pet).forEach( function(key) {
    if (key != 'mammal') {
      pet[key] = capitalizeString(pet[key]);
      // console.log(pet[key]);
    }
  });
});

$(document).ready(function() {

  $('.table').append('<thead id= "table-head">');
  $('.table').append('<tbody id= "table-body">');
  $('#table-head').append('<tr id ="table-row">');

  Object.keys(pets[0]).forEach( key => {
    if (key != 'mammal') {
      $('#table-row').append('<th scope="col">' + capitalizeString(key) + '</th>');
    }
  });

  pets.forEach( pet => {
    let listItem = $('<tr>' + '<th scope="row">' + pet.name + '</th>' + '<td>'+ pet.species + '</td>' +
      '<td>' + pet.human + '</td>' + '</tr>');
    if (pet.mammal) {
      listItem.addClass('bg-info');
    } else {
      listItem.addClass('bg-danger');
    }
    $('#table-body').append(listItem);
  });
});
