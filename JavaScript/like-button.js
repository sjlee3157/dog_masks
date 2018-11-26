const makeLikeBtn = (tweetId) => {
  let likes = 0;

  const div = $(`
    <div>
      <p>${likes}</p>
      <button>Like</button>
    </div>
  `);

  $('button', div).click( () => {
    likes += 1;

    $('p', div).html(likes);

// Do something now that they've liked the tweet
// Maybe send an API call
    console.log(`Liked tweet # ${tweetId}`);
  });

  $('body').append(div);
};


$(document).ready(() => {
  makeLikeBtn(3423235234234);
  makeLikeBtn(3423235234234);
  makeLikeBtn(3423235234234);
});
