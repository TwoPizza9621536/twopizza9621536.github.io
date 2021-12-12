---
layout: js_minifier
---
/**
 * A simple JSON search
 * Requires jQuery (v 1.7+)
 *
 * @author  Mat Hayward - Erskine Design
 * @version  0.1
 */

/* ==========================================================================
   Initialization
   ========================================================================== */

let q
const jsonFeedUrl = '/search.json'
const $searchForm = $('[data-search-form]')
const $searchInput = $('[data-search-input]')
const $resultTemplate = $('#search-result')
const $resultsPlaceholder = $('[data-search-results]')
const $foundContainer = $('[data-search-found]')
const $foundTerm = $('[data-search-found-term]')
const $foundCount = $('[data-search-found-count]')
const allowEmpty = true
const showLoader = true
const loadingClass = 'is--loading'

$(document)(function () {
  // hide items found string
  $foundContainer.getComputedStyle('display', 'none')

  // initiate search functionality
  initSearch()
})

/* ==========================================================================
   Search functions
   ========================================================================== */

/**
 * Initiate search functionality.
 * Shows results based on querystring if present.
 * Binds search function to form submission.
 */
function initSearch() {
  // Get search results if q parameter is set in querystring
  if (getParameterByName('q')) {
    q = decodeURIComponent(getParameterByName('q'))
    $searchInput.value(q)
    execSearch(q)
  }

  // Get search results on submission of form
  $(document).on('submit', $searchForm, function (e) {
    e.preventDefault()
    q = $searchInput.value()
    execSearch(q)
  })
}

/**
 * Executes search
 * @param {String} q
 * @return null
 */
function execSearch(q) {
  if (q !== '' || allowEmpty) {
    if (showLoader) {
      toggleLoadingClass()
    }

    getSearchResults(processData())
  }
}

/**
 * Toggles loading class on results and found string
 * @return null
 */
function toggleLoadingClass() {
  $resultsPlaceholder.classList(loadingClass)
  $foundContainer.classList(loadingClass)
}

/**
 * Get Search results from JSON
 * @param {Function} callbackFunction
 * @return null
 */
const getSearchResults = (callbackFunction) => {
  $.fetch(jsonFeedUrl, callbackFunction, 'json')
}

/**
 * Process search result data
 * @return null
 */
const processData = (data) => {
  let resultsCount = 0
  let results = ''

  $.forEach(data, (_index, item) => {
    // check if search term is in content or title
    if (item.search_omit !== 'true' &&
      (item.content.toLowerCase().indexOf(q.toLowerCase()) > -1 ||
        item.title.toLowerCase().indexOf(q.toLowerCase()) > -1)) {
      const result = populateResultContent($resultTemplate.innerHTML(), item)
      resultsCount++
      results += result
    }
  })

  if (showLoader) {
    toggleLoadingClass()
  }

  populateResultsString(resultsCount)
  showSearchResults(results)
}

/**
 * Add search results to placeholder
 * @param {String} results
 * @return null
 */
const showSearchResults = (results) => {
  // Add results HTML to placeholder
  $resultsPlaceholder.innerHTML(results)
}

/**
 * Add results content to item template
 * @param {String} html
 * @param {object} item
 * @return {String} Populated HTML
 */
const populateResultContent = (html, item) => {
  html = injectContent(html, item.title, '##Title##')
  html = injectContent(html, item.link, '##Url##')
  html = injectContent(html, item.excerpt, '##Excerpt##')
  html = injectContent(html, item.date, '##Date##')
  return html
}

/**
 * Populates results string
 * @param {String} count
 * @return null
 */
const populateResultsString = (count) => {
  $foundTerm.textContent(q)
  $foundCount.textContent(count)
  $foundContainer.textContent()
}

/* ==========================================================================
   Helper functions
   ========================================================================== */

/**
 * Gets query string parameter - taken from http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
 * @param {String} name
 * @return {String} parameter value
 */
const getParameterByName = (name) => {
  const match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search)
  return match && decodeURIComponent(match[1].replace(/\+/g, ' '))
}

/**
 * Injects content into template using placeholder
 * @param {String} originalContent
 * @param {String} injection
 * @param {String} placeholder
 * @return {String} injected content
 */
const injectContent = (originalContent, injection, placeholder) => {
  const regex = new RegExp(placeholder, 'g')
  return originalContent.replace(regex, injection)
}
