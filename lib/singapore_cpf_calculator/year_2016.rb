require_relative "year_2016/base"
require_relative "year_2016/citizen_or_spr_3"
require_relative "year_2016/spr_2_gg"
require_relative "year_2016/spr_2_fg"
require_relative "year_2016/spr_1_gg"
require_relative "year_2016/spr_1_fg"

module SingaporeCPFCalculator
  # Contains the calculators that are used for determining CPF contribution for 2014.
  module Year2016

    class << self

      include YearCommon

      # @param [Date] date when the CPF contribution is to be calculated for.
      # @return [true, false] true when the date's year is 2015
      def applies_to?(date)
        date.year >= 2016
      end

      private

      def residency_modules
        [
          CitizenOrSPR3,
          SPR2GG,
          SPR2FG,
          SPR1GG,
          SPR1FG,
          BeforeSPR,
        ]
      end

    end

  end
end
