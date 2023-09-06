# Classes
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

# Modules
require_relative 'modules/app/app_logic'
require_relative 'modules/app/data_fetchers'
require_relative 'modules/app/data_presenters'
require_relative 'modules/app/input_validators'
require_relative 'modules/app/object_creators'
require_relative 'modules/app/user_feedback'

# File management
require_relative 'modules/storage/data_savers'
require_relative 'modules/storage/data_loaders'

class App
  include AppLogic
  include DataFetchers
  include DataPresenters
  include InputValidators
  include ObjectCreators
  include UserFeedback

  include DataSavers
  include DataLoaders

  def initialize
    @people = load_people()
    @books = load_books()
    @rentals = load_rentals()
  end

  def run
    puts "Welcome to School library App!\n"
  end
end
