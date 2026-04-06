local colors = {
  gray     = '#3C3C3C',
  lightred = '#D16969',
  blue     = '#569CD6',
  pink     = '#C586C0',
  black    = '#000000',
  white    = '#D4D4D4',
  green    = '#608B4E',
}

return {
  normal = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.green, bg = 'None' },
    c = { fg = colors.white, bg = 'None'},
  },
  visual = {
    a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
    b = { fg = colors.pink, bg = 'None' },
  },
  inactive = {
    a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
    b = { fg = colors.black, bg = colors.blue },
  },
  replace = {
    a = { fg = colors.black, bg = colors.lightred, gui = 'bold' },
    b = { fg = colors.lightred, bg = 'None' },
    c = { fg = colors.white, bg = 'None' },
  },
  insert = {
    a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = 'None' },
    c = { fg = colors.white, bg = 'None' },
  },
}
