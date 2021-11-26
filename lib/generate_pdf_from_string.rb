class GeneratePdfFromString
  def self.call(render_to_string)
    WickedPdf.new.pdf_from_string(render_to_string)
  end
end
