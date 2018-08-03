import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initUpdateIconOnScroll } from '../components/navbar';
import { hasBanner } from '../components/navbar';

import { flipCard } from '../components/flip.js'

console.log('hello from webpacker')
initUpdateNavbarOnScroll();
// initUpdateIconOnScroll ();
flipCard();

