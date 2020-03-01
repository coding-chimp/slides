class Presentation < Granite::Base
  connection pg
  table presentations

  column id : Int64, primary: true
  column title : String?
  column body : String?
  timestamps

  validate_not_blank :title
  validate_not_blank :body

  def slides
    return [] of String if body.nil?

    body
      .not_nil!
      .split("---")
      .map { |slide| Markd.to_html(slide) }
  end
end
