# encoding: utf-8
# This allows using extended characters in the file

require File.expand_path("spec/spec_helper")

describe "String" do
  it "capitalizes a string" do
    "aB".tagify.should eq "AB"
  end

  it "removes commas" do
    ",a,B,".tagify.should eq "A-B"
  end

  it "removes dots" do
    ".a.B.".tagify.should eq "A-B"
  end

  it "replaces spaces with dashes" do
    "a b c".tagify.should eq "A-B-C"
  end

  it "squishes" do
    " a    b  c   ".tagify.should eq "A-B-C"
  end

  it "gracefully handles an empty string" do
    "".tagify.should eq ""
  end

  it "ASCII-ifies extended characters" do
    "àáâãäåÇÈÉÊËÌ".tagify.should eq "AAAAAACEEEEI"
  end

  it "parties like it's 1999" do
    " +a-  .,.,, . &&()@,  ##b .  . c#-d    ".tagify.should eq "A-B-C-D"
  end

  it "returns an empty string if all garbage is presented" do
    "@%%@+_)(*&^%$@!".tagify.should eq ""
  end

  it "@\#@\#\$@# 22353 family Cádiz" do
    "@\#@\#\$@# 22353 family Cádiz".tagify.should eq "22353-FAMILY-CADIZ"
  end

  context "with a bang" do
    it "changes the value of the string" do
      s = "a,b".tagify!
      s.should eq "A-B"
    end

    it "changes the value of the string with options" do
      s = "a,b".tagify!(:upcase => false)
      s.should eq "a-b"
    end
  end

  context "options" do
    context "up case and down case" do
      it "defaults to upcase" do
        "a".tagify.should eq "A"
      end

      it "recognizes downcase option" do
        "A".tagify(:upcase => false).should eq "a"
      end
    end

    it "uses indicated separator character" do
      "a b".tagify(:sep => "+").should eq "A+B"
    end

    context "indicated prefix" do
      it "uses indicated prefix" do
        "a b".tagify(:prefix => "ho-ho-ho").should eq "HO-HO-HO-A-B"
      end

      it "uses indicated prefix and smashes other prefixes" do
        "a b".tagify(:prefix => "ho-ho-ho", :gtto => true).should eq "HO-HO-HO-A-B"
      end
    end

    context "gt tag" do
      it "puts a t tag if indicated" do
        "Cleveland".tagify(:t => true).should eq "T-CLEVELAND"
      end

      it "puts a gtto tag if indicated" do
        "Cleveland".tagify(:gtto => true).should eq "GTTO-CLEVELAND"
      end

      it "puts a gtfrom tag if indicated" do
        "Cleveland".tagify(:gtfrom => true).should eq "GTFROM-CLEVELAND"
      end

      it "puts a gt tag with proper case if indicated" do
        "Cleveland".tagify(:gtfrom => true, :upcase => false).should eq "gtfrom-cleveland"
      end
    end
  end
end
