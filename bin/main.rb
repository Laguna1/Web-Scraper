# 'Inconsistent indentation detected.'.freeze

require_relative '../lib/scraper5'

class Start < Scraper
  def initialize
    @scraper = Scraper.new
  end

  def welcome
    puts

    puts

    puts

    puts '**********************************************************************************************************'

    puts '***                                             "Hello!"                                                ***'

    puts '***                   "Here you can find out about the main attractions and monuments"                  ***'

    puts '***                           "of the beautiful Ukrainian city Kharkiv."                                ***'

    puts '***                                       "Please choose y/n"                                           ***'

    puts '**********************************************************************************************************'
  end

  def user_answer
    loop do
      answer = gets.chomp.downcase

      if answer == 'y'

        puts '************************************************************************************************'

        puts '                                         "Let\'s start!"                                        '

        puts '************************************************************************************************'

        puts

        sleep 0.5

        break

      elsif answer == 'n'

        puts 'This is a very beautiful city, maybe choose "y"?'

      else

        puts 'It seems you work too hard, take care of yourself'

      end
    end

    pp scrape_showplaces

    puts

    puts

    puts

    puts '**************************************"Good luck!"**********************************************'
  end
end

scraper = Start.new

scraper.welcome

scraper.user_answer

scraper.scrape_showplaces

scraper.export_to_csv
