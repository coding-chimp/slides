table.table.is-hoverable
  thead
    tr
  tbody
    - presentations.each do |presentation|
      tr.clickable data-href="/#{presentation.id}"
        td = presentation.title
        td align="right"
          == link_to("Edit", "/#{presentation.id}/edit", class: "button is-small is-info")
