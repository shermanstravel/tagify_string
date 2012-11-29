require "active_support/all"

# Add tagify methods to string
String.class_eval do
  def tagify(options = {})
    default_options = {:upcase => true, :sep => "-"}
    opts = default_options.merge(options)

    prefix = ""

    if opts.has_key?(:prefix)
      prefix = opts[:prefix]
    else
      # Prefix is exclusive
      if opts[:gtto]
        prefix = "gtto"
      end

      if opts[:gtfrom]
        prefix = "gtfrom"
      end

      if opts[:t]
        prefix = "t"
      end
    end

    output = [prefix, self].join(" ").parameterize(opts[:sep])
    opts[:upcase] ? output.upcase : output.downcase
  end

  def tagify!(options = {})
    replace self.tagify(options)
  end
end
