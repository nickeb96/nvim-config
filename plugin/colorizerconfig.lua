
local has_module, colorizer = pcall(require, "colorizer")
if has_module then
  colorizer.setup(
    {
      "lua",
      "html",
      ["css"] = {
        css = true,
        css_fn = true,
      },
    }, {
      RRGGBB = true,
      RGB = false,
      names  = false,
      RRGGBBAA = false,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,
      mode = "foreground",
    }
  )
end

