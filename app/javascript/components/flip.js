function flipCard() {
  const cards = document.querySelectorAll(".cardo");

  const flip = (event) => {
    event.currentTarget.classList.toggle('flipped');
  }

  cards.forEach ((card) => {
    card.addEventListener("click", flip)
  });
}

export { flipCard };

