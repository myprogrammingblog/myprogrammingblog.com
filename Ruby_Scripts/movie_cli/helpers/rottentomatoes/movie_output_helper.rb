require 'colorize'

module RottenTomatoes
  module MovieOutputHelper

    def show
      %{

        Title:  #{@title.bold}
        Year:   #{@year}
        Runtime:  #{@runtime}
        Ratings:
          - Critics:  #{ format_score(@ratings['critics_score']) }
          - Audience: #{ format_score(@ratings['audience_score']) }
          #{ @cast.empty? ? '' : "\n\t\tCast:"+ print_cast_and_characters}
          #{ @synopsis.empty? ? '' : "\n\t\tPlot:\n\n\t\t\t#{@synopsis}"}
      }
    end

    protected

    def format_score(score)
      score_string = score.to_s
      if score == -1
        return 'not specified'
      elsif score >= 75
        "#{score_string}%".colorize(:green).bold
      elsif score < 75 && score > 60
        "#{score_string}%".colorize(:yellow).bold
      elsif score <= 60
        "#{score_string}%".colorize(:red).bold
      end
    end


    def print_cast_and_characters
      output = "\n"
      @cast.each do |actor|
        if actor.has_key?('characters')
          output +=
              "\t\t\t"+ actor['name'].bold + " as " + actor['characters'].join(',') + "\n"
        else
          output += "\t\t\t" + actor['name'].bold + "\n"
        end
      end
      output
    end

  end
end