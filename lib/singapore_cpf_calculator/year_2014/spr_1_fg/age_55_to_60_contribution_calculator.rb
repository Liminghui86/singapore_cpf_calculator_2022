module SingaporeCPFCalculator
  module Year2014
    module SPR1FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2014::Base

        extend Requirements::GroupAbove55To60Years

        private

        def tc_rate_1
          "0.105"
        end

        def tc_rate_2
          "0.155"
        end

        def adjustment_rate
          "0.15"
        end

        def ec_rate
          "0.05"
        end

      end

    end
  end
end
