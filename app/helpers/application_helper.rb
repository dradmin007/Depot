module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)

    attributes["style"] = ""
    if condition
      attributes["style"] = "display: none;"
    end
    content_tag("div", attributes, &block)
  end
end
