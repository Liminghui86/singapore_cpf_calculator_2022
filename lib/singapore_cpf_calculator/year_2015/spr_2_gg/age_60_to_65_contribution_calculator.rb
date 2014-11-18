module SingaporeCPFCalculator
  module Year2015
    module SPR2GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 60 to 65.
      class Age60To65ContributionCalculator < Year2015::Base

        extend Requirements::GroupAbove60To65Years

        private

        def tc_rate_1
          "0.035"
        end

        def tc_rate_2
          "0.11"
        end

        def ec_rate
          "0.075"
        end

        def adjustment_rate
          "0.225"
        end

      end

    end
  end
end
