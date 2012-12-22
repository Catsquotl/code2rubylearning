require 'clippy'
require_relative "../lib/code2rubylearning/version"

module Code2rubylearning
  attr_reader :files,:switches
  @files = []
  @switches = []
  com_input = ARGV

  def parse_command_line com_input=[]
    "Nothing to do" unless com_input

    until com_input.first.to_s.include?('-') == false
      tmp_switch = com_input.shift
      @switches.push(tmp_switch)
    end

    until com_input.empty?
      tmp_file = com_input.shift
      @files.push(tmp_file)
    end
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
