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

    # The Sonia Clause.  Check for all garbage characters.  Return an empty string in this case.
    output = self.gsub("_", "").parameterize(opts[:sep])
    return "" if output.length == 0

    # Otherwise, attach prefix, process for case and send back.
    output = [prefix, self].join(" ").parameterize(opts[:sep])
    opts[:upcase] ? output.upcase : output.downcase
  end

  def tagify!(options = {})
    replace self.tagify(options)
  end
end
