- if presentation.errors
  ul.errors
    - presentation.errors.each do |error|
      li = error.to_s

== form(action: "/#{presentation.id.to_s}", method: presentation.id ? :patch : :post) do
  == csrf_tag

  .field
    == label(:title, class: "label")
    .control
      == text_field(name: "title", value: presentation.title, placeholder: "Title", class: "input")

  .field
    == label(:body, class: "label")
    .control
      == text_area(name: "body", content: presentation.body, placeholder: "Body", class: "textarea", rows: "10")

  .columns
    .column
      == link_to("Delete", "/#{ presentation.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "button is-danger")
    .column.has-text-right
      == submit("Submit", class: "button is-primary")
