module UserFeedback
  def notify_created(title)
    puts "#{title.capitalize} created successfuly!\n"
  end

  def notify_start_creation(title)
    puts "Creating a #{title}..."
  end
end
