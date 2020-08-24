# OBSERVANT

A proof-of-concept webpage monitoring and alerts web app using Rails, Stimulus.js, and TailwindCSS.

## About

I put this together after using the excellent Distill.io app to find and buy gym equipment that kept
selling out quickly during the 2020 pandemic... mostly just to see what would be involved in
implementing something similar. I'd love to return to this and add more polish in the future, but
for now, here's what I have.

## Thoughts for Improvement

* Expand support for CSS selectors (in addition to XPATH currently implemented).
* Add the ability using Stimulus.js (and maybe StimulusReflex) to preview new and existing monitors.
Ideally reaching out and scraping the current page and displaying with and/or without the selectors.
* Add authentication using Devise or Sorcery.
* Add authorization using Pundit; associate and scope page monitors to users.
* Improve the UI and abstract bits of it using ViewComponent.
* Write tests. Yes I know... I should have done this already, it was quick evening project okay!
