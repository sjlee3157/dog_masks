// index.js
const URL = 'https://petdibs.herokuapp.com/pets';

const reportStatus = (message) => {
  $('#status-message').html(message);
};

const reportError = (message, errors) => {
  let content = `<p>${message}</p>`
  content += "<ul>";
  for (const field in errors) {
    for (const problem of errors[field]) {
      content += `<li>${field}: ${problem}</li>`;
    }
  }
  content += "</ul>";
  reportStatus(content);
};

const loadPets = () => {
  // Prep work
  const petList = $('#pet-list');
  petList.empty();

  reportStatus('<strong>Loading pets...</strong>');

  // Actually load the pets
  axios.get(URL)
    .then((response) => {
      reportStatus(`Successfully loaded ${response.data.length} pets`);
      response.data.forEach((pet) => {
        petList.append(`<li>${pet.name}</li>`);
      });
    })
    .catch((error) => {
     reportStatus(`Encountered an error while loading pets: ${error.message}`);
      console.log(error);
    });
  // reportStatus('<strong>Loading pets...</strong>');
  // this works because of asynchronicity?!
};

const readFormData = () => {
  let petForm = document.getElementById('pet-form');
  const petData = new FormData(petForm);
  // const curData = $(`#pet-form input[name="${curInput}"]`).val();
  return petData;
};

const clearForm = () => {
  $("#pet-form")[0].reset();
}
  // console.log($('#pet-form'));
  // console.log($('#pet-form')[0][0].value);

  // $('#pet-form').each(function() {
  //   this.reset();
  // });
  // $(`#pet-form input[name="name"]`).val('');
  // $(`#pet-form input[name="age"]`).val('');
  // $(`#pet-form input[name="owner"]`).val('');

const createPet = (event) => {
  // Note that createPet is a handler for a `submit`
  // event, which means we need to call `preventDefault`
  // to avoid a page reload
  event.preventDefault();

  reportStatus('Sending pet data...');

  // Later we'll read these values from a form
  // const petData = {
  //   name: 'Nymphadora Tonks!',
  //   age: 77,
  //   owner: 'samjo'
  // };

  axios.post(URL, readFormData())
    .then((response) => {
      console.log(response);
      reportStatus(`Successfully added a pet with ID ${response.data.id}!`);
      clearForm();
    })
    .catch((error) => {
      console.log(error.response);
      // Make sure the server actually sent us errors. If
 // there's a different problem, like a typo in the URL
 // or a network error, the response won't be filled in.
   if (error.response.data && error.response.data.errors) {
     // User our new helper method
     reportError(
       `Encountered an error: ${error.message}`,
       error.response.data.errors
     );
   } else {
     // This is what we had before
     reportStatus(`Encountered an error: ${error.message}`);
   }
  });
};

$(document).ready(() => {
  $('#load').click(loadPets);
  $('#pet-form').submit(createPet);
});
