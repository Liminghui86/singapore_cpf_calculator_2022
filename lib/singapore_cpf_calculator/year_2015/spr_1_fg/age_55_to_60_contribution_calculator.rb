module SingaporeCPFCalculator
  module Year2015
    module SPR1FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2015::Base

        extend Requirements::GroupAbove55To60Years

        private

        def tc_rate_1
          "0.12"
        end

        def tc_rate_2
          "0.17"
        end

        def ec_rate
          "0.05"
        end

        def adjustment_rate
          "0.15"
        end

      end

    end
  end
end
