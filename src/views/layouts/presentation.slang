doctype html
html
  head
    title Slides using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    link rel="stylesheet" href="/dist/presentation.bundle.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"

  body== content

    script src="/dist/presentation.bundle.js"

    - if Amber.settings.auto_reload?
      script src="/js/client_reload.js"
