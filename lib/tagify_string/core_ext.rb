require "active_support/all"

# Add tagify methods to string
String.class_eval do
  def tagify(options = {})
    default_options = {:upcase => true}
    opts = default_options.merge(options)

    output = self.parameterize
    opts[:upcase] ? output.upcase : output.downcase
  end

  def tagify!(options = {})
    replace self.tagify(options)
  end
end
