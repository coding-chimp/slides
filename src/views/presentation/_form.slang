- if presentation.errors
  ul.errors
    - presentation.errors.each do |error|
      li = error.to_s

== form(action: "/#{presentation.id.to_s}", method: presentation.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: presentation.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "body", content: presentation.body, placeholder: "Body", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/", class: "btn btn-light btn-sm")
