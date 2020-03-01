.row
  .col-sm-11
    h2 Presentations
  .col-sm-1
    a.btn.btn-success.btn-sm href="/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Actions
    tbody
      - presentations.each do |presentation|
        tr
          td = presentation.title
          td
            span
              == link_to("Show", "/#{presentation.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/#{presentation.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/#{ presentation.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
