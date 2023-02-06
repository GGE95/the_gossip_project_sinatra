require 'csv'
require 'pry'

class Gossip
  @@file_path = File.join(File.dirname(__FILE__), "../db/gossip.csv")
  attr_accessor :content, :author

  def initialize (author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open(@@file_path,"a+") do |csv|
      csv << [@author, @content]
    end
  end

end

#binding.pry
