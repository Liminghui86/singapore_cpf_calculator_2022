module SingaporeCPFCalculator

  # The contribution rates in respect of an employee above 35, 50, 55, 60 or 65 years of age
  # shall be applied from the first day of the month after the month of his 35th, 50th, 55th,
  # 60th or 65th birthday.
  class AgeGroup

    class << self

      # @param [Date] current_date
      # @param [Date] birthdate
      # @return [Symbol] the symbol representation of the age group
      #   - :group_50_years_and_below
      #   - :group_above_50_to_55_years
      #   - :group_above_55_to_60_years
      #   - :group_above_60_to_65_years
      #   - :group_above_65_years
      def get(current_date, birthdate:)
        new(current_date, birthdate: birthdate).get
      end
    end

    # @param [Date] current_date
    # @param [Date] birthdate:
    def initialize(current_date, birthdate:)
      @current_date = current_date
      @birthdate = birthdate
    end

    # @return [Symbol] the symbol representation of the age group
    #   - :group_50_years_and_below
    #   - :group_above_50_to_55_years
    #   - :group_above_55_to_60_years
    #   - :group_above_60_to_65_years
    #   - :group_above_65_years
    def get
      case
      when age < 50
        :group_50_years_and_below
      when 50 <= age && age < 55
        :group_above_50_to_55_years
      when 55 <= age && age < 60
        :group_above_55_to_60_years
      when 60 <= age && age < 65
        :group_above_60_to_65_years
      else # 65 <= age
        :group_above_65_years
      end
    end

    private

    attr_reader :current_date, :birthdate

    def age
      @age ||= effective_age
    end

    def effective_age
      age_by_year = current_date.year - birthdate.year

      if current_date.month > birthdate.month
        age_by_year
      else
        age_by_year - 1
      end
    end

  end

end
