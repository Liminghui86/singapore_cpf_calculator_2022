module SingaporeCPFCalculator
  module Year2016
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 60 to 65.
      class Age60To65ContributionCalculator < CitizenOrSpr3Base

        extend Requirements::GroupAbove60To65Years

        private

        def tc_rate_1
          "0.09"
        end

        def tc_rate_2
          "0.185"
        end

        def ec_rate
          "0.085"
        end

        def adjustment_rate
          "0.225"
        end

      end

    end
  end
end
