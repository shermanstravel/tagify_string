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

  context "up case and down case" do
    it "defaults to upcase" do
      "a".tagify.should eq "A"
    end

    it "recognizes downcase option" do
      "A".tagify(:upcase => false).should eq "a"
    end
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
end
