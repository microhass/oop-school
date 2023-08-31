# Classes
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

# Modules
require_relative 'modules/app_logic'
require_relative 'modules/data_fetchers'
require_relative 'modules/data_presenters'
require_relative 'modules/input_validators'
require_relative 'modules/object_creators'
require_relative 'modules/user_feedback'

class App
  include AppLogic
  include DataFetchers
  include DataPresenters
  include InputValidators
  include ObjectCreators
  include UserFeedback

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts "Welcome to School library App!\n"
  end
end
