---
  layout: js_minifier
---
/* eslint no-undef: "error" */
/* eslint-env browser */

  let randomNumber = Math.floor(Math.random() * 100) + 1

const guesses = document.querySelector('.guesses')
const lastResult = document.querySelector('.lastResult')
const lowOrHi = document.querySelector('.lowOrHi')

const guessSubmit = document.querySelector('.guessSubmit')
const guessField = document.querySelector('.guessField')

let guessCount = 1
let resetButton

const userGuess = Number(guessField.value)

$(() => {
  guessSubmit.addEventListener('click', checkGuess)
})

const checkGuess = () => {
  if (guessCount === 1) {
    guesses.textContent = 'Previous guesses: '
  }
  guesses.textContent += userGuess + ' '

  if (userGuess === randomNumber) {
    lastResult.textContent = 'Congratulations! You got it right'
    lastResult.style.backgroundColor = 'green'
    lowOrHi.textContent = ''
  } else if (guessCount === 10) {
    lastResult.textContent = '!!! GAME OVER !!!'
    setGameOver()
  } else {
    compareResult(userGuess, randomNumber)
  }

  guessCount++
  guessField.value = ''
  guessField.focus()
}

const resetGame = () => {
  guessCount = 1

  const resetParas = document.querySelectorAll('.resultParas p')
  for (let i = 0; i < resetParas.length; i++) {
    resetParas[i].textContent = ''
  }

  resetButton.parentNode.removeChild(resetButton)

  guessField.disabled = guessSubmit.disabled = false
  guessField.value = ''
  guessField.focus()

  lastResult.style.backgroundColor = 'white'

  randomNumber = Math.floor(Math.random() * 100) + 1
}

const setGameOver = () => {
  guessField.disabled = guessSubmit.disabled = true
  resetButton = document.createElement('button')
  resetButton.textContent = 'Start new game'
  document.body.append(resetButton)
  resetButton.addEventListener('click', resetGame)
}

const compareResult = (userGuess, randomNumber) => {
  lastResult.textContent = 'Wrong!'
  lastResult.style.backgroundColor = 'red'
  if (userGuess < randomNumber) {
    lowOrHi.textContent = 'Last guess was too low!'
  } else if (userGuess > randomNumber) {
    lowOrHi.textContent = 'Last guess was too high'
  }
}
