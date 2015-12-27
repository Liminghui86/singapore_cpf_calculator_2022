module SingaporeCPFCalculator
  module Year2016
    module SPR2FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 65 and above.
      class Age65UpContributionCalculator < Year2016::Base

        extend Requirements::GroupAbove65Years

        private

        def tc_rate_1
          "0.075"
        end

        def tc_rate_2
          "0.125"
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
