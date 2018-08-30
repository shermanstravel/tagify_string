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
    if Rails::VERSION::MAJOR >= 5
      output = self.gsub("_", " ").gsub("'", "").parameterize(separator: opts[:sep])
    else
      output = self.gsub("_", " ").gsub("'", "").parameterize(opts[:sep])
    end

    return "" if output.length == 0

    # Otherwise, attach prefix, process for case and send back.
    if prefix.present?
      if Rails::VERSION::MAJOR >= 5
        output = [prefix, output].join(" ").parameterize(separator: opts[:sep])
      else
        output = [prefix, output].join(" ").parameterize(opts[:sep])
      end
    end

    opts[:upcase] ? output.upcase : output.downcase
  end

  def tagify!(options = {})
    replace self.tagify(options)
  end

  def taggify(options = {})
    default_options = {:upcase => false, :sep => "-"}
    opts = default_options.merge(options)
    tagify(opts)
  end

  def taggify!(options = {})
    replace self.taggify(options)
  end
end
