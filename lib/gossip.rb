require 'csv'
require 'pry'

class Gossip
  @@file_path = File.join(File.dirname(__FILE__), "../db/gossip.csv")
  attr_accessor :content, :author, :all_gossips

  def initialize (author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open(@@file_path,"a+") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach(@@file_path) do |ligne|
    all_gossips << Gossip.new(ligne[0],ligne[1])
    end
    return all_gossips
  end

  def find (id)
    all_gossips_2 = []
    CSV.foreach(@@file_path) do |ligne|
    all_gossips_2 << Gossip.new(ligne[0],ligne[1])
    end
    return all_gossips_2[id]
  end

end

# binding.pry
