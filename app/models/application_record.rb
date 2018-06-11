class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def print_errors
    if self.errors.any? 
      puts "Errors: "
      self.errors.full_messages.each do |message| 
        puts message 
      end
    end
  end
end
