require 'clippy'
require_relative "./code2rubylearning/version"

module Code2rubylearning
  @files = []
  @switches = []
  until ARGV.first.to_s.include?('-') == false
    tmp_switch = ARGV.shift
    @switches.push(tmp_switch)
  end

  until ARGV.empty?
    tmp_file = ARGV.shift
    @files.push(tmp_file)
  end

  def reformat_to_rubylearning file_name
    File.open(file_name,"r") do |txt|
      @file_text = txt.read
    end
    @file_text.gsub!('<' ,'&lt;')
    @ref_file = "[code ruby]\n" << @file_text << '[/code]'
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
