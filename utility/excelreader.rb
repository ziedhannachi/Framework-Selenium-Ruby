require 'roo'

def read_excel (filePath, sheetName, row, col)
  xlsx = Roo::Spreadsheet.open(filePath)
  return xlsx.sheet(sheetName).cell(row,col)
end