module SingaporeCPFCalculator
  module Year2015
    module SPR2FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2015::Base

        extend Requirements::GroupAbove55To60Years

        private

        def tc_rate_1
          "0.12"
        end

        def tc_rate_2
          "0.245"
        end

        def ec_rate
          "0.125"
        end

        def adjustment_rate
          "0.375"
        end

      end

    end
  end
end
