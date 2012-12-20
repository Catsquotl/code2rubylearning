require 'clippy'
require_relative "../lib/code2rubylearning/version"

module Code2rubylearning
  attr_reader :files,:switches
  @files = []
  @switches = []
  args = %w{-i -s test.rb}
  until args.first.to_s.include?('-') == false
    tmp_switch = args.shift
    @switches.push(tmp_switch)
  end

  until args.empty?
    tmp_file = args.shift
    @files.push(tmp_file)
  end

  class Reformat
    def reformat_to_rubylearning file_name
      File.open(file_name,"r") do |txt|
        @file_text = txt.read
      end
      @file_text.gsub!('<' ,'&lt;')
      @ref_file = "[code ruby]\n" << @file_text << '[/code]'
    end
  end


  # Your code goes here...
  extend self
  def copy_clipboard data
    Clippy.copy data
  end

  def paste_clipboard
    Clippy.paste
  end

end
