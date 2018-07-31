function flipCard() {
  const cards = document.querySelectorAll(".card");

  const flip = (event) => {
    event.currentTarget.classList.toggle('flipped');
  }

  cards.forEach ((card) => {
    card.addEventListener("click", flip)
  });
}

export { flipCard };

