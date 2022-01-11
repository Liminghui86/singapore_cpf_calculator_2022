module SingaporeCPFCalculator
  module Year2016
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 65 and above.
      class Age65UpContributionCalculator < CitizenOrSpr3Base

        extend Requirements::GroupAbove65Years

        private

        def tc_rate_1
          "0.075"
        end

        def tc_rate_2
          "0.14"
        end

        def ec_rate
          "0.06"
        end

        def adjustment_rate
          "0.15"
        end

      end

    end
  end
end
