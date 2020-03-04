doctype html
html
  head
    title Slides using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    link rel="stylesheet" href="/dist/main.bundle.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"

  body
    nav.navbar.is-primary role="navigation" aria-label="main navigation"
      .navbar-menu
        .navbar-start
          == render(partial: "layouts/_nav.slang")
        .navbar-end
          == render(partial: "layouts/_session.slang")

    section.section
      .container.is-fluid
        - flash.each do |key, value|
          .notification class=notification_class(key) role="alert"
            button.delete
            = flash[key]

        .content.is-medium== content

    script src="/dist/main.bundle.js"

    - if Amber.settings.auto_reload?
      script src="/js/client_reload.js"
