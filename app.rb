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
  end/app

  def run
    puts "Welcome to School library App!\n"
  end
end
