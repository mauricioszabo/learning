class String
  def titleize
    gsub(" ", "-").downcase
  end
end

puts "Dust in high sea".titleize
