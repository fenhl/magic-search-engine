class FormatRavinicaBlock < Format
  def format_pretty_name
    "Ravnica Block"
  end

  def build_included_sets
    Set["rav", "gpt", "dis"]
  end
end
