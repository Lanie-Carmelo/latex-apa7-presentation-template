function Div(div)
  if div.identifier == 'refs' then
    return {
      pandoc.Header(1, "References"),
      div
    }
  end
end
