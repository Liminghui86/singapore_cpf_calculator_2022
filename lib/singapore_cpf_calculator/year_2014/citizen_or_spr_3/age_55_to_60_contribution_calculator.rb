module SingaporeCPFCalculator
  module Year2014
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2014::Base

        extend Requirements::GroupAbove55To60Years

        private

        def tc_rate_1
          "0.105"
        end

        def tc_rate_2
          "0.235"
        end

        def adjustment_rate
          "0.39"
        end

        def ec_rate
          "0.13"
        end

      end

    end
  end
end
