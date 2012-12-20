require_relative "./minitest_helper"
require_relative '../lib/code2rubylearning'


describe Code2rubylearning do
    let (:c2rl){Code2rubylearning}

  it "must be a module" do 
    c2rl.must_be_kind_of Module
  end

  it "must hold an array of switches" do
    c2rl::switches.must_be_kind_of Array
    c2rl::switches[0].must_equal '-i'
  end

  it "must hold an Array of files" do
   c2rl::files.must_be_kind_of Array 
  end

end
