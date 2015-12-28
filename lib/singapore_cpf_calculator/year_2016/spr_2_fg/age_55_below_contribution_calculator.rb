module SingaporeCPFCalculator
  module Year2016
    module SPR2FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age55BelowContributionCalculator < Year2016::Base

        extend Requirements::Group55YearsAndBelow

        private

        def tc_rate_1
          "0.17"
        end

        def tc_rate_2
          "0.32"
        end

        def ec_rate
          "0.15"
        end

        def adjustment_rate
          "0.45"
        end

      end

    end
  end
end
