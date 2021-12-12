---
layout: js_minifier
---
/**
 * This file is from StackOverflow.
 * Random color generator https://stackoverflow.com/a/1484514
 * by user Anatoliy https://stackoverflow.com/users/161832 and
 * Paolo Forgia https://stackoverflow.com/users/1685157
 * under CC BY-SA 3.0 Unported https://creativecommons.org/licenses/by-sa/3.0/
 */

function getRandomColor () {
    'use strict'
    const letters = '0123456789ABCDEF'
    let color = '#'
    for (let i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)]
    }
    return color
}

$(() => {
  'use strict'
  let counter = 0
  $('.test').on('click', () => {
    counter += 1
    if (counter < 5) {
      $('.test').css('background-color', '#159957')
    } else if (counter < 10) {
      $('.test').css('background-color', '#1e6bb8')
    } else {
      $('.test').css('background-color', getRandomColor())
    }
    console.log(
      'If you can see this. JavaScript is enabled. ' +
      'This also means jQuery is also working.'
    )
  })
})
