# encoding: utf-8
# This allows using extended characters in the file

require File.expand_path("spec/spec_helper")

describe "String" do
  it "downcases a string" do
    "aB".taggify.should eq "ab"
  end

  it "removes commas" do
    ",a,B,".taggify.should eq "a-b"
  end

  it "removed quotes" do
    "Martha's Vineyard".taggify.should eq('marthas-vineyard')
  end

  it "switches punctuated chars for unpunctuated" do
    "São Paulo".taggify.should eq('sao-paulo')
    "Cancún".taggify.should eq('cancun')
  end

  it "removes dots" do
    ".a.B.".taggify.should eq "a-b"
    ".a...B.".taggify.should eq "a-b"
    ".a. B.".taggify.should eq "a-b"
  end

  it "replaces spaces with dashes" do
    "a b c".taggify.should eq "a-b-c"
  end

  it "squishes" do
    " a    b  c   ".taggify.should eq "a-b-c"
  end

  it "gracefully handles an empty string" do
    "".taggify.should eq ""
  end

  it "ASCII-ifies extended characters" do
    "àáâãäåÇÈÉÊËÌ".taggify.should eq "aaaaaaceeeei"
  end

  it "parties like it's 1999" do
    " +a-  .,.,, . &&()@,  ##b .  . c#-d    ".taggify.should eq "a-b-c-d"
  end

  it "returns an empty string if all garbage is presented" do
    "@%%@+_)(*&^%$@!".taggify.should eq ""
  end

  it "@\#@\#\$@# 22353 family Cádiz" do
    "@\#@\#\$@# 22353 family Cádiz".taggify.should eq "22353-family-cadiz"
  end

  context "with a bang" do
    it "changes the value of the string" do
      s = "a,b".taggify!
      s.should eq "a-b"
    end

    it "changes the value of the string with options" do
      s = "a,b".taggify!(:upcase => true)
      s.should eq "A-B"
    end
  end

  context "options" do
    context "up case and down case" do
      it "defaults to upcase" do
        "a".taggify.should eq "a"
      end

      it "recognizes downcase option" do
        "a".taggify(:upcase => true).should eq "A"
      end
    end

    it "uses indicated separator character" do
      "a b".taggify(:sep => "+").should eq "a+b"
    end

    context "indicated prefix" do
      it "uses indicated prefix" do
        "a b".taggify(:prefix => "ho-ho-ho").should eq "ho-ho-ho-a-b"
      end

      it "uses indicated prefix and smashes other prefixes" do
        "a b".taggify(:prefix => "ho-ho-ho", :gtto => true).should eq "ho-ho-ho-a-b"
      end
    end

    context "gt tag" do
      it "puts a t tag if indicated" do
        "Cleveland".taggify(:t => true).should eq "t-cleveland"
      end

      it "puts a gtto tag if indicated" do
        "Cleveland".taggify(:gtto => true).should eq "gtto-cleveland"
      end

      it "puts a gtfrom tag if indicated" do
        "Cleveland".taggify(:gtfrom => true).should eq "gtfrom-cleveland"
      end

      it "puts a gt tag with proper case if indicated" do
        "Cleveland".taggify(:gtfrom => true, :upcase => true).should eq "GTFROM-CLEVELAND"
      end
    end
  end
end
