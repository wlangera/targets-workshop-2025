local text = pandoc.text

function Header(el)
    if el.level == 1 then
      inbo_logo = pandoc.Image("Instituut voor Natuur- en Bosonderzoek", "inbo-nl-kleur.png")
      inbo_logo.attr = {class = "inbo-tussen"}
      vl_logo = pandoc.Image("Biodiversity building blocks for policy", "b3-logo.png")
      vl_logo.attr = {class = "vl-tussen"}
      return {
        el,
        pandoc.Div("", { class = "trapezium" }),
        pandoc.Div("", { class = "sidebar sidebar-tussen" }),
        vl_logo, inbo_logo,
        pandoc.Div("www.vlaanderen.be/inbo", { class = "sidebar-url-tussen" })
      }
    elseif el.level == 2 then
      vl_logo = pandoc.Image("Biodiversity building blocks for policy", "b3-logo.png")
      vl_logo.attr = {class = "vl-slide"}
      return { el, vl_logo }
    end
end
