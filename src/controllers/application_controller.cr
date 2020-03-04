require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers

  LAYOUT = "application.slang"
  NOTIFICATION_MAPPING = {
    "success": "is-success",
    "warning": "is-warning",
    "danger": "is-danger"
  }

  private def navbar_item(name, path)
    active_class = context.request.path == path ? "is-active" : ""

    link_to(name, path, class: "navbar-item #{active_class}")
  end

  private def notification_class(key)
    NOTIFICATION_MAPPING[key]?
  end
end
