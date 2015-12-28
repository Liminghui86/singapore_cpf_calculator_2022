module SingaporeCPFCalculator
  module Year2016
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2016::Base

        extend Requirements::GroupAbove55To60Years

        private

        def tc_rate_1
          "0.13"
        end

        def tc_rate_2
          "0.26"
        end

        def ec_rate
          "0.13"
        end

        def adjustment_rate
          "0.39"
        end

      end

    end
  end
end
